// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/licensemanager/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#LicenseConfigurationInitParameters: {
	// Description of the license configuration.
	description?: null | string @go(Description,*string)

	// Number of licenses managed by the license configuration.
	licenseCount?: null | float64 @go(LicenseCount,*float64)

	// Sets the number of available licenses as a hard limit.
	licenseCountHardLimit?: null | bool @go(LicenseCountHardLimit,*bool)

	// Dimension to use to track license inventory. Specify either vCPU, Instance, Core or Socket.
	licenseCountingType?: null | string @go(LicenseCountingType,*string)

	// Array of configured License Manager rules.
	licenseRules?: [...null | string] @go(LicenseRules,[]*string)

	// Name of the license configuration.
	name?: null | string @go(Name,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#LicenseConfigurationObservation: {
	// The license configuration ARN.
	arn?: null | string @go(Arn,*string)

	// Description of the license configuration.
	description?: null | string @go(Description,*string)

	// The license configuration ARN.
	id?: null | string @go(ID,*string)

	// Number of licenses managed by the license configuration.
	licenseCount?: null | float64 @go(LicenseCount,*float64)

	// Sets the number of available licenses as a hard limit.
	licenseCountHardLimit?: null | bool @go(LicenseCountHardLimit,*bool)

	// Dimension to use to track license inventory. Specify either vCPU, Instance, Core or Socket.
	licenseCountingType?: null | string @go(LicenseCountingType,*string)

	// Array of configured License Manager rules.
	licenseRules?: [...null | string] @go(LicenseRules,[]*string)

	// Name of the license configuration.
	name?: null | string @go(Name,*string)

	// Account ID of the owner of the license configuration.
	ownerAccountId?: null | string @go(OwnerAccountID,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#LicenseConfigurationParameters: {
	// Description of the license configuration.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Number of licenses managed by the license configuration.
	// +kubebuilder:validation:Optional
	licenseCount?: null | float64 @go(LicenseCount,*float64)

	// Sets the number of available licenses as a hard limit.
	// +kubebuilder:validation:Optional
	licenseCountHardLimit?: null | bool @go(LicenseCountHardLimit,*bool)

	// Dimension to use to track license inventory. Specify either vCPU, Instance, Core or Socket.
	// +kubebuilder:validation:Optional
	licenseCountingType?: null | string @go(LicenseCountingType,*string)

	// Array of configured License Manager rules.
	// +kubebuilder:validation:Optional
	licenseRules?: [...null | string] @go(LicenseRules,[]*string)

	// Name of the license configuration.
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

// LicenseConfigurationSpec defines the desired state of LicenseConfiguration
#LicenseConfigurationSpec: {
	v1.#ResourceSpec
	forProvider: #LicenseConfigurationParameters @go(ForProvider)

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
	initProvider?: #LicenseConfigurationInitParameters @go(InitProvider)
}

// LicenseConfigurationStatus defines the observed state of LicenseConfiguration.
#LicenseConfigurationStatus: {
	v1.#ResourceStatus
	atProvider?: #LicenseConfigurationObservation @go(AtProvider)
}

// LicenseConfiguration is the Schema for the LicenseConfigurations API. Provides a License Manager license configuration resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#LicenseConfiguration: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.licenseCountingType) || (has(self.initProvider) && has(self.initProvider.licenseCountingType))",message="spec.forProvider.licenseCountingType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #LicenseConfigurationSpec   @go(Spec)
	status?: #LicenseConfigurationStatus @go(Status)
}

// LicenseConfigurationList contains a list of LicenseConfigurations
#LicenseConfigurationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#LicenseConfiguration] @go(Items,[]LicenseConfiguration)
}