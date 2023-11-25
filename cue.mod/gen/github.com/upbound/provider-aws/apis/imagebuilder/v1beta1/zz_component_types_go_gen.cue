// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/imagebuilder/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ComponentInitParameters: {
	// Change description of the component.
	changeDescription?: null | string @go(ChangeDescription,*string)

	// Inline YAML string with data of the component. Exactly one of data and uri can be specified.
	data?: null | string @go(Data,*string)

	// Description of the component.
	description?: null | string @go(Description,*string)

	// Name of the component.
	name?: null | string @go(Name,*string)

	// Platform of the component.
	platform?: null | string @go(Platform,*string)

	// Whether to retain the old version when the resource is destroyed or replacement is necessary. Defaults to false.
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set of Operating Systems (OS) supported by the component.
	supportedOsVersions?: [...null | string] @go(SupportedOsVersions,[]*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// S3 URI with data of the component. Exactly one of data and uri can be specified.
	uri?: null | string @go(URI,*string)

	// Version of the component.
	version?: null | string @go(Version,*string)
}

#ComponentObservation: {
	// Amazon Resource Name (ARN) of the component.
	arn?: null | string @go(Arn,*string)

	// Change description of the component.
	changeDescription?: null | string @go(ChangeDescription,*string)

	// Inline YAML string with data of the component. Exactly one of data and uri can be specified.
	data?: null | string @go(Data,*string)

	// Date the component was created.
	dateCreated?: null | string @go(DateCreated,*string)

	// Description of the component.
	description?: null | string @go(Description,*string)

	// Encryption status of the component.
	encrypted?: null | bool   @go(Encrypted,*bool)
	id?:        null | string @go(ID,*string)

	// Amazon Resource Name (ARN) of the Key Management Service (KMS) Key used to encrypt the component.
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// Name of the component.
	name?: null | string @go(Name,*string)

	// Owner of the component.
	owner?: null | string @go(Owner,*string)

	// Platform of the component.
	platform?: null | string @go(Platform,*string)

	// Whether to retain the old version when the resource is destroyed or replacement is necessary. Defaults to false.
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set of Operating Systems (OS) supported by the component.
	supportedOsVersions?: [...null | string] @go(SupportedOsVersions,[]*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Type of the component.
	type?: null | string @go(Type,*string)

	// S3 URI with data of the component. Exactly one of data and uri can be specified.
	uri?: null | string @go(URI,*string)

	// Version of the component.
	version?: null | string @go(Version,*string)
}

#ComponentParameters: {
	// Change description of the component.
	// +kubebuilder:validation:Optional
	changeDescription?: null | string @go(ChangeDescription,*string)

	// Inline YAML string with data of the component. Exactly one of data and uri can be specified.
	// +kubebuilder:validation:Optional
	data?: null | string @go(Data,*string)

	// Description of the component.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Amazon Resource Name (ARN) of the Key Management Service (KMS) Key used to encrypt the component.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/kms/v1beta1.Key
	// +kubebuilder:validation:Optional
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// Reference to a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdRef?: null | v1.#Reference @go(KMSKeyIDRef,*v1.Reference)

	// Selector for a Key in kms to populate kmsKeyId.
	// +kubebuilder:validation:Optional
	kmsKeyIdSelector?: null | v1.#Selector @go(KMSKeyIDSelector,*v1.Selector)

	// Name of the component.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Platform of the component.
	// +kubebuilder:validation:Optional
	platform?: null | string @go(Platform,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Whether to retain the old version when the resource is destroyed or replacement is necessary. Defaults to false.
	// +kubebuilder:validation:Optional
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set of Operating Systems (OS) supported by the component.
	// +kubebuilder:validation:Optional
	supportedOsVersions?: [...null | string] @go(SupportedOsVersions,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// S3 URI with data of the component. Exactly one of data and uri can be specified.
	// +kubebuilder:validation:Optional
	uri?: null | string @go(URI,*string)

	// Version of the component.
	// +kubebuilder:validation:Optional
	version?: null | string @go(Version,*string)
}

// ComponentSpec defines the desired state of Component
#ComponentSpec: {
	v1.#ResourceSpec
	forProvider: #ComponentParameters @go(ForProvider)

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
	initProvider?: #ComponentInitParameters @go(InitProvider)
}

// ComponentStatus defines the observed state of Component.
#ComponentStatus: {
	v1.#ResourceStatus
	atProvider?: #ComponentObservation @go(AtProvider)
}

// Component is the Schema for the Components API. Manage an Image Builder Component
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Component: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.platform) || (has(self.initProvider) && has(self.initProvider.platform))",message="spec.forProvider.platform is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.version) || (has(self.initProvider) && has(self.initProvider.version))",message="spec.forProvider.version is a required parameter"
	spec:    #ComponentSpec   @go(Spec)
	status?: #ComponentStatus @go(Status)
}

// ComponentList contains a list of Components
#ComponentList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Component] @go(Items,[]Component)
}
