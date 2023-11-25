// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/s3/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#BucketPublicAccessBlockInitParameters: {
	// Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs. When set to true causes the following behavior:
	blockPublicAcls?: null | bool @go(BlockPublicAcls,*bool)

	// Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. When set to true causes Amazon S3 to:
	blockPublicPolicy?: null | bool @go(BlockPublicPolicy,*bool)

	// Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:
	ignorePublicAcls?: null | bool @go(IgnorePublicAcls,*bool)

	// Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true:
	restrictPublicBuckets?: null | bool @go(RestrictPublicBuckets,*bool)
}

#BucketPublicAccessBlockObservation: {
	// Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs. When set to true causes the following behavior:
	blockPublicAcls?: null | bool @go(BlockPublicAcls,*bool)

	// Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. When set to true causes Amazon S3 to:
	blockPublicPolicy?: null | bool @go(BlockPublicPolicy,*bool)

	// S3 Bucket to which this Public Access Block configuration should be applied.
	bucket?: null | string @go(Bucket,*string)

	// Name of the S3 bucket the configuration is attached to
	id?: null | string @go(ID,*string)

	// Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:
	ignorePublicAcls?: null | bool @go(IgnorePublicAcls,*bool)

	// Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true:
	restrictPublicBuckets?: null | bool @go(RestrictPublicBuckets,*bool)
}

#BucketPublicAccessBlockParameters: {
	// Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs. When set to true causes the following behavior:
	// +kubebuilder:validation:Optional
	blockPublicAcls?: null | bool @go(BlockPublicAcls,*bool)

	// Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. When set to true causes Amazon S3 to:
	// +kubebuilder:validation:Optional
	blockPublicPolicy?: null | bool @go(BlockPublicPolicy,*bool)

	// S3 Bucket to which this Public Access Block configuration should be applied.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:
	// +kubebuilder:validation:Optional
	ignorePublicAcls?: null | bool @go(IgnorePublicAcls,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true:
	// +kubebuilder:validation:Optional
	restrictPublicBuckets?: null | bool @go(RestrictPublicBuckets,*bool)
}

// BucketPublicAccessBlockSpec defines the desired state of BucketPublicAccessBlock
#BucketPublicAccessBlockSpec: {
	v1.#ResourceSpec
	forProvider: #BucketPublicAccessBlockParameters @go(ForProvider)

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
	initProvider?: #BucketPublicAccessBlockInitParameters @go(InitProvider)
}

// BucketPublicAccessBlockStatus defines the observed state of BucketPublicAccessBlock.
#BucketPublicAccessBlockStatus: {
	v1.#ResourceStatus
	atProvider?: #BucketPublicAccessBlockObservation @go(AtProvider)
}

// BucketPublicAccessBlock is the Schema for the BucketPublicAccessBlocks API. Manages S3 bucket-level Public Access Block Configuration
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BucketPublicAccessBlock: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta             @go(ObjectMeta)
	spec:      #BucketPublicAccessBlockSpec   @go(Spec)
	status?:   #BucketPublicAccessBlockStatus @go(Status)
}

// BucketPublicAccessBlockList contains a list of BucketPublicAccessBlocks
#BucketPublicAccessBlockList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BucketPublicAccessBlock] @go(Items,[]BucketPublicAccessBlock)
}
