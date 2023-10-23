// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/mediaconvert/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#QueueInitParameters: {
	// A description of the queue
	description?: null | string @go(Description,*string)

	// Specifies whether the pricing plan for the queue is on-demand or reserved. Valid values are ON_DEMAND or RESERVED. Default to ON_DEMAND.
	pricingPlan?: null | string @go(PricingPlan,*string)

	// A detail pricing plan of the  reserved queue. See below.
	reservationPlanSettings?: [...#ReservationPlanSettingsInitParameters] @go(ReservationPlanSettings,[]ReservationPlanSettingsInitParameters)

	// A status of the queue. Valid values are ACTIVE or RESERVED. Default to PAUSED.
	status?: null | string @go(Status,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#QueueObservation: {
	// The Arn of the queue
	arn?: null | string @go(Arn,*string)

	// A description of the queue
	description?: null | string @go(Description,*string)

	// The same as name
	id?: null | string @go(ID,*string)

	// Specifies whether the pricing plan for the queue is on-demand or reserved. Valid values are ON_DEMAND or RESERVED. Default to ON_DEMAND.
	pricingPlan?: null | string @go(PricingPlan,*string)

	// A detail pricing plan of the  reserved queue. See below.
	reservationPlanSettings?: [...#ReservationPlanSettingsObservation] @go(ReservationPlanSettings,[]ReservationPlanSettingsObservation)

	// A status of the queue. Valid values are ACTIVE or RESERVED. Default to PAUSED.
	status?: null | string @go(Status,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#QueueParameters: {
	// A description of the queue
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Specifies whether the pricing plan for the queue is on-demand or reserved. Valid values are ON_DEMAND or RESERVED. Default to ON_DEMAND.
	// +kubebuilder:validation:Optional
	pricingPlan?: null | string @go(PricingPlan,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// A detail pricing plan of the  reserved queue. See below.
	// +kubebuilder:validation:Optional
	reservationPlanSettings?: [...#ReservationPlanSettingsParameters] @go(ReservationPlanSettings,[]ReservationPlanSettingsParameters)

	// A status of the queue. Valid values are ACTIVE or RESERVED. Default to PAUSED.
	// +kubebuilder:validation:Optional
	status?: null | string @go(Status,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#ReservationPlanSettingsInitParameters: {
	// The length of the term of your reserved queue pricing plan commitment. Valid value is ONE_YEAR.
	commitment?: null | string @go(Commitment,*string)

	// Specifies whether the term of your reserved queue pricing plan. Valid values are AUTO_RENEW or EXPIRE.
	renewalType?: null | string @go(RenewalType,*string)

	// Specifies the number of reserved transcode slots (RTS) for queue.
	reservedSlots?: null | float64 @go(ReservedSlots,*float64)
}

#ReservationPlanSettingsObservation: {
	// The length of the term of your reserved queue pricing plan commitment. Valid value is ONE_YEAR.
	commitment?: null | string @go(Commitment,*string)

	// Specifies whether the term of your reserved queue pricing plan. Valid values are AUTO_RENEW or EXPIRE.
	renewalType?: null | string @go(RenewalType,*string)

	// Specifies the number of reserved transcode slots (RTS) for queue.
	reservedSlots?: null | float64 @go(ReservedSlots,*float64)
}

#ReservationPlanSettingsParameters: {
	// The length of the term of your reserved queue pricing plan commitment. Valid value is ONE_YEAR.
	// +kubebuilder:validation:Optional
	commitment?: null | string @go(Commitment,*string)

	// Specifies whether the term of your reserved queue pricing plan. Valid values are AUTO_RENEW or EXPIRE.
	// +kubebuilder:validation:Optional
	renewalType?: null | string @go(RenewalType,*string)

	// Specifies the number of reserved transcode slots (RTS) for queue.
	// +kubebuilder:validation:Optional
	reservedSlots?: null | float64 @go(ReservedSlots,*float64)
}

// QueueSpec defines the desired state of Queue
#QueueSpec: {
	v1.#ResourceSpec
	forProvider: #QueueParameters @go(ForProvider)

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
	initProvider?: #QueueInitParameters @go(InitProvider)
}

// QueueStatus defines the observed state of Queue.
#QueueStatus: {
	v1.#ResourceStatus
	atProvider?: #QueueObservation @go(AtProvider)
}

// Queue is the Schema for the Queues API. Provides an AWS Elemental MediaConvert Queue.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Queue: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #QueueSpec         @go(Spec)
	status?:   #QueueStatus       @go(Status)
}

// QueueList contains a list of Queues
#QueueList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Queue] @go(Items,[]Queue)
}