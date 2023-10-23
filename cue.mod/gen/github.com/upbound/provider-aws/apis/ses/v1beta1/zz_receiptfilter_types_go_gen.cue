// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ses/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ReceiptFilterInitParameters: {
	// The IP address or address range to filter, in CIDR notation
	cidr?: null | string @go(Cidr,*string)

	// Block or Allow
	policy?: null | string @go(Policy,*string)
}

#ReceiptFilterObservation: {
	// The SES receipt filter ARN.
	arn?: null | string @go(Arn,*string)

	// The IP address or address range to filter, in CIDR notation
	cidr?: null | string @go(Cidr,*string)

	// The SES receipt filter name.
	id?: null | string @go(ID,*string)

	// Block or Allow
	policy?: null | string @go(Policy,*string)
}

#ReceiptFilterParameters: {
	// The IP address or address range to filter, in CIDR notation
	// +kubebuilder:validation:Optional
	cidr?: null | string @go(Cidr,*string)

	// Block or Allow
	// +kubebuilder:validation:Optional
	policy?: null | string @go(Policy,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// ReceiptFilterSpec defines the desired state of ReceiptFilter
#ReceiptFilterSpec: {
	v1.#ResourceSpec
	forProvider: #ReceiptFilterParameters @go(ForProvider)

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
	initProvider?: #ReceiptFilterInitParameters @go(InitProvider)
}

// ReceiptFilterStatus defines the observed state of ReceiptFilter.
#ReceiptFilterStatus: {
	v1.#ResourceStatus
	atProvider?: #ReceiptFilterObservation @go(AtProvider)
}

// ReceiptFilter is the Schema for the ReceiptFilters API. Provides an SES receipt filter
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ReceiptFilter: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.cidr) || (has(self.initProvider) && has(self.initProvider.cidr))",message="spec.forProvider.cidr is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.policy) || (has(self.initProvider) && has(self.initProvider.policy))",message="spec.forProvider.policy is a required parameter"
	spec:    #ReceiptFilterSpec   @go(Spec)
	status?: #ReceiptFilterStatus @go(Status)
}

// ReceiptFilterList contains a list of ReceiptFilters
#ReceiptFilterList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ReceiptFilter] @go(Items,[]ReceiptFilter)
}