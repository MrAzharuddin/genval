// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/autoscaling/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#GroupTagInitParameters: {
	// Tag to create. The tag block is documented below.
	tag?: [...#GroupTagTagInitParameters] @go(Tag,[]GroupTagTagInitParameters)
}

#GroupTagObservation: {
	// Name of the Autoscaling Group to apply the tag to.
	autoscalingGroupName?: null | string @go(AutoscalingGroupName,*string)

	// ASG name and key, separated by a comma (,)
	id?: null | string @go(ID,*string)

	// Tag to create. The tag block is documented below.
	tag?: [...#GroupTagTagObservation] @go(Tag,[]GroupTagTagObservation)
}

#GroupTagParameters: {
	// Name of the Autoscaling Group to apply the tag to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/autoscaling/v1beta1.AutoscalingGroup
	// +kubebuilder:validation:Optional
	autoscalingGroupName?: null | string @go(AutoscalingGroupName,*string)

	// Reference to a AutoscalingGroup in autoscaling to populate autoscalingGroupName.
	// +kubebuilder:validation:Optional
	autoscalingGroupNameRef?: null | v1.#Reference @go(AutoscalingGroupNameRef,*v1.Reference)

	// Selector for a AutoscalingGroup in autoscaling to populate autoscalingGroupName.
	// +kubebuilder:validation:Optional
	autoscalingGroupNameSelector?: null | v1.#Selector @go(AutoscalingGroupNameSelector,*v1.Selector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Tag to create. The tag block is documented below.
	// +kubebuilder:validation:Optional
	tag?: [...#GroupTagTagParameters] @go(Tag,[]GroupTagTagParameters)
}

#GroupTagTagInitParameters: {
	// Tag name.
	key?: null | string @go(Key,*string)

	// Whether to propagate the tags to instances launched by the ASG.
	propagateAtLaunch?: null | bool @go(PropagateAtLaunch,*bool)

	// Tag value.
	value?: null | string @go(Value,*string)
}

#GroupTagTagObservation: {
	// Tag name.
	key?: null | string @go(Key,*string)

	// Whether to propagate the tags to instances launched by the ASG.
	propagateAtLaunch?: null | bool @go(PropagateAtLaunch,*bool)

	// Tag value.
	value?: null | string @go(Value,*string)
}

#GroupTagTagParameters: {
	// Tag name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)

	// Whether to propagate the tags to instances launched by the ASG.
	// +kubebuilder:validation:Optional
	propagateAtLaunch?: null | bool @go(PropagateAtLaunch,*bool)

	// Tag value.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

// GroupTagSpec defines the desired state of GroupTag
#GroupTagSpec: {
	v1.#ResourceSpec
	forProvider: #GroupTagParameters @go(ForProvider)

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
	initProvider?: #GroupTagInitParameters @go(InitProvider)
}

// GroupTagStatus defines the observed state of GroupTag.
#GroupTagStatus: {
	v1.#ResourceStatus
	atProvider?: #GroupTagObservation @go(AtProvider)
}

// GroupTag is the Schema for the GroupTags API. Manages an individual Autoscaling Group tag
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#GroupTag: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.tag) || (has(self.initProvider) && has(self.initProvider.tag))",message="spec.forProvider.tag is a required parameter"
	spec:    #GroupTagSpec   @go(Spec)
	status?: #GroupTagStatus @go(Status)
}

// GroupTagList contains a list of GroupTags
#GroupTagList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#GroupTag] @go(Items,[]GroupTag)
}