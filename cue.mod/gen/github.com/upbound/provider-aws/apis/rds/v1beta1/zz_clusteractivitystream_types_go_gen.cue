// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/rds/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ClusterActivityStreamInitParameters: {
	// Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included. Defaults false.
	engineNativeAuditFieldsIncluded?: null | bool @go(EngineNativeAuditFieldsIncluded,*bool)

	// Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async.
	mode?: null | string @go(Mode,*string)
}

#ClusterActivityStreamObservation: {
	// Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included. Defaults false.
	engineNativeAuditFieldsIncluded?: null | bool @go(EngineNativeAuditFieldsIncluded,*bool)

	// The Amazon Resource Name (ARN) of the DB cluster.
	id?: null | string @go(ID,*string)

	// The AWS KMS key identifier for encrypting messages in the database activity stream. The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// The name of the Amazon Kinesis data stream to be used for the database activity stream.
	kinesisStreamName?: null | string @go(KinesisStreamName,*string)

	// Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async.
	mode?: null | string @go(Mode,*string)

	// The Amazon Resource Name (ARN) of the DB cluster.
	resourceArn?: null | string @go(ResourceArn,*string)
}

#ClusterActivityStreamParameters: {
	// Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included. Defaults false.
	// +kubebuilder:validation:Optional
	engineNativeAuditFieldsIncluded?: null | bool @go(EngineNativeAuditFieldsIncluded,*bool)

	// The AWS KMS key identifier for encrypting messages in the database activity stream. The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/kms/v1beta1.Key
	// +kubebuilder:validation:Optional
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// Reference to a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdRef?: null | v1.#Reference @go(KMSKeyIDRef,*v1.Reference)

	// Selector for a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdSelector?: null | v1.#Selector @go(KMSKeyIDSelector,*v1.Selector)

	// Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async.
	// +kubebuilder:validation:Optional
	mode?: null | string @go(Mode,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The Amazon Resource Name (ARN) of the DB cluster.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/rds/v1beta1.Cluster
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	resourceArn?: null | string @go(ResourceArn,*string)

	// Reference to a Cluster in rds to populate resourceArn.
	// +kubebuilder:validation:Optional
	resourceArnRef?: null | v1.#Reference @go(ResourceArnRef,*v1.Reference)

	// Selector for a Cluster in rds to populate resourceArn.
	// +kubebuilder:validation:Optional
	resourceArnSelector?: null | v1.#Selector @go(ResourceArnSelector,*v1.Selector)
}

// ClusterActivityStreamSpec defines the desired state of ClusterActivityStream
#ClusterActivityStreamSpec: {
	v1.#ResourceSpec
	forProvider: #ClusterActivityStreamParameters @go(ForProvider)

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
	initProvider?: #ClusterActivityStreamInitParameters @go(InitProvider)
}

// ClusterActivityStreamStatus defines the observed state of ClusterActivityStream.
#ClusterActivityStreamStatus: {
	v1.#ResourceStatus
	atProvider?: #ClusterActivityStreamObservation @go(AtProvider)
}

// ClusterActivityStream is the Schema for the ClusterActivityStreams API. Manages RDS Aurora Cluster Database Activity Streams
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ClusterActivityStream: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.mode) || (has(self.initProvider) && has(self.initProvider.mode))",message="spec.forProvider.mode is a required parameter"
	spec:    #ClusterActivityStreamSpec   @go(Spec)
	status?: #ClusterActivityStreamStatus @go(Status)
}

// ClusterActivityStreamList contains a list of ClusterActivityStreams
#ClusterActivityStreamList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ClusterActivityStream] @go(Items,[]ClusterActivityStream)
}