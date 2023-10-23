// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ssm/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#MaintenanceWindowTargetInitParameters: {
	// The description of the maintenance window target.
	description?: null | string @go(Description,*string)

	// The name of the maintenance window target.
	name?: null | string @go(Name,*string)

	// User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this Maintenance Window.
	ownerInformation?: null | string @go(OwnerInformation,*string)

	// The type of target being registered with the Maintenance Window. Possible values are INSTANCE and RESOURCE_GROUP.
	resourceType?: null | string @go(ResourceType,*string)

	// The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see
	// (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)
	targets?: [...#MaintenanceWindowTargetTargetsInitParameters] @go(Targets,[]MaintenanceWindowTargetTargetsInitParameters)
}

#MaintenanceWindowTargetObservation: {
	// The description of the maintenance window target.
	description?: null | string @go(Description,*string)

	// The ID of the maintenance window target.
	id?: null | string @go(ID,*string)

	// The name of the maintenance window target.
	name?: null | string @go(Name,*string)

	// User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this Maintenance Window.
	ownerInformation?: null | string @go(OwnerInformation,*string)

	// The type of target being registered with the Maintenance Window. Possible values are INSTANCE and RESOURCE_GROUP.
	resourceType?: null | string @go(ResourceType,*string)

	// The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see
	// (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)
	targets?: [...#MaintenanceWindowTargetTargetsObservation] @go(Targets,[]MaintenanceWindowTargetTargetsObservation)

	// The Id of the maintenance window to register the target with.
	windowId?: null | string @go(WindowID,*string)
}

#MaintenanceWindowTargetParameters: {
	// The description of the maintenance window target.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the maintenance window target.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this Maintenance Window.
	// +kubebuilder:validation:Optional
	ownerInformation?: null | string @go(OwnerInformation,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The type of target being registered with the Maintenance Window. Possible values are INSTANCE and RESOURCE_GROUP.
	// +kubebuilder:validation:Optional
	resourceType?: null | string @go(ResourceType,*string)

	// The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see
	// (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)
	// +kubebuilder:validation:Optional
	targets?: [...#MaintenanceWindowTargetTargetsParameters] @go(Targets,[]MaintenanceWindowTargetTargetsParameters)

	// The Id of the maintenance window to register the target with.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ssm/v1beta1.MaintenanceWindow
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	windowId?: null | string @go(WindowID,*string)

	// Reference to a MaintenanceWindow in ssm to populate windowId.
	// +kubebuilder:validation:Optional
	windowIdRef?: null | v1.#Reference @go(WindowIDRef,*v1.Reference)

	// Selector for a MaintenanceWindow in ssm to populate windowId.
	// +kubebuilder:validation:Optional
	windowIdSelector?: null | v1.#Selector @go(WindowIDSelector,*v1.Selector)
}

#MaintenanceWindowTargetTargetsInitParameters: {
	key?: null | string @go(Key,*string)
	values?: [...null | string] @go(Values,[]*string)
}

#MaintenanceWindowTargetTargetsObservation: {
	key?: null | string @go(Key,*string)
	values?: [...null | string] @go(Values,[]*string)
}

#MaintenanceWindowTargetTargetsParameters: {
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)

	// +kubebuilder:validation:Optional
	values: [...null | string] @go(Values,[]*string)
}

// MaintenanceWindowTargetSpec defines the desired state of MaintenanceWindowTarget
#MaintenanceWindowTargetSpec: {
	v1.#ResourceSpec
	forProvider: #MaintenanceWindowTargetParameters @go(ForProvider)

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
	initProvider?: #MaintenanceWindowTargetInitParameters @go(InitProvider)
}

// MaintenanceWindowTargetStatus defines the observed state of MaintenanceWindowTarget.
#MaintenanceWindowTargetStatus: {
	v1.#ResourceStatus
	atProvider?: #MaintenanceWindowTargetObservation @go(AtProvider)
}

// MaintenanceWindowTarget is the Schema for the MaintenanceWindowTargets API. Provides an SSM Maintenance Window Target resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#MaintenanceWindowTarget: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.resourceType) || (has(self.initProvider) && has(self.initProvider.resourceType))",message="spec.forProvider.resourceType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.targets) || (has(self.initProvider) && has(self.initProvider.targets))",message="spec.forProvider.targets is a required parameter"
	spec:    #MaintenanceWindowTargetSpec   @go(Spec)
	status?: #MaintenanceWindowTargetStatus @go(Status)
}

// MaintenanceWindowTargetList contains a list of MaintenanceWindowTargets
#MaintenanceWindowTargetList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#MaintenanceWindowTarget] @go(Items,[]MaintenanceWindowTarget)
}