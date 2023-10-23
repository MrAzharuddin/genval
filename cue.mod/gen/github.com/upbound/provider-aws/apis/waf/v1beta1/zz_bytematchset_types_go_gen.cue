// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/waf/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ByteMatchSetInitParameters: {
	// Specifies the bytes (typically a string that corresponds
	// with ASCII characters) that you want to search for in web requests,
	// the location in requests that you want to search, and other settings.
	byteMatchTuples?: [...#ByteMatchTuplesInitParameters] @go(ByteMatchTuples,[]ByteMatchTuplesInitParameters)

	// The name or description of the Byte Match Set.
	name?: null | string @go(Name,*string)
}

#ByteMatchSetObservation: {
	// Specifies the bytes (typically a string that corresponds
	// with ASCII characters) that you want to search for in web requests,
	// the location in requests that you want to search, and other settings.
	byteMatchTuples?: [...#ByteMatchTuplesObservation] @go(ByteMatchTuples,[]ByteMatchTuplesObservation)

	// The ID of the WAF Byte Match Set.
	id?: null | string @go(ID,*string)

	// The name or description of the Byte Match Set.
	name?: null | string @go(Name,*string)
}

#ByteMatchSetParameters: {
	// Specifies the bytes (typically a string that corresponds
	// with ASCII characters) that you want to search for in web requests,
	// the location in requests that you want to search, and other settings.
	// +kubebuilder:validation:Optional
	byteMatchTuples?: [...#ByteMatchTuplesParameters] @go(ByteMatchTuples,[]ByteMatchTuplesParameters)

	// The name or description of the Byte Match Set.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#ByteMatchTuplesInitParameters: {
	// The part of a web request that you want to search, such as a specified header or a query string.
	fieldToMatch?: [...#FieldToMatchInitParameters] @go(FieldToMatch,[]FieldToMatchInitParameters)

	// Within the portion of a web request that you want to search
	// (for example, in the query string, if any), specify where you want to search.
	// e.g., CONTAINS, CONTAINS_WORD or EXACTLY.
	// See docs
	// for all supported values.
	positionalConstraint?: null | string @go(PositionalConstraint,*string)

	// The value that you want to search for within the field specified by field_to_match, e.g., badrefer1.
	// See docs
	// for all supported values.
	targetString?: null | string @go(TargetString,*string)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on target_string before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	textTransformation?: null | string @go(TextTransformation,*string)
}

#ByteMatchTuplesObservation: {
	// The part of a web request that you want to search, such as a specified header or a query string.
	fieldToMatch?: [...#FieldToMatchObservation] @go(FieldToMatch,[]FieldToMatchObservation)

	// Within the portion of a web request that you want to search
	// (for example, in the query string, if any), specify where you want to search.
	// e.g., CONTAINS, CONTAINS_WORD or EXACTLY.
	// See docs
	// for all supported values.
	positionalConstraint?: null | string @go(PositionalConstraint,*string)

	// The value that you want to search for within the field specified by field_to_match, e.g., badrefer1.
	// See docs
	// for all supported values.
	targetString?: null | string @go(TargetString,*string)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on target_string before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	textTransformation?: null | string @go(TextTransformation,*string)
}

#ByteMatchTuplesParameters: {
	// The part of a web request that you want to search, such as a specified header or a query string.
	// +kubebuilder:validation:Optional
	fieldToMatch: [...#FieldToMatchParameters] @go(FieldToMatch,[]FieldToMatchParameters)

	// Within the portion of a web request that you want to search
	// (for example, in the query string, if any), specify where you want to search.
	// e.g., CONTAINS, CONTAINS_WORD or EXACTLY.
	// See docs
	// for all supported values.
	// +kubebuilder:validation:Optional
	positionalConstraint?: null | string @go(PositionalConstraint,*string)

	// The value that you want to search for within the field specified by field_to_match, e.g., badrefer1.
	// See docs
	// for all supported values.
	// +kubebuilder:validation:Optional
	targetString?: null | string @go(TargetString,*string)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on target_string before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	// +kubebuilder:validation:Optional
	textTransformation?: null | string @go(TextTransformation,*string)
}

#FieldToMatchInitParameters: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	type?: null | string @go(Type,*string)
}

#FieldToMatchObservation: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	type?: null | string @go(Type,*string)
}

#FieldToMatchParameters: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	// +kubebuilder:validation:Optional
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// ByteMatchSetSpec defines the desired state of ByteMatchSet
#ByteMatchSetSpec: {
	v1.#ResourceSpec
	forProvider: #ByteMatchSetParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #ByteMatchSetInitParameters @go(InitProvider)
}

// ByteMatchSetStatus defines the observed state of ByteMatchSet.
#ByteMatchSetStatus: {
	v1.#ResourceStatus
	atProvider?: #ByteMatchSetObservation @go(AtProvider)
}

// ByteMatchSet is the Schema for the ByteMatchSets API. Provides a AWS WAF Byte Match Set resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ByteMatchSet: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #ByteMatchSetSpec   @go(Spec)
	status?: #ByteMatchSetStatus @go(Status)
}

// ByteMatchSetList contains a list of ByteMatchSets
#ByteMatchSetList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ByteMatchSet] @go(Items,[]ByteMatchSet)
}