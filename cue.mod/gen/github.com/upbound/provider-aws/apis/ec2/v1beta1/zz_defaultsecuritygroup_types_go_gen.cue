// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#DefaultSecurityGroupEgressInitParameters: {
	// List of CIDR blocks.
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupEgressObservation: {
	// List of CIDR blocks.
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupEgressParameters: {
	// List of CIDR blocks.
	// +kubebuilder:validation:Optional
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	// +kubebuilder:validation:Optional
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	// +kubebuilder:validation:Optional
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	// +kubebuilder:validation:Optional
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	// +kubebuilder:validation:Optional
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	// +kubebuilder:validation:Optional
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	// +kubebuilder:validation:Optional
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupIngressInitParameters: {
	// List of CIDR blocks.
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupIngressObservation: {
	// List of CIDR blocks.
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupIngressParameters: {
	// List of CIDR blocks.
	// +kubebuilder:validation:Optional
	cidrBlocks?: [...null | string] @go(CidrBlocks,[]*string)

	// Description of this rule.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Start port (or ICMP type number if protocol is icmp)
	// +kubebuilder:validation:Optional
	fromPort?: null | float64 @go(FromPort,*float64)

	// List of IPv6 CIDR blocks.
	// +kubebuilder:validation:Optional
	ipv6CidrBlocks?: [...null | string] @go(IPv6CidrBlocks,[]*string)

	// List of prefix list IDs (for allowing access to VPC endpoints)
	// +kubebuilder:validation:Optional
	prefixListIds?: [...null | string] @go(PrefixListIds,[]*string)

	// Protocol. If you select a protocol of "-1" (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, tcp, udp, or -1 use the protocol number.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
	// +kubebuilder:validation:Optional
	securityGroups?: [...null | string] @go(SecurityGroups,[]*string)

	// Whether the security group itself will be added as a source to this egress rule.
	// +kubebuilder:validation:Optional
	self?: null | bool @go(Self,*bool)

	// End range port (or ICMP code if protocol is icmp).
	// +kubebuilder:validation:Optional
	toPort?: null | float64 @go(ToPort,*float64)
}

#DefaultSecurityGroupInitParameters: {
	// Configuration block. Detailed below.
	egress?: [...#DefaultSecurityGroupEgressInitParameters] @go(Egress,[]DefaultSecurityGroupEgressInitParameters)

	// Configuration block. Detailed below.
	ingress?: [...#DefaultSecurityGroupIngressInitParameters] @go(Ingress,[]DefaultSecurityGroupIngressInitParameters)
	revokeRulesOnDelete?: null | bool @go(RevokeRulesOnDelete,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#DefaultSecurityGroupObservation: {
	// ARN of the security group.
	arn?: null | string @go(Arn,*string)

	// Description of this rule.
	description?: null | string @go(Description,*string)

	// Configuration block. Detailed below.
	egress?: [...#DefaultSecurityGroupEgressObservation] @go(Egress,[]DefaultSecurityGroupEgressObservation)

	// ID of the security group.
	id?: null | string @go(ID,*string)

	// Configuration block. Detailed below.
	ingress?: [...#DefaultSecurityGroupIngressObservation] @go(Ingress,[]DefaultSecurityGroupIngressObservation)

	// Name of the security group.
	name?: null | string @go(Name,*string)

	// Owner ID.
	ownerId?:             null | string @go(OwnerID,*string)
	revokeRulesOnDelete?: null | bool   @go(RevokeRulesOnDelete,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// VPC ID. Note that changing the  It will be left in its current state.
	vpcId?: null | string @go(VPCID,*string)
}

#DefaultSecurityGroupParameters: {
	// Configuration block. Detailed below.
	// +kubebuilder:validation:Optional
	egress?: [...#DefaultSecurityGroupEgressParameters] @go(Egress,[]DefaultSecurityGroupEgressParameters)

	// Configuration block. Detailed below.
	// +kubebuilder:validation:Optional
	ingress?: [...#DefaultSecurityGroupIngressParameters] @go(Ingress,[]DefaultSecurityGroupIngressParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// +kubebuilder:validation:Optional
	revokeRulesOnDelete?: null | bool @go(RevokeRulesOnDelete,*bool)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// VPC ID. Note that changing the  It will be left in its current state.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +kubebuilder:validation:Optional
	vpcId?: null | string @go(VPCID,*string)

	// Reference to a VPC in ec2 to populate vpcId.
	// +kubebuilder:validation:Optional
	vpcIdRef?: null | v1.#Reference @go(VPCIDRef,*v1.Reference)

	// Selector for a VPC in ec2 to populate vpcId.
	// +kubebuilder:validation:Optional
	vpcIdSelector?: null | v1.#Selector @go(VPCIDSelector,*v1.Selector)
}

// DefaultSecurityGroupSpec defines the desired state of DefaultSecurityGroup
#DefaultSecurityGroupSpec: {
	v1.#ResourceSpec
	forProvider: #DefaultSecurityGroupParameters @go(ForProvider)

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
	initProvider?: #DefaultSecurityGroupInitParameters @go(InitProvider)
}

// DefaultSecurityGroupStatus defines the observed state of DefaultSecurityGroup.
#DefaultSecurityGroupStatus: {
	v1.#ResourceStatus
	atProvider?: #DefaultSecurityGroupObservation @go(AtProvider)
}

// DefaultSecurityGroup is the Schema for the DefaultSecurityGroups API. Manage a default security group resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DefaultSecurityGroup: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec:      #DefaultSecurityGroupSpec   @go(Spec)
	status?:   #DefaultSecurityGroupStatus @go(Status)
}

// DefaultSecurityGroupList contains a list of DefaultSecurityGroups
#DefaultSecurityGroupList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#DefaultSecurityGroup] @go(Items,[]DefaultSecurityGroup)
}
