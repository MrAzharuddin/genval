// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/eks/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AutoscalingGroupsInitParameters: {
}

#AutoscalingGroupsObservation: {
	// Name of the AutoScaling Group.
	name?: null | string @go(Name,*string)
}

#AutoscalingGroupsParameters: {
}

#LaunchTemplateInitParameters: {
	// Identifier of the EC2 Launch Template. Conflicts with name.
	id?: null | string @go(ID,*string)

	// Name of the EC2 Launch Template. Conflicts with id.
	name?: null | string @go(Name,*string)

	// EC2 Launch Template version number. While the API accepts values like $Default and $Latest, the API will convert the value to the associated version number (e.g., 1). Using the default_version or latest_version attribute of the aws_launch_template resource or data source is recommended for this argument.
	version?: null | string @go(Version,*string)
}

#LaunchTemplateObservation: {
	// Identifier of the EC2 Launch Template. Conflicts with name.
	id?: null | string @go(ID,*string)

	// Name of the EC2 Launch Template. Conflicts with id.
	name?: null | string @go(Name,*string)

	// EC2 Launch Template version number. While the API accepts values like $Default and $Latest, the API will convert the value to the associated version number (e.g., 1). Using the default_version or latest_version attribute of the aws_launch_template resource or data source is recommended for this argument.
	version?: null | string @go(Version,*string)
}

#LaunchTemplateParameters: {
	// Identifier of the EC2 Launch Template. Conflicts with name.
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)

	// Name of the EC2 Launch Template. Conflicts with id.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// EC2 Launch Template version number. While the API accepts values like $Default and $Latest, the API will convert the value to the associated version number (e.g., 1). Using the default_version or latest_version attribute of the aws_launch_template resource or data source is recommended for this argument.
	// +kubebuilder:validation:Optional
	version?: null | string @go(Version,*string)
}

#NodeGroupInitParameters: {
	// Type of Amazon Machine Image (AMI) associated with the EKS Node Group. See the AWS documentation for valid values.
	amiType?: null | string @go(AMIType,*string)

	// Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT.
	capacityType?: null | string @go(CapacityType,*string)

	// Disk size in GiB for worker nodes. Defaults to 50 for Windows, 20 all other node groups.
	diskSize?: null | float64 @go(DiskSize,*float64)

	// Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
	forceUpdateVersion?: null | bool @go(ForceUpdateVersion,*bool)

	// List of instance types associated with the EKS Node Group. Defaults to ["t3.medium"].
	instanceTypes?: [...null | string] @go(InstanceTypes,[]*string)

	// Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configuration block with Launch Template settings. Detailed below.
	launchTemplate?: [...#LaunchTemplateInitParameters] @go(LaunchTemplate,[]LaunchTemplateInitParameters)

	// –  AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version.
	releaseVersion?: null | string @go(ReleaseVersion,*string)

	// Configuration block with remote access settings. Detailed below.
	remoteAccess?: [...#RemoteAccessInitParameters] @go(RemoteAccess,[]RemoteAccessInitParameters)

	// Configuration block with scaling settings. Detailed below.
	scalingConfig?: [...#ScalingConfigInitParameters] @go(ScalingConfig,[]ScalingConfigInitParameters)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group. Detailed below.
	taint?: [...#TaintInitParameters] @go(Taint,[]TaintInitParameters)
	updateConfig?: [...#UpdateConfigInitParameters] @go(UpdateConfig,[]UpdateConfigInitParameters)
}

#NodeGroupObservation: {
	// Type of Amazon Machine Image (AMI) associated with the EKS Node Group. See the AWS documentation for valid values.
	amiType?: null | string @go(AMIType,*string)

	// Amazon Resource Name (ARN) of the EKS Node Group.
	arn?: null | string @go(Arn,*string)

	// Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT.
	capacityType?: null | string @go(CapacityType,*string)

	// 100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9\-_]+$).
	clusterName?: null | string @go(ClusterName,*string)

	// Disk size in GiB for worker nodes. Defaults to 50 for Windows, 20 all other node groups.
	diskSize?: null | float64 @go(DiskSize,*float64)

	// Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
	forceUpdateVersion?: null | bool @go(ForceUpdateVersion,*bool)

	// EKS Cluster name and EKS Node Group name separated by a colon (:).
	id?: null | string @go(ID,*string)

	// List of instance types associated with the EKS Node Group. Defaults to ["t3.medium"].
	instanceTypes?: [...null | string] @go(InstanceTypes,[]*string)

	// Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configuration block with Launch Template settings. Detailed below.
	launchTemplate?: [...#LaunchTemplateObservation] @go(LaunchTemplate,[]LaunchTemplateObservation)

	// –  Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group.
	nodeRoleArn?: null | string @go(NodeRoleArn,*string)

	// –  AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version.
	releaseVersion?: null | string @go(ReleaseVersion,*string)

	// Configuration block with remote access settings. Detailed below.
	remoteAccess?: [...#RemoteAccessObservation] @go(RemoteAccess,[]RemoteAccessObservation)

	// List of objects containing information about underlying resources.
	resources?: [...#ResourcesObservation] @go(Resources,[]ResourcesObservation)

	// Configuration block with scaling settings. Detailed below.
	scalingConfig?: [...#ScalingConfigObservation] @go(ScalingConfig,[]ScalingConfigObservation)

	// Status of the EKS Node Group.
	status?: null | string @go(Status,*string)

	// Identifiers of EC2 Subnets to associate with the EKS Node Group. Amazon EKS managed node groups can be launched in both public and private subnets. If you plan to deploy load balancers to a subnet, the private subnet must have tag kubernetes.io/role/internal-elb, the public subnet must have tag kubernetes.io/role/elb.
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group. Detailed below.
	taint?: [...#TaintObservation] @go(Taint,[]TaintObservation)
	updateConfig?: [...#UpdateConfigObservation] @go(UpdateConfig,[]UpdateConfigObservation)

	// –  Kubernetes version. Defaults to EKS Cluster Kubernetes version.
	version?: null | string @go(Version,*string)
}

#NodeGroupParameters: {
	// Type of Amazon Machine Image (AMI) associated with the EKS Node Group. See the AWS documentation for valid values.
	// +kubebuilder:validation:Optional
	amiType?: null | string @go(AMIType,*string)

	// Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT.
	// +kubebuilder:validation:Optional
	capacityType?: null | string @go(CapacityType,*string)

	// 100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9\-_]+$).
	// +crossplane:generate:reference:type=Cluster
	// +crossplane:generate:reference:extractor=ExternalNameIfClusterActive()
	// +kubebuilder:validation:Optional
	clusterName?: null | string @go(ClusterName,*string)

	// Reference to a Cluster to populate clusterName.
	// +kubebuilder:validation:Optional
	clusterNameRef?: null | v1.#Reference @go(ClusterNameRef,*v1.Reference)

	// Selector for a Cluster to populate clusterName.
	// +kubebuilder:validation:Optional
	clusterNameSelector?: null | v1.#Selector @go(ClusterNameSelector,*v1.Selector)

	// Disk size in GiB for worker nodes. Defaults to 50 for Windows, 20 all other node groups.
	// +kubebuilder:validation:Optional
	diskSize?: null | float64 @go(DiskSize,*float64)

	// Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
	// +kubebuilder:validation:Optional
	forceUpdateVersion?: null | bool @go(ForceUpdateVersion,*bool)

	// List of instance types associated with the EKS Node Group. Defaults to ["t3.medium"].
	// +kubebuilder:validation:Optional
	instanceTypes?: [...null | string] @go(InstanceTypes,[]*string)

	// Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configuration block with Launch Template settings. Detailed below.
	// +kubebuilder:validation:Optional
	launchTemplate?: [...#LaunchTemplateParameters] @go(LaunchTemplate,[]LaunchTemplateParameters)

	// –  Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	nodeRoleArn?: null | string @go(NodeRoleArn,*string)

	// Reference to a Role in iam to populate nodeRoleArn.
	// +kubebuilder:validation:Optional
	nodeRoleArnRef?: null | v1.#Reference @go(NodeRoleArnRef,*v1.Reference)

	// Selector for a Role in iam to populate nodeRoleArn.
	// +kubebuilder:validation:Optional
	nodeRoleArnSelector?: null | v1.#Selector @go(NodeRoleArnSelector,*v1.Selector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// –  AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version.
	// +kubebuilder:validation:Optional
	releaseVersion?: null | string @go(ReleaseVersion,*string)

	// Configuration block with remote access settings. Detailed below.
	// +kubebuilder:validation:Optional
	remoteAccess?: [...#RemoteAccessParameters] @go(RemoteAccess,[]RemoteAccessParameters)

	// Configuration block with scaling settings. Detailed below.
	// +kubebuilder:validation:Optional
	scalingConfig?: [...#ScalingConfigParameters] @go(ScalingConfig,[]ScalingConfigParameters)

	// References to Subnet in ec2 to populate subnetIds.
	// +kubebuilder:validation:Optional
	subnetIdRefs?: [...v1.#Reference] @go(SubnetIDRefs,[]v1.Reference)

	// Selector for a list of Subnet in ec2 to populate subnetIds.
	// +kubebuilder:validation:Optional
	subnetIdSelector?: null | v1.#Selector @go(SubnetIDSelector,*v1.Selector)

	// Identifiers of EC2 Subnets to associate with the EKS Node Group. Amazon EKS managed node groups can be launched in both public and private subnets. If you plan to deploy load balancers to a subnet, the private subnet must have tag kubernetes.io/role/internal-elb, the public subnet must have tag kubernetes.io/role/elb.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group. Detailed below.
	// +kubebuilder:validation:Optional
	taint?: [...#TaintParameters] @go(Taint,[]TaintParameters)

	// +kubebuilder:validation:Optional
	updateConfig?: [...#UpdateConfigParameters] @go(UpdateConfig,[]UpdateConfigParameters)

	// –  Kubernetes version. Defaults to EKS Cluster Kubernetes version.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/eks/v1beta1.Cluster
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("version",false)
	// +kubebuilder:validation:Optional
	version?: null | string @go(Version,*string)

	// Reference to a Cluster in eks to populate version.
	// +kubebuilder:validation:Optional
	versionRef?: null | v1.#Reference @go(VersionRef,*v1.Reference)

	// Selector for a Cluster in eks to populate version.
	// +kubebuilder:validation:Optional
	versionSelector?: null | v1.#Selector @go(VersionSelector,*v1.Selector)
}

#RemoteAccessInitParameters: {
	// EC2 Key Pair name that provides access for remote communication with the worker nodes in the EKS Node Group. If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group, either port 3389 for Windows, or port 22 for all other operating systems is opened on the worker nodes to the Internet (0.0.0.0/0). For Windows nodes, this will allow you to use RDP, for all others this allows you to SSH into the worker nodes.
	ec2SshKey?: null | string @go(EC2SSHKey,*string)
}

#RemoteAccessObservation: {
	// EC2 Key Pair name that provides access for remote communication with the worker nodes in the EKS Node Group. If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group, either port 3389 for Windows, or port 22 for all other operating systems is opened on the worker nodes to the Internet (0.0.0.0/0). For Windows nodes, this will allow you to use RDP, for all others this allows you to SSH into the worker nodes.
	ec2SshKey?: null | string @go(EC2SSHKey,*string)

	// Set of EC2 Security Group IDs to allow SSH access (port 22) from on the worker nodes. If you specify ec2_ssh_key, but do not specify this configuration when you create an EKS Node Group, port 22 on the worker nodes is opened to the Internet (0.0.0.0/0).
	sourceSecurityGroupIds?: [...null | string] @go(SourceSecurityGroupIds,[]*string)
}

#RemoteAccessParameters: {
	// EC2 Key Pair name that provides access for remote communication with the worker nodes in the EKS Node Group. If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group, either port 3389 for Windows, or port 22 for all other operating systems is opened on the worker nodes to the Internet (0.0.0.0/0). For Windows nodes, this will allow you to use RDP, for all others this allows you to SSH into the worker nodes.
	// +kubebuilder:validation:Optional
	ec2SshKey?: null | string @go(EC2SSHKey,*string)

	// References to SecurityGroup in ec2 to populate sourceSecurityGroupIds.
	// +kubebuilder:validation:Optional
	sourceSecurityGroupIdRefs?: [...v1.#Reference] @go(SourceSecurityGroupIDRefs,[]v1.Reference)

	// Selector for a list of SecurityGroup in ec2 to populate sourceSecurityGroupIds.
	// +kubebuilder:validation:Optional
	sourceSecurityGroupIdSelector?: null | v1.#Selector @go(SourceSecurityGroupIDSelector,*v1.Selector)

	// Set of EC2 Security Group IDs to allow SSH access (port 22) from on the worker nodes. If you specify ec2_ssh_key, but do not specify this configuration when you create an EKS Node Group, port 22 on the worker nodes is opened to the Internet (0.0.0.0/0).
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.SecurityGroup
	// +crossplane:generate:reference:refFieldName=SourceSecurityGroupIDRefs
	// +crossplane:generate:reference:selectorFieldName=SourceSecurityGroupIDSelector
	// +kubebuilder:validation:Optional
	sourceSecurityGroupIds?: [...null | string] @go(SourceSecurityGroupIds,[]*string)
}

#ResourcesInitParameters: {
}

#ResourcesObservation: {
	// List of objects containing information about AutoScaling Groups.
	autoscalingGroups?: [...#AutoscalingGroupsObservation] @go(AutoscalingGroups,[]AutoscalingGroupsObservation)

	// Identifier of the remote access EC2 Security Group.
	remoteAccessSecurityGroupId?: null | string @go(RemoteAccessSecurityGroupID,*string)
}

#ResourcesParameters: {
}

#ScalingConfigInitParameters: {
	// Desired number of worker nodes.
	desiredSize?: null | float64 @go(DesiredSize,*float64)

	// Maximum number of worker nodes.
	maxSize?: null | float64 @go(MaxSize,*float64)

	// Minimum number of worker nodes.
	minSize?: null | float64 @go(MinSize,*float64)
}

#ScalingConfigObservation: {
	// Desired number of worker nodes.
	desiredSize?: null | float64 @go(DesiredSize,*float64)

	// Maximum number of worker nodes.
	maxSize?: null | float64 @go(MaxSize,*float64)

	// Minimum number of worker nodes.
	minSize?: null | float64 @go(MinSize,*float64)
}

#ScalingConfigParameters: {
	// Desired number of worker nodes.
	// +kubebuilder:validation:Optional
	desiredSize?: null | float64 @go(DesiredSize,*float64)

	// Maximum number of worker nodes.
	// +kubebuilder:validation:Optional
	maxSize?: null | float64 @go(MaxSize,*float64)

	// Minimum number of worker nodes.
	// +kubebuilder:validation:Optional
	minSize?: null | float64 @go(MinSize,*float64)
}

#TaintInitParameters: {
	// The effect of the taint. Valid values: NO_SCHEDULE, NO_EXECUTE, PREFER_NO_SCHEDULE.
	effect?: null | string @go(Effect,*string)

	// The key of the taint. Maximum length of 63.
	key?: null | string @go(Key,*string)

	// The value of the taint. Maximum length of 63.
	value?: null | string @go(Value,*string)
}

#TaintObservation: {
	// The effect of the taint. Valid values: NO_SCHEDULE, NO_EXECUTE, PREFER_NO_SCHEDULE.
	effect?: null | string @go(Effect,*string)

	// The key of the taint. Maximum length of 63.
	key?: null | string @go(Key,*string)

	// The value of the taint. Maximum length of 63.
	value?: null | string @go(Value,*string)
}

#TaintParameters: {
	// The effect of the taint. Valid values: NO_SCHEDULE, NO_EXECUTE, PREFER_NO_SCHEDULE.
	// +kubebuilder:validation:Optional
	effect?: null | string @go(Effect,*string)

	// The key of the taint. Maximum length of 63.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)

	// The value of the taint. Maximum length of 63.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#UpdateConfigInitParameters: {
	// Desired max number of unavailable worker nodes during node group update.
	maxUnavailable?: null | float64 @go(MaxUnavailable,*float64)

	// Desired max percentage of unavailable worker nodes during node group update.
	maxUnavailablePercentage?: null | float64 @go(MaxUnavailablePercentage,*float64)
}

#UpdateConfigObservation: {
	// Desired max number of unavailable worker nodes during node group update.
	maxUnavailable?: null | float64 @go(MaxUnavailable,*float64)

	// Desired max percentage of unavailable worker nodes during node group update.
	maxUnavailablePercentage?: null | float64 @go(MaxUnavailablePercentage,*float64)
}

#UpdateConfigParameters: {
	// Desired max number of unavailable worker nodes during node group update.
	// +kubebuilder:validation:Optional
	maxUnavailable?: null | float64 @go(MaxUnavailable,*float64)

	// Desired max percentage of unavailable worker nodes during node group update.
	// +kubebuilder:validation:Optional
	maxUnavailablePercentage?: null | float64 @go(MaxUnavailablePercentage,*float64)
}

// NodeGroupSpec defines the desired state of NodeGroup
#NodeGroupSpec: {
	v1.#ResourceSpec
	forProvider: #NodeGroupParameters @go(ForProvider)

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
	initProvider?: #NodeGroupInitParameters @go(InitProvider)
}

// NodeGroupStatus defines the observed state of NodeGroup.
#NodeGroupStatus: {
	v1.#ResourceStatus
	atProvider?: #NodeGroupObservation @go(AtProvider)
}

// NodeGroup is the Schema for the NodeGroups API. Manages an EKS Node Group
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#NodeGroup: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.scalingConfig) || (has(self.initProvider) && has(self.initProvider.scalingConfig))",message="spec.forProvider.scalingConfig is a required parameter"
	spec:    #NodeGroupSpec   @go(Spec)
	status?: #NodeGroupStatus @go(Status)
}

// NodeGroupList contains a list of NodeGroups
#NodeGroupList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#NodeGroup] @go(Items,[]NodeGroup)
}