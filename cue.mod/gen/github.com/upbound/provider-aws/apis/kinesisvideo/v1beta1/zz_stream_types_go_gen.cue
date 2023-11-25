// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/kinesisvideo/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#StreamInitParameters: {
	// –  The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data.
	dataRetentionInHours?: null | float64 @go(DataRetentionInHours,*float64)

	// The name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name.
	deviceName?: null | string @go(DeviceName,*string)

	// The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see Media Types. If you choose to specify the MediaType, see Naming Requirements for guidelines.
	mediaType?: null | string @go(MediaType,*string)

	// A name to identify the stream. This is unique to the
	// AWS account and region the Stream is created in.
	name?: null | string @go(Name,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#StreamObservation: {
	// The Amazon Resource Name (ARN) specifying the Stream (same as id)
	arn?: null | string @go(Arn,*string)

	// A time stamp that indicates when the stream was created.
	creationTime?: null | string @go(CreationTime,*string)

	// –  The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data.
	dataRetentionInHours?: null | float64 @go(DataRetentionInHours,*float64)

	// The name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name.
	deviceName?: null | string @go(DeviceName,*string)

	// The unique Stream id
	id?: null | string @go(ID,*string)

	// The ID of the AWS Key Management Service (AWS KMS) key that you want Kinesis Video Streams to use to encrypt stream data. If no key ID is specified, the default, Kinesis Video-managed key (aws/kinesisvideo) is used.
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see Media Types. If you choose to specify the MediaType, see Naming Requirements for guidelines.
	mediaType?: null | string @go(MediaType,*string)

	// A name to identify the stream. This is unique to the
	// AWS account and region the Stream is created in.
	name?: null | string @go(Name,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The version of the stream.
	version?: null | string @go(Version,*string)
}

#StreamParameters: {
	// –  The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data.
	// +kubebuilder:validation:Optional
	dataRetentionInHours?: null | float64 @go(DataRetentionInHours,*float64)

	// The name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name.
	// +kubebuilder:validation:Optional
	deviceName?: null | string @go(DeviceName,*string)

	// The ID of the AWS Key Management Service (AWS KMS) key that you want Kinesis Video Streams to use to encrypt stream data. If no key ID is specified, the default, Kinesis Video-managed key (aws/kinesisvideo) is used.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/kms/v1beta1.Key
	// +kubebuilder:validation:Optional
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// Reference to a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdRef?: null | v1.#Reference @go(KMSKeyIDRef,*v1.Reference)

	// Selector for a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdSelector?: null | v1.#Selector @go(KMSKeyIDSelector,*v1.Selector)

	// The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see Media Types. If you choose to specify the MediaType, see Naming Requirements for guidelines.
	// +kubebuilder:validation:Optional
	mediaType?: null | string @go(MediaType,*string)

	// A name to identify the stream. This is unique to the
	// AWS account and region the Stream is created in.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// StreamSpec defines the desired state of Stream
#StreamSpec: {
	v1.#ResourceSpec
	forProvider: #StreamParameters @go(ForProvider)

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
	initProvider?: #StreamInitParameters @go(InitProvider)
}

// StreamStatus defines the observed state of Stream.
#StreamStatus: {
	v1.#ResourceStatus
	atProvider?: #StreamObservation @go(AtProvider)
}

// Stream is the Schema for the Streams API. Provides a AWS Kinesis Video Stream
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Stream: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #StreamSpec   @go(Spec)
	status?: #StreamStatus @go(Status)
}

// StreamList contains a list of Streams
#StreamList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Stream] @go(Items,[]Stream)
}
