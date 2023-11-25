// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/servicecatalog/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ConstraintInitParameters: {
	// Language code. Valid values: en (English), jp (Japanese), zh (Chinese). Default value is en.
	acceptLanguage?: null | string @go(AcceptLanguage,*string)

	// Description of the constraint.
	description?: null | string @go(Description,*string)

	// Constraint parameters in JSON format. The syntax depends on the constraint type. See details below.
	parameters?: null | string @go(Parameters,*string)

	// Type of constraint. Valid values are LAUNCH, NOTIFICATION, RESOURCE_UPDATE, STACKSET, and TEMPLATE.
	type?: null | string @go(Type,*string)
}

#ConstraintObservation: {
	// Language code. Valid values: en (English), jp (Japanese), zh (Chinese). Default value is en.
	acceptLanguage?: null | string @go(AcceptLanguage,*string)

	// Description of the constraint.
	description?: null | string @go(Description,*string)

	// Constraint identifier.
	id?: null | string @go(ID,*string)

	// Owner of the constraint.
	owner?: null | string @go(Owner,*string)

	// Constraint parameters in JSON format. The syntax depends on the constraint type. See details below.
	parameters?: null | string @go(Parameters,*string)

	// Portfolio identifier.
	portfolioId?: null | string @go(PortfolioID,*string)

	// Product identifier.
	productId?: null | string @go(ProductID,*string)
	status?:    null | string @go(Status,*string)

	// Type of constraint. Valid values are LAUNCH, NOTIFICATION, RESOURCE_UPDATE, STACKSET, and TEMPLATE.
	type?: null | string @go(Type,*string)
}

#ConstraintParameters: {
	// Language code. Valid values: en (English), jp (Japanese), zh (Chinese). Default value is en.
	// +kubebuilder:validation:Optional
	acceptLanguage?: null | string @go(AcceptLanguage,*string)

	// Description of the constraint.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Constraint parameters in JSON format. The syntax depends on the constraint type. See details below.
	// +kubebuilder:validation:Optional
	parameters?: null | string @go(Parameters,*string)

	// Portfolio identifier.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/servicecatalog/v1beta1.Portfolio
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	portfolioId?: null | string @go(PortfolioID,*string)

	// Reference to a Portfolio in servicecatalog to populate portfolioId.
	// +kubebuilder:validation:Optional
	portfolioIdRef?: null | v1.#Reference @go(PortfolioIDRef,*v1.Reference)

	// Selector for a Portfolio in servicecatalog to populate portfolioId.
	// +kubebuilder:validation:Optional
	portfolioIdSelector?: null | v1.#Selector @go(PortfolioIDSelector,*v1.Selector)

	// Product identifier.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/servicecatalog/v1beta1.Product
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	productId?: null | string @go(ProductID,*string)

	// Reference to a Product in servicecatalog to populate productId.
	// +kubebuilder:validation:Optional
	productIdRef?: null | v1.#Reference @go(ProductIDRef,*v1.Reference)

	// Selector for a Product in servicecatalog to populate productId.
	// +kubebuilder:validation:Optional
	productIdSelector?: null | v1.#Selector @go(ProductIDSelector,*v1.Selector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Type of constraint. Valid values are LAUNCH, NOTIFICATION, RESOURCE_UPDATE, STACKSET, and TEMPLATE.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// ConstraintSpec defines the desired state of Constraint
#ConstraintSpec: {
	v1.#ResourceSpec
	forProvider: #ConstraintParameters @go(ForProvider)

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
	initProvider?: #ConstraintInitParameters @go(InitProvider)
}

// ConstraintStatus defines the observed state of Constraint.
#ConstraintStatus: {
	v1.#ResourceStatus
	atProvider?: #ConstraintObservation @go(AtProvider)
}

// Constraint is the Schema for the Constraints API. Manages a Service Catalog Constraint
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Constraint: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.parameters) || (has(self.initProvider) && has(self.initProvider.parameters))",message="spec.forProvider.parameters is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.type) || (has(self.initProvider) && has(self.initProvider.type))",message="spec.forProvider.type is a required parameter"
	spec:    #ConstraintSpec   @go(Spec)
	status?: #ConstraintStatus @go(Status)
}

// ConstraintList contains a list of Constraints
#ConstraintList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Constraint] @go(Items,[]Constraint)
}
