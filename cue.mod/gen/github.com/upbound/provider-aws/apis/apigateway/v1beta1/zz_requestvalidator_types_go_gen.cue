// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apigateway/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#RequestValidatorInitParameters: {
	// Name of the request validator
	name?: null | string @go(Name,*string)

	// Boolean whether to validate request body. Defaults to false.
	validateRequestBody?: null | bool @go(ValidateRequestBody,*bool)

	// Boolean whether to validate request parameters. Defaults to false.
	validateRequestParameters?: null | bool @go(ValidateRequestParameters,*bool)
}

#RequestValidatorObservation: {
	// Unique ID of the request validator
	id?: null | string @go(ID,*string)

	// Name of the request validator
	name?: null | string @go(Name,*string)

	// ID of the associated Rest API
	restApiId?: null | string @go(RestAPIID,*string)

	// Boolean whether to validate request body. Defaults to false.
	validateRequestBody?: null | bool @go(ValidateRequestBody,*bool)

	// Boolean whether to validate request parameters. Defaults to false.
	validateRequestParameters?: null | bool @go(ValidateRequestParameters,*bool)
}

#RequestValidatorParameters: {
	// Name of the request validator
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// ID of the associated Rest API
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

	// Boolean whether to validate request body. Defaults to false.
	// +kubebuilder:validation:Optional
	validateRequestBody?: null | bool @go(ValidateRequestBody,*bool)

	// Boolean whether to validate request parameters. Defaults to false.
	// +kubebuilder:validation:Optional
	validateRequestParameters?: null | bool @go(ValidateRequestParameters,*bool)
}

// RequestValidatorSpec defines the desired state of RequestValidator
#RequestValidatorSpec: {
	v1.#ResourceSpec
	forProvider: #RequestValidatorParameters @go(ForProvider)

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
	initProvider?: #RequestValidatorInitParameters @go(InitProvider)
}

// RequestValidatorStatus defines the observed state of RequestValidator.
#RequestValidatorStatus: {
	v1.#ResourceStatus
	atProvider?: #RequestValidatorObservation @go(AtProvider)
}

// RequestValidator is the Schema for the RequestValidators API. Manages an API Gateway Request Validator.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#RequestValidator: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #RequestValidatorSpec   @go(Spec)
	status?: #RequestValidatorStatus @go(Status)
}

// RequestValidatorList contains a list of RequestValidators
#RequestValidatorList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#RequestValidator] @go(Items,[]RequestValidator)
}