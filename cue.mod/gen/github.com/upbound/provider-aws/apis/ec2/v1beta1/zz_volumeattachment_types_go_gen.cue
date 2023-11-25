// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#VolumeAttachmentInitParameters: {
	// The device name to expose to the instance (for
	// example, /dev/sdh or xvdh).  See Device Naming on Linux Instances and Device Naming on Windows Instances for more information.
	deviceName?: null | string @go(DeviceName,*string)

	// Set to true if you want to force the
	// volume to detach. Useful if previous attempts failed, but use this option only
	// as a last resort, as this can result in data loss. See
	// Detaching an Amazon EBS Volume from an Instance for more information.
	forceDetach?: null | bool @go(ForceDetach,*bool)

	// This is
	// useful when destroying an instance which has volumes created by some other
	// means attached.
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set this to true to ensure that the target instance is stopped
	// before trying to detach the volume. Stops the instance, if it is not already stopped.
	stopInstanceBeforeDetaching?: null | bool @go(StopInstanceBeforeDetaching,*bool)
}

#VolumeAttachmentObservation: {
	// The device name to expose to the instance (for
	// example, /dev/sdh or xvdh).  See Device Naming on Linux Instances and Device Naming on Windows Instances for more information.
	deviceName?: null | string @go(DeviceName,*string)

	// Set to true if you want to force the
	// volume to detach. Useful if previous attempts failed, but use this option only
	// as a last resort, as this can result in data loss. See
	// Detaching an Amazon EBS Volume from an Instance for more information.
	forceDetach?: null | bool   @go(ForceDetach,*bool)
	id?:          null | string @go(ID,*string)

	// ID of the Instance to attach to
	instanceId?: null | string @go(InstanceID,*string)

	// This is
	// useful when destroying an instance which has volumes created by some other
	// means attached.
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set this to true to ensure that the target instance is stopped
	// before trying to detach the volume. Stops the instance, if it is not already stopped.
	stopInstanceBeforeDetaching?: null | bool @go(StopInstanceBeforeDetaching,*bool)

	// ID of the Volume to be attached
	volumeId?: null | string @go(VolumeID,*string)
}

#VolumeAttachmentParameters: {
	// The device name to expose to the instance (for
	// example, /dev/sdh or xvdh).  See Device Naming on Linux Instances and Device Naming on Windows Instances for more information.
	// +kubebuilder:validation:Optional
	deviceName?: null | string @go(DeviceName,*string)

	// Set to true if you want to force the
	// volume to detach. Useful if previous attempts failed, but use this option only
	// as a last resort, as this can result in data loss. See
	// Detaching an Amazon EBS Volume from an Instance for more information.
	// +kubebuilder:validation:Optional
	forceDetach?: null | bool @go(ForceDetach,*bool)

	// ID of the Instance to attach to
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	instanceId?: null | string @go(InstanceID,*string)

	// Reference to a Instance in ec2 to populate instanceId.
	// +kubebuilder:validation:Optional
	instanceIdRef?: null | v1.#Reference @go(InstanceIDRef,*v1.Reference)

	// Selector for a Instance in ec2 to populate instanceId.
	// +kubebuilder:validation:Optional
	instanceIdSelector?: null | v1.#Selector @go(InstanceIDSelector,*v1.Selector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// This is
	// useful when destroying an instance which has volumes created by some other
	// means attached.
	// +kubebuilder:validation:Optional
	skipDestroy?: null | bool @go(SkipDestroy,*bool)

	// Set this to true to ensure that the target instance is stopped
	// before trying to detach the volume. Stops the instance, if it is not already stopped.
	// +kubebuilder:validation:Optional
	stopInstanceBeforeDetaching?: null | bool @go(StopInstanceBeforeDetaching,*bool)

	// ID of the Volume to be attached
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.EBSVolume
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	volumeId?: null | string @go(VolumeID,*string)

	// Reference to a EBSVolume in ec2 to populate volumeId.
	// +kubebuilder:validation:Optional
	volumeIdRef?: null | v1.#Reference @go(VolumeIDRef,*v1.Reference)

	// Selector for a EBSVolume in ec2 to populate volumeId.
	// +kubebuilder:validation:Optional
	volumeIdSelector?: null | v1.#Selector @go(VolumeIDSelector,*v1.Selector)
}

// VolumeAttachmentSpec defines the desired state of VolumeAttachment
#VolumeAttachmentSpec: {
	v1.#ResourceSpec
	forProvider: #VolumeAttachmentParameters @go(ForProvider)

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
	initProvider?: #VolumeAttachmentInitParameters @go(InitProvider)
}

// VolumeAttachmentStatus defines the observed state of VolumeAttachment.
#VolumeAttachmentStatus: {
	v1.#ResourceStatus
	atProvider?: #VolumeAttachmentObservation @go(AtProvider)
}

// VolumeAttachment is the Schema for the VolumeAttachments API. Provides an AWS EBS Volume Attachment
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#VolumeAttachment: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.deviceName) || (has(self.initProvider) && has(self.initProvider.deviceName))",message="spec.forProvider.deviceName is a required parameter"
	spec:    #VolumeAttachmentSpec   @go(Spec)
	status?: #VolumeAttachmentStatus @go(Status)
}

// VolumeAttachmentList contains a list of VolumeAttachments
#VolumeAttachmentList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VolumeAttachment] @go(Items,[]VolumeAttachment)
}
