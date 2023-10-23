// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#TransitGatewayPrefixListReferenceInitParameters: {
	// Indicates whether to drop traffic that matches the Prefix List. Defaults to false.
	blackhole?: null | bool @go(Blackhole,*bool)
}

#TransitGatewayPrefixListReferenceObservation: {
	// Indicates whether to drop traffic that matches the Prefix List. Defaults to false.
	blackhole?: null | bool @go(Blackhole,*bool)

	// EC2 Transit Gateway Route Table identifier and EC2 Prefix List identifier, separated by an underscore (_)
	id?: null | string @go(ID,*string)

	// Identifier of EC2 Prefix List.
	prefixListId?: null | string @go(PrefixListID,*string)

	// EC2 Transit Gateway Route Table identifier and EC2 Prefix List identifier, separated by an underscore (_)
	prefixListOwnerId?: null | string @go(PrefixListOwnerID,*string)

	// Identifier of EC2 Transit Gateway Attachment.
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// Identifier of EC2 Transit Gateway Route Table.
	transitGatewayRouteTableId?: null | string @go(TransitGatewayRouteTableID,*string)
}

#TransitGatewayPrefixListReferenceParameters: {
	// Indicates whether to drop traffic that matches the Prefix List. Defaults to false.
	// +kubebuilder:validation:Optional
	blackhole?: null | bool @go(Blackhole,*bool)

	// Identifier of EC2 Prefix List.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.ManagedPrefixList
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	prefixListId?: null | string @go(PrefixListID,*string)

	// Reference to a ManagedPrefixList in ec2 to populate prefixListId.
	// +kubebuilder:validation:Optional
	prefixListIdRef?: null | v1.#Reference @go(PrefixListIDRef,*v1.Reference)

	// Selector for a ManagedPrefixList in ec2 to populate prefixListId.
	// +kubebuilder:validation:Optional
	prefixListIdSelector?: null | v1.#Selector @go(PrefixListIDSelector,*v1.Selector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Identifier of EC2 Transit Gateway Attachment.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.TransitGatewayVPCAttachment
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// Reference to a TransitGatewayVPCAttachment in ec2 to populate transitGatewayAttachmentId.
	// +kubebuilder:validation:Optional
	transitGatewayAttachmentIdRef?: null | v1.#Reference @go(TransitGatewayAttachmentIDRef,*v1.Reference)

	// Selector for a TransitGatewayVPCAttachment in ec2 to populate transitGatewayAttachmentId.
	// +kubebuilder:validation:Optional
	transitGatewayAttachmentIdSelector?: null | v1.#Selector @go(TransitGatewayAttachmentIDSelector,*v1.Selector)

	// Identifier of EC2 Transit Gateway Route Table.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.TransitGateway
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("association_default_route_table_id",true)
	// +kubebuilder:validation:Optional
	transitGatewayRouteTableId?: null | string @go(TransitGatewayRouteTableID,*string)

	// Reference to a TransitGateway in ec2 to populate transitGatewayRouteTableId.
	// +kubebuilder:validation:Optional
	transitGatewayRouteTableIdRef?: null | v1.#Reference @go(TransitGatewayRouteTableIDRef,*v1.Reference)

	// Selector for a TransitGateway in ec2 to populate transitGatewayRouteTableId.
	// +kubebuilder:validation:Optional
	transitGatewayRouteTableIdSelector?: null | v1.#Selector @go(TransitGatewayRouteTableIDSelector,*v1.Selector)
}

// TransitGatewayPrefixListReferenceSpec defines the desired state of TransitGatewayPrefixListReference
#TransitGatewayPrefixListReferenceSpec: {
	v1.#ResourceSpec
	forProvider: #TransitGatewayPrefixListReferenceParameters @go(ForProvider)

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
	initProvider?: #TransitGatewayPrefixListReferenceInitParameters @go(InitProvider)
}

// TransitGatewayPrefixListReferenceStatus defines the observed state of TransitGatewayPrefixListReference.
#TransitGatewayPrefixListReferenceStatus: {
	v1.#ResourceStatus
	atProvider?: #TransitGatewayPrefixListReferenceObservation @go(AtProvider)
}

// TransitGatewayPrefixListReference is the Schema for the TransitGatewayPrefixListReferences API. Manages an EC2 Transit Gateway Prefix List Reference
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TransitGatewayPrefixListReference: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta                       @go(ObjectMeta)
	spec:      #TransitGatewayPrefixListReferenceSpec   @go(Spec)
	status?:   #TransitGatewayPrefixListReferenceStatus @go(Status)
}

// TransitGatewayPrefixListReferenceList contains a list of TransitGatewayPrefixListReferences
#TransitGatewayPrefixListReferenceList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TransitGatewayPrefixListReference] @go(Items,[]TransitGatewayPrefixListReference)
}