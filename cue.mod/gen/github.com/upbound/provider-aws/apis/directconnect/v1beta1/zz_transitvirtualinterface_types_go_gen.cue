// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/directconnect/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#TransitVirtualInterfaceInitParameters: {
	// The address family for the BGP peer. ipv4  or ipv6.
	addressFamily?: null | string @go(AddressFamily,*string)

	// The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers.
	amazonAddress?: null | string @go(AmazonAddress,*string)

	// The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
	bgpAsn?: null | float64 @go(BGPAsn,*float64)

	// The authentication key for BGP configuration.
	bgpAuthKey?: null | string @go(BGPAuthKey,*string)

	// The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers.
	customerAddress?: null | string @go(CustomerAddress,*string)

	// The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection.
	// The MTU of a virtual transit interface can be either 1500 or 8500 (jumbo frames). Default is 1500.
	mtu?: null | float64 @go(Mtu,*float64)

	// The name for the virtual interface.
	name?: null | string @go(Name,*string)

	// Indicates whether to enable or disable SiteLink.
	sitelinkEnabled?: null | bool @go(SitelinkEnabled,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The VLAN ID.
	vlan?: null | float64 @go(Vlan,*float64)
}

#TransitVirtualInterfaceObservation: {
	// The address family for the BGP peer. ipv4  or ipv6.
	addressFamily?: null | string @go(AddressFamily,*string)

	// The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers.
	amazonAddress?: null | string @go(AmazonAddress,*string)
	amazonSideAsn?: null | string @go(AmazonSideAsn,*string)

	// The ARN of the virtual interface.
	arn?: null | string @go(Arn,*string)

	// The Direct Connect endpoint on which the virtual interface terminates.
	awsDevice?: null | string @go(AwsDevice,*string)

	// The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
	bgpAsn?: null | float64 @go(BGPAsn,*float64)

	// The authentication key for BGP configuration.
	bgpAuthKey?: null | string @go(BGPAuthKey,*string)

	// The ID of the Direct Connect connection (or LAG) on which to create the virtual interface.
	connectionId?: null | string @go(ConnectionID,*string)

	// The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers.
	customerAddress?: null | string @go(CustomerAddress,*string)

	// The ID of the Direct Connect gateway to which to connect the virtual interface.
	dxGatewayId?: null | string @go(DxGatewayID,*string)

	// The ID of the virtual interface.
	id?: null | string @go(ID,*string)

	// Indicates whether jumbo frames (8500 MTU) are supported.
	jumboFrameCapable?: null | bool @go(JumboFrameCapable,*bool)

	// The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection.
	// The MTU of a virtual transit interface can be either 1500 or 8500 (jumbo frames). Default is 1500.
	mtu?: null | float64 @go(Mtu,*float64)

	// The name for the virtual interface.
	name?: null | string @go(Name,*string)

	// Indicates whether to enable or disable SiteLink.
	sitelinkEnabled?: null | bool @go(SitelinkEnabled,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The VLAN ID.
	vlan?: null | float64 @go(Vlan,*float64)
}

#TransitVirtualInterfaceParameters: {
	// The address family for the BGP peer. ipv4  or ipv6.
	// +kubebuilder:validation:Optional
	addressFamily?: null | string @go(AddressFamily,*string)

	// The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers.
	// +kubebuilder:validation:Optional
	amazonAddress?: null | string @go(AmazonAddress,*string)

	// The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
	// +kubebuilder:validation:Optional
	bgpAsn?: null | float64 @go(BGPAsn,*float64)

	// The authentication key for BGP configuration.
	// +kubebuilder:validation:Optional
	bgpAuthKey?: null | string @go(BGPAuthKey,*string)

	// The ID of the Direct Connect connection (or LAG) on which to create the virtual interface.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/directconnect/v1beta1.Connection
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	connectionId?: null | string @go(ConnectionID,*string)

	// Reference to a Connection in directconnect to populate connectionId.
	// +kubebuilder:validation:Optional
	connectionIdRef?: null | v1.#Reference @go(ConnectionIDRef,*v1.Reference)

	// Selector for a Connection in directconnect to populate connectionId.
	// +kubebuilder:validation:Optional
	connectionIdSelector?: null | v1.#Selector @go(ConnectionIDSelector,*v1.Selector)

	// The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers.
	// +kubebuilder:validation:Optional
	customerAddress?: null | string @go(CustomerAddress,*string)

	// The ID of the Direct Connect gateway to which to connect the virtual interface.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/directconnect/v1beta1.Gateway
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dxGatewayId?: null | string @go(DxGatewayID,*string)

	// Reference to a Gateway in directconnect to populate dxGatewayId.
	// +kubebuilder:validation:Optional
	dxGatewayIdRef?: null | v1.#Reference @go(DxGatewayIDRef,*v1.Reference)

	// Selector for a Gateway in directconnect to populate dxGatewayId.
	// +kubebuilder:validation:Optional
	dxGatewayIdSelector?: null | v1.#Selector @go(DxGatewayIDSelector,*v1.Selector)

	// The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection.
	// The MTU of a virtual transit interface can be either 1500 or 8500 (jumbo frames). Default is 1500.
	// +kubebuilder:validation:Optional
	mtu?: null | float64 @go(Mtu,*float64)

	// The name for the virtual interface.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Indicates whether to enable or disable SiteLink.
	// +kubebuilder:validation:Optional
	sitelinkEnabled?: null | bool @go(SitelinkEnabled,*bool)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The VLAN ID.
	// +kubebuilder:validation:Optional
	vlan?: null | float64 @go(Vlan,*float64)
}

// TransitVirtualInterfaceSpec defines the desired state of TransitVirtualInterface
#TransitVirtualInterfaceSpec: {
	v1.#ResourceSpec
	forProvider: #TransitVirtualInterfaceParameters @go(ForProvider)

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
	initProvider?: #TransitVirtualInterfaceInitParameters @go(InitProvider)
}

// TransitVirtualInterfaceStatus defines the observed state of TransitVirtualInterface.
#TransitVirtualInterfaceStatus: {
	v1.#ResourceStatus
	atProvider?: #TransitVirtualInterfaceObservation @go(AtProvider)
}

// TransitVirtualInterface is the Schema for the TransitVirtualInterfaces API. Provides a Direct Connect transit virtual interface resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TransitVirtualInterface: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.addressFamily) || (has(self.initProvider) && has(self.initProvider.addressFamily))",message="spec.forProvider.addressFamily is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.bgpAsn) || (has(self.initProvider) && has(self.initProvider.bgpAsn))",message="spec.forProvider.bgpAsn is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.vlan) || (has(self.initProvider) && has(self.initProvider.vlan))",message="spec.forProvider.vlan is a required parameter"
	spec:    #TransitVirtualInterfaceSpec   @go(Spec)
	status?: #TransitVirtualInterfaceStatus @go(Status)
}

// TransitVirtualInterfaceList contains a list of TransitVirtualInterfaces
#TransitVirtualInterfaceList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TransitVirtualInterface] @go(Items,[]TransitVirtualInterface)
}