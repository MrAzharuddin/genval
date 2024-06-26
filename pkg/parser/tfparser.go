package parser

/*
	Following code has been borrowed and modified from:
	https://github.com/tenable/terrascan/blob/master/pkg/iac-providers/terraform/commons/convert.go
*/

import (
	"encoding/json"
	"fmt"
	"strings"

	hcl "github.com/hashicorp/hcl/v2"
	"github.com/hashicorp/hcl/v2/hclsyntax"
	"github.com/intelops/genval/pkg/utils"
	"github.com/zclconf/go-cty/cty"
	ctyconvert "github.com/zclconf/go-cty/cty/convert"
	ctyjson "github.com/zclconf/go-cty/cty/json"
)

type (
	jsonObj map[string]interface{}
	lineObj map[string]interface{}
)

type converter struct {
	bytes []byte
}

func (c *converter) rangeSource(r hcl.Range) string {
	return string(c.bytes[r.Start.Byte:r.End.Byte])
}

func (c *converter) convertBody(body *hclsyntax.Body) (jsonObj, lineObj, error) {
	var (
		err  error
		cfg  = make(jsonObj) // resource config
		lcfg = make(lineObj) // resource line config
	)

	// convert attributes
	for key, value := range body.Attributes {
		cfg[key], lcfg[key], err = c.convertExpression(value.Expr)
		if err != nil {
			return nil, nil, err
		}
	}

	// convert blocks (nested objects, lists)
	for _, block := range body.Blocks {

		var (
			bcfg  = make(jsonObj) // block resource config
			blcfg = make(lineObj) // block resource line config
		)

		err = c.convertBlock(block, bcfg, blcfg)
		if err != nil {
			return nil, nil, err
		}

		blockConfig := bcfg[block.Type].(jsonObj)
		lineCfg := blcfg[block.Type].(lineObj)
		if _, present := cfg[block.Type]; !present {
			cfg[block.Type] = []jsonObj{blockConfig}
			lcfg[block.Type] = []lineObj{lineCfg}
		} else {
			list := cfg[block.Type].([]jsonObj)
			list = append(list, blockConfig)
			cfg[block.Type] = list

			lineList := lcfg[block.Type].([]lineObj)
			lineList = append(lineList, lineCfg)
			lcfg[block.Type] = lineList
		}
	}

	return cfg, lcfg, nil
}

func (c *converter) convertBlock(block *hclsyntax.Block, cfg jsonObj, lcfg lineObj) error {
	key := block.Type

	value, blcfg, err := c.convertBody(block.Body)
	if err != nil {
		return err
	}

	for _, label := range block.Labels {
		if inner, exists := cfg[key]; exists {
			var ok bool
			cfg, ok = inner.(jsonObj)
			if !ok {
				return fmt.Errorf("unable to convert Block to JSON: %v.%v", block.Type, strings.Join(block.Labels, "."))
			}

			if innerLineObj := lcfg[key]; exists {
				lcfg, ok = innerLineObj.(lineObj)
				if !ok {
					return fmt.Errorf("unable to convert Block to JSON: %v.%v", block.Type, strings.Join(block.Labels, "."))
				}
			}

		} else {
			var (
				obj  = make(jsonObj)
				lobj = make(lineObj)
			)

			cfg[key] = obj
			cfg = obj

			lcfg[key] = lobj
			lcfg = lobj

		}
		key = label
	}

	// resource config for blocks
	if current, exists := cfg[key]; exists {
		if list, ok := current.([]interface{}); ok {
			cfg[key] = append(list, value)
		} else {
			cfg[key] = []interface{}{current, value}
		}
	} else {
		cfg[key] = value
	}

	// resource line config for blocks
	if current, exists := lcfg[key]; exists {
		if list, ok := current.([]interface{}); ok {
			lcfg[key] = append(list, blcfg)
		} else {
			lcfg[key] = []interface{}{current, blcfg}
		}
	} else {
		lcfg[key] = blcfg
	}

	return nil
}

func (c *converter) convertExpression(expr hclsyntax.Expression) (ret interface{}, line interface{}, err error) {
	// assume it is hcl syntax (because, um, it is)
	line = expr.StartRange().Start.Line
	switch value := expr.(type) {
	case *hclsyntax.LiteralValueExpr:
		return ctyjson.SimpleJSONValue{Value: value.Val}, line, nil
	case *hclsyntax.TemplateExpr:
		ret, err = c.convertTemplate(value)
		return
	case *hclsyntax.TemplateWrapExpr:
		return c.convertExpression(value.Wrapped)
	case *hclsyntax.TupleConsExpr:
		var list []interface{}
		for _, ex := range value.Exprs {
			elem, line, err := c.convertExpression(ex)
			if err != nil {
				return nil, line, err
			}
			list = append(list, elem)
		}
		return list, line, nil
	case *hclsyntax.ObjectConsExpr:
		m := make(jsonObj)
		l := make(lineObj)
		for _, item := range value.Items {
			key, err := c.convertKey(item.KeyExpr)
			if err != nil {
				return nil, line, err
			}
			m[key], l[key], err = c.convertExpression(item.ValueExpr)
			if err != nil {
				return nil, line, err
			}
		}
		return m, l, nil
	default:
		return c.wrapExpr(expr), line, nil
	}
}

func (c *converter) convertTemplate(t *hclsyntax.TemplateExpr) (string, error) {
	if t.IsStringLiteral() {
		// safe because the value is just the string
		v, err := t.Value(nil)
		if err != nil {
			return "", err
		}
		return v.AsString(), nil
	}
	var builder strings.Builder
	for _, part := range t.Parts {
		s, err := c.convertStringPart(part)
		if err != nil {
			return "", err
		}
		builder.WriteString(s)
	}
	return builder.String(), nil
}

func (c *converter) convertStringPart(expr hclsyntax.Expression) (string, error) {
	switch v := expr.(type) {
	case *hclsyntax.LiteralValueExpr:
		s, err := ctyconvert.Convert(v.Val, cty.String)
		if err != nil {
			return "", err
		}
		return s.AsString(), nil
	case *hclsyntax.TemplateExpr:
		return c.convertTemplate(v)
	case *hclsyntax.TemplateWrapExpr:
		return c.convertStringPart(v.Wrapped)
	case *hclsyntax.ConditionalExpr:
		return c.convertTemplateConditional(v)
	case *hclsyntax.TemplateJoinExpr:
		return c.convertTemplateFor(v.Tuple.(*hclsyntax.ForExpr))
	default:
		// treating as an embedded expression
		return c.wrapExpr(expr), nil
	}
}

func (c *converter) convertKey(keyExpr hclsyntax.Expression) (string, error) {
	// a key should never have dynamic input
	if k, isKeyExpr := keyExpr.(*hclsyntax.ObjectConsKeyExpr); isKeyExpr {
		keyExpr = k.Wrapped
		if _, isTraversal := keyExpr.(*hclsyntax.ScopeTraversalExpr); isTraversal {
			return c.rangeSource(keyExpr.Range()), nil
		}
	}
	return c.convertStringPart(keyExpr)
}

func (c *converter) convertTemplateConditional(expr *hclsyntax.ConditionalExpr) (string, error) {
	var builder strings.Builder
	builder.WriteString("%{if ")
	builder.WriteString(c.rangeSource(expr.Condition.Range()))
	builder.WriteString("}")
	trueResult, err := c.convertStringPart(expr.TrueResult)
	if err != nil {
		return "", nil
	}
	builder.WriteString(trueResult)
	falseResult, _ := c.convertStringPart(expr.FalseResult)
	if len(falseResult) > 0 {
		builder.WriteString("%{else}")
		builder.WriteString(falseResult)
	}
	builder.WriteString("%{endif}")

	return builder.String(), nil
}

func (c *converter) convertTemplateFor(expr *hclsyntax.ForExpr) (string, error) {
	var builder strings.Builder
	builder.WriteString("%{for ")
	if len(expr.KeyVar) > 0 {
		builder.WriteString(expr.KeyVar)
		builder.WriteString(", ")
	}
	builder.WriteString(expr.ValVar)
	builder.WriteString(" in ")
	builder.WriteString(c.rangeSource(expr.CollExpr.Range()))
	builder.WriteString("}")
	templ, err := c.convertStringPart(expr.ValExpr)
	if err != nil {
		return "", err
	}
	builder.WriteString(templ)
	builder.WriteString("%{endfor}")

	return builder.String(), nil
}

func (c *converter) wrapExpr(expr hclsyntax.Expression) string {
	return "${" + c.rangeSource(expr.Range()) + "}"
}

// ConvertTFtoJSON reads a Terraform file and converts it to JSON format.
func ConvertTFtoJSON(tfFilePath string) (string, error) {
	// Read the Terraform file
	tfData, err := utils.ReadFile(tfFilePath)
	if err != nil {
		return "", err
	}

	// Parse the Terraform file
	file, diags := hclsyntax.ParseConfig(tfData, tfFilePath, hcl.Pos{Byte: 0, Line: 1, Column: 1})
	if diags.HasErrors() {
		return "", diags
	}

	// Create a converter instance
	c := converter{bytes: tfData}

	// Ensure that file.Body is of the correct type
	hclBody, ok := file.Body.(*hclsyntax.Body)
	if !ok {
		return "", fmt.Errorf("file body is not of type *hclsyntax.Body")
	}

	// Convert the body of the file
	cfg, _, err := c.convertBody(hclBody)
	if err != nil {
		return "", err
	}

	// Convert the config to JSON
	jsonBytes, err := json.Marshal(cfg)
	if err != nil {
		return "", err
	}

	return string(jsonBytes), nil
}
