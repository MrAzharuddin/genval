// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/elb/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#PolicyAttributeInitParameters: {
	name?: null | string @go(Name,*string)
}

#PolicyAttributeObservation: {
	name?:  null | string @go(Name,*string)
	value?: null | string @go(Value,*string)
}

#PolicyAttributeParameters: {
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/elb/v1beta1.Policy
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("policy_name",false)
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)

	// Reference to a Policy in elb to populate value.
	// +kubebuilder:validation:Optional
	valueRef?: null | v1.#Reference @go(ValueRef,*v1.Reference)

	// Selector for a Policy in elb to populate value.
	// +kubebuilder:validation:Optional
	valueSelector?: null | v1.#Selector @go(ValueSelector,*v1.Selector)
}

#PolicyInitParameters: {
	// Policy attribute to apply to the policy.
	policyAttribute?: [...#PolicyAttributeInitParameters] @go(PolicyAttribute,[]PolicyAttributeInitParameters)

	// The name of the load balancer policy.
	policyName?: null | string @go(PolicyName,*string)

	// The policy type.
	policyTypeName?: null | string @go(PolicyTypeName,*string)
}

#PolicyObservation: {
	// The ID of the policy.
	id?: null | string @go(ID,*string)

	// The load balancer on which the policy is defined.
	loadBalancerName?: null | string @go(LoadBalancerName,*string)

	// Policy attribute to apply to the policy.
	policyAttribute?: [...#PolicyAttributeObservation] @go(PolicyAttribute,[]PolicyAttributeObservation)

	// The name of the load balancer policy.
	policyName?: null | string @go(PolicyName,*string)

	// The policy type.
	policyTypeName?: null | string @go(PolicyTypeName,*string)
}

#PolicyParameters: {
	// The load balancer on which the policy is defined.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/elb/v1beta1.ELB
	// +kubebuilder:validation:Optional
	loadBalancerName?: null | string @go(LoadBalancerName,*string)

	// Reference to a ELB in elb to populate loadBalancerName.
	// +kubebuilder:validation:Optional
	loadBalancerNameRef?: null | v1.#Reference @go(LoadBalancerNameRef,*v1.Reference)

	// Selector for a ELB in elb to populate loadBalancerName.
	// +kubebuilder:validation:Optional
	loadBalancerNameSelector?: null | v1.#Selector @go(LoadBalancerNameSelector,*v1.Selector)

	// Policy attribute to apply to the policy.
	// +kubebuilder:validation:Optional
	policyAttribute?: [...#PolicyAttributeParameters] @go(PolicyAttribute,[]PolicyAttributeParameters)

	// The name of the load balancer policy.
	// +kubebuilder:validation:Optional
	policyName?: null | string @go(PolicyName,*string)

	// The policy type.
	// +kubebuilder:validation:Optional
	policyTypeName?: null | string @go(PolicyTypeName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// PolicySpec defines the desired state of Policy
#PolicySpec: {
	v1.#ResourceSpec
	forProvider: #PolicyParameters @go(ForProvider)

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
	initProvider?: #PolicyInitParameters @go(InitProvider)
}

// PolicyStatus defines the observed state of Policy.
#PolicyStatus: {
	v1.#ResourceStatus
	atProvider?: #PolicyObservation @go(AtProvider)
}

// Policy is the Schema for the Policys API. Provides a load balancer policy, which can be attached to an ELB listener or backend server.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Policy: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.policyName) || (has(self.initProvider) && has(self.initProvider.policyName))",message="spec.forProvider.policyName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.policyTypeName) || (has(self.initProvider) && has(self.initProvider.policyTypeName))",message="spec.forProvider.policyTypeName is a required parameter"
	spec:    #PolicySpec   @go(Spec)
	status?: #PolicyStatus @go(Status)
}

// PolicyList contains a list of Policys
#PolicyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Policy] @go(Items,[]Policy)
}
