// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apigateway/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#DocumentationPartInitParameters: {
	// Location of the targeted API entity of the to-be-created documentation part. See below.
	location?: [...#LocationInitParameters] @go(Location,[]LocationInitParameters)

	// Content map of API-specific key-value pairs describing the targeted API entity. The map must be encoded as a JSON string, e.g., "{ "description": "The API does ..." }". Only Swagger-compliant key-value pairs can be exported and, hence, published.
	properties?: null | string @go(Properties,*string)
}

#DocumentationPartObservation: {
	// Unique ID of the Documentation Part
	id?: null | string @go(ID,*string)

	// Location of the targeted API entity of the to-be-created documentation part. See below.
	location?: [...#LocationObservation] @go(Location,[]LocationObservation)

	// Content map of API-specific key-value pairs describing the targeted API entity. The map must be encoded as a JSON string, e.g., "{ "description": "The API does ..." }". Only Swagger-compliant key-value pairs can be exported and, hence, published.
	properties?: null | string @go(Properties,*string)

	// ID of the associated Rest API
	restApiId?: null | string @go(RestAPIID,*string)
}

#DocumentationPartParameters: {
	// Location of the targeted API entity of the to-be-created documentation part. See below.
	// +kubebuilder:validation:Optional
	location?: [...#LocationParameters] @go(Location,[]LocationParameters)

	// Content map of API-specific key-value pairs describing the targeted API entity. The map must be encoded as a JSON string, e.g., "{ "description": "The API does ..." }". Only Swagger-compliant key-value pairs can be exported and, hence, published.
	// +kubebuilder:validation:Optional
	properties?: null | string @go(Properties,*string)

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
}

#LocationInitParameters: {
	// HTTP verb of a method. The default value is * for any method.
	method?: null | string @go(Method,*string)

	// Name of the targeted API entity.
	name?: null | string @go(Name,*string)

	// URL path of the target. The default value is / for the root resource.
	path?: null | string @go(Path,*string)

	// HTTP status code of a response. The default value is * for any status code.
	statusCode?: null | string @go(StatusCode,*string)

	// Type of API entity to which the documentation content appliesE.g., API, METHOD or REQUEST_BODY
	type?: null | string @go(Type,*string)
}

#LocationObservation: {
	// HTTP verb of a method. The default value is * for any method.
	method?: null | string @go(Method,*string)

	// Name of the targeted API entity.
	name?: null | string @go(Name,*string)

	// URL path of the target. The default value is / for the root resource.
	path?: null | string @go(Path,*string)

	// HTTP status code of a response. The default value is * for any status code.
	statusCode?: null | string @go(StatusCode,*string)

	// Type of API entity to which the documentation content appliesE.g., API, METHOD or REQUEST_BODY
	type?: null | string @go(Type,*string)
}

#LocationParameters: {
	// HTTP verb of a method. The default value is * for any method.
	// +kubebuilder:validation:Optional
	method?: null | string @go(Method,*string)

	// Name of the targeted API entity.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// URL path of the target. The default value is / for the root resource.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// HTTP status code of a response. The default value is * for any status code.
	// +kubebuilder:validation:Optional
	statusCode?: null | string @go(StatusCode,*string)

	// Type of API entity to which the documentation content appliesE.g., API, METHOD or REQUEST_BODY
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// DocumentationPartSpec defines the desired state of DocumentationPart
#DocumentationPartSpec: {
	v1.#ResourceSpec
	forProvider: #DocumentationPartParameters @go(ForProvider)

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
	initProvider?: #DocumentationPartInitParameters @go(InitProvider)
}

// DocumentationPartStatus defines the observed state of DocumentationPart.
#DocumentationPartStatus: {
	v1.#ResourceStatus
	atProvider?: #DocumentationPartObservation @go(AtProvider)
}

// DocumentationPart is the Schema for the DocumentationParts API. Provides a settings of an API Gateway Documentation Part.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DocumentationPart: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.properties) || (has(self.initProvider) && has(self.initProvider.properties))",message="spec.forProvider.properties is a required parameter"
	spec:    #DocumentationPartSpec   @go(Spec)
	status?: #DocumentationPartStatus @go(Status)
}

// DocumentationPartList contains a list of DocumentationParts
#DocumentationPartList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#DocumentationPart] @go(Items,[]DocumentationPart)
}
