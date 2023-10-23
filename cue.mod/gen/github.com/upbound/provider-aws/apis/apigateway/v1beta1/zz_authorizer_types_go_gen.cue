// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apigateway/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AuthorizerInitParameters: {
	// TTL of cached authorizer results in seconds. Defaults to 300.
	authorizerResultTtlInSeconds?: null | float64 @go(AuthorizerResultTTLInSeconds,*float64)

	// Source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g., "method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName"
	identitySource?: null | string @go(IdentitySource,*string)

	// Validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response.
	identityValidationExpression?: null | string @go(IdentityValidationExpression,*string)

	// Name of the authorizer
	name?: null | string @go(Name,*string)

	// List of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}.
	providerArns?: [...null | string] @go(ProviderArns,[]*string)

	// Type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN.
	type?: null | string @go(Type,*string)
}

#AuthorizerObservation: {
	// ARN of the API Gateway Authorizer
	arn?: null | string @go(Arn,*string)

	// Credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN.
	authorizerCredentials?: null | string @go(AuthorizerCredentials,*string)

	// TTL of cached authorizer results in seconds. Defaults to 300.
	authorizerResultTtlInSeconds?: null | float64 @go(AuthorizerResultTTLInSeconds,*float64)

	// Authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api},
	// e.g., arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations
	authorizerUri?: null | string @go(AuthorizerURI,*string)

	// Authorizer identifier.
	id?: null | string @go(ID,*string)

	// Source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g., "method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName"
	identitySource?: null | string @go(IdentitySource,*string)

	// Validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response.
	identityValidationExpression?: null | string @go(IdentityValidationExpression,*string)

	// Name of the authorizer
	name?: null | string @go(Name,*string)

	// List of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}.
	providerArns?: [...null | string] @go(ProviderArns,[]*string)

	// ID of the associated REST API
	restApiId?: null | string @go(RestAPIID,*string)

	// Type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN.
	type?: null | string @go(Type,*string)
}

#AuthorizerParameters: {
	// Credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	authorizerCredentials?: null | string @go(AuthorizerCredentials,*string)

	// Reference to a Role in iam to populate authorizerCredentials.
	// +kubebuilder:validation:Optional
	authorizerCredentialsRef?: null | v1.#Reference @go(AuthorizerCredentialsRef,*v1.Reference)

	// Selector for a Role in iam to populate authorizerCredentials.
	// +kubebuilder:validation:Optional
	authorizerCredentialsSelector?: null | v1.#Selector @go(AuthorizerCredentialsSelector,*v1.Selector)

	// TTL of cached authorizer results in seconds. Defaults to 300.
	// +kubebuilder:validation:Optional
	authorizerResultTtlInSeconds?: null | float64 @go(AuthorizerResultTTLInSeconds,*float64)

	// Authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api},
	// e.g., arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/lambda/v1beta1.Function
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("invoke_arn",true)
	// +kubebuilder:validation:Optional
	authorizerUri?: null | string @go(AuthorizerURI,*string)

	// Reference to a Function in lambda to populate authorizerUri.
	// +kubebuilder:validation:Optional
	authorizerUriRef?: null | v1.#Reference @go(AuthorizerURIRef,*v1.Reference)

	// Selector for a Function in lambda to populate authorizerUri.
	// +kubebuilder:validation:Optional
	authorizerUriSelector?: null | v1.#Selector @go(AuthorizerURISelector,*v1.Selector)

	// Source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g., "method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName"
	// +kubebuilder:validation:Optional
	identitySource?: null | string @go(IdentitySource,*string)

	// Validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response.
	// +kubebuilder:validation:Optional
	identityValidationExpression?: null | string @go(IdentityValidationExpression,*string)

	// Name of the authorizer
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// List of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}.
	// +kubebuilder:validation:Optional
	providerArns?: [...null | string] @go(ProviderArns,[]*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// ID of the associated REST API
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apigateway/v1beta1.RestAPI
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	restApiId?: null | string @go(RestAPIID,*string)

	// Reference to a RestAPI in apigateway to populate restApiId.
	// +kubebuilder:validation:Optional
	restApiIdRef?: null | v1.#Reference @go(RestAPIIDRef,*v1.Reference)

	// Selector for a RestAPI in apigateway to populate restApiId.
	// +kubebuilder:validation:Optional
	restApiIdSelector?: null | v1.#Selector @go(RestAPIIDSelector,*v1.Selector)

	// Type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// AuthorizerSpec defines the desired state of Authorizer
#AuthorizerSpec: {
	v1.#ResourceSpec
	forProvider: #AuthorizerParameters @go(ForProvider)

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
	initProvider?: #AuthorizerInitParameters @go(InitProvider)
}

// AuthorizerStatus defines the observed state of Authorizer.
#AuthorizerStatus: {
	v1.#ResourceStatus
	atProvider?: #AuthorizerObservation @go(AtProvider)
}

// Authorizer is the Schema for the Authorizers API. Provides an API Gateway Authorizer.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Authorizer: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #AuthorizerSpec   @go(Spec)
	status?: #AuthorizerStatus @go(Status)
}

// AuthorizerList contains a list of Authorizers
#AuthorizerList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Authorizer] @go(Items,[]Authorizer)
}