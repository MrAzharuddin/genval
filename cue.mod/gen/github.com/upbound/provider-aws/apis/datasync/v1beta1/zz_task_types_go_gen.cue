// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/datasync/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ExcludesInitParameters: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	value?: null | string @go(Value,*string)
}

#ExcludesObservation: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	value?: null | string @go(Value,*string)
}

#ExcludesParameters: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	// +kubebuilder:validation:Optional
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#IncludesInitParameters: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	value?: null | string @go(Value,*string)
}

#IncludesObservation: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	value?: null | string @go(Value,*string)
}

#IncludesParameters: {
	// The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
	// +kubebuilder:validation:Optional
	filterType?: null | string @go(FilterType,*string)

	// A single filter string that consists of the patterns to exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#OptionsInitParameters: {
	// A file metadata that shows the last time a file was accessed (that is when the file was read or written to). If set to BEST_EFFORT, the DataSync Task attempts to preserve the original (that is, the version before sync PREPARING phase) atime attribute on all source files. Valid values: BEST_EFFORT, NONE. Default: BEST_EFFORT.
	atime?: null | string @go(Atime,*string)

	// Limits the bandwidth utilized. For example, to set a maximum of 1 MB, set this value to 1048576. Value values: -1 or greater. Default: -1 (unlimited).
	bytesPerSecond?: null | float64 @go(BytesPerSecond,*float64)

	// Group identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	gid?: null | string @go(GID,*string)

	// Determines the type of logs that DataSync publishes to a log stream in the Amazon CloudWatch log group that you provide. Valid values: OFF, BASIC, TRANSFER. Default: OFF.
	logLevel?: null | string @go(LogLevel,*string)

	// A file metadata that indicates the last time a file was modified (written to) before the sync PREPARING phase. Value values: NONE, PRESERVE. Default: PRESERVE.
	mtime?: null | string @go(Mtime,*string)

	// Determines whether files at the destination should be overwritten or preserved when copying files. Valid values: ALWAYS, NEVER. Default: ALWAYS.
	overwriteMode?: null | string @go(OverwriteMode,*string)

	// Determines which users or groups can access a file for a specific purpose such as reading, writing, or execution of the file. Valid values: NONE, PRESERVE. Default: PRESERVE.
	posixPermissions?: null | string @go(PosixPermissions,*string)

	// Whether files deleted in the source should be removed or preserved in the destination file system. Valid values: PRESERVE, REMOVE. Default: PRESERVE.
	preserveDeletedFiles?: null | string @go(PreserveDeletedFiles,*string)

	// Whether the DataSync Task should preserve the metadata of block and character devices in the source files system, and recreate the files with that device name and metadata on the destination. The DataSync Task can’t sync the actual contents of such devices, because many of the devices are non-terminal and don’t return an end of file (EOF) marker. Valid values: NONE, PRESERVE. Default: NONE (ignore special devices).
	preserveDevices?: null | string @go(PreserveDevices,*string)

	// Determines which components of the SMB security descriptor are copied from source to destination objects. This value is only used for transfers between SMB and Amazon FSx for Windows File Server locations, or between two Amazon FSx for Windows File Server locations. Valid values: NONE, OWNER_DACL, OWNER_DACL_SACL.
	securityDescriptorCopyFlags?: null | string @go(SecurityDescriptorCopyFlags,*string)

	// Determines whether tasks should be queued before executing the tasks. Valid values: ENABLED, DISABLED. Default ENABLED.
	taskQueueing?: null | string @go(TaskQueueing,*string)

	// Determines whether DataSync transfers only the data and metadata that differ between the source and the destination location, or whether DataSync transfers all the content from the source, without comparing to the destination location. Valid values: CHANGED, ALL. Default: CHANGED
	transferMode?: null | string @go(TransferMode,*string)

	// User identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	uid?: null | string @go(UID,*string)

	// Whether a data integrity verification should be performed at the end of a task execution after all data and metadata have been transferred. Valid values: NONE, POINT_IN_TIME_CONSISTENT, ONLY_FILES_TRANSFERRED. Default: POINT_IN_TIME_CONSISTENT.
	verifyMode?: null | string @go(VerifyMode,*string)
}

#OptionsObservation: {
	// A file metadata that shows the last time a file was accessed (that is when the file was read or written to). If set to BEST_EFFORT, the DataSync Task attempts to preserve the original (that is, the version before sync PREPARING phase) atime attribute on all source files. Valid values: BEST_EFFORT, NONE. Default: BEST_EFFORT.
	atime?: null | string @go(Atime,*string)

	// Limits the bandwidth utilized. For example, to set a maximum of 1 MB, set this value to 1048576. Value values: -1 or greater. Default: -1 (unlimited).
	bytesPerSecond?: null | float64 @go(BytesPerSecond,*float64)

	// Group identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	gid?: null | string @go(GID,*string)

	// Determines the type of logs that DataSync publishes to a log stream in the Amazon CloudWatch log group that you provide. Valid values: OFF, BASIC, TRANSFER. Default: OFF.
	logLevel?: null | string @go(LogLevel,*string)

	// A file metadata that indicates the last time a file was modified (written to) before the sync PREPARING phase. Value values: NONE, PRESERVE. Default: PRESERVE.
	mtime?: null | string @go(Mtime,*string)

	// Determines whether files at the destination should be overwritten or preserved when copying files. Valid values: ALWAYS, NEVER. Default: ALWAYS.
	overwriteMode?: null | string @go(OverwriteMode,*string)

	// Determines which users or groups can access a file for a specific purpose such as reading, writing, or execution of the file. Valid values: NONE, PRESERVE. Default: PRESERVE.
	posixPermissions?: null | string @go(PosixPermissions,*string)

	// Whether files deleted in the source should be removed or preserved in the destination file system. Valid values: PRESERVE, REMOVE. Default: PRESERVE.
	preserveDeletedFiles?: null | string @go(PreserveDeletedFiles,*string)

	// Whether the DataSync Task should preserve the metadata of block and character devices in the source files system, and recreate the files with that device name and metadata on the destination. The DataSync Task can’t sync the actual contents of such devices, because many of the devices are non-terminal and don’t return an end of file (EOF) marker. Valid values: NONE, PRESERVE. Default: NONE (ignore special devices).
	preserveDevices?: null | string @go(PreserveDevices,*string)

	// Determines which components of the SMB security descriptor are copied from source to destination objects. This value is only used for transfers between SMB and Amazon FSx for Windows File Server locations, or between two Amazon FSx for Windows File Server locations. Valid values: NONE, OWNER_DACL, OWNER_DACL_SACL.
	securityDescriptorCopyFlags?: null | string @go(SecurityDescriptorCopyFlags,*string)

	// Determines whether tasks should be queued before executing the tasks. Valid values: ENABLED, DISABLED. Default ENABLED.
	taskQueueing?: null | string @go(TaskQueueing,*string)

	// Determines whether DataSync transfers only the data and metadata that differ between the source and the destination location, or whether DataSync transfers all the content from the source, without comparing to the destination location. Valid values: CHANGED, ALL. Default: CHANGED
	transferMode?: null | string @go(TransferMode,*string)

	// User identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	uid?: null | string @go(UID,*string)

	// Whether a data integrity verification should be performed at the end of a task execution after all data and metadata have been transferred. Valid values: NONE, POINT_IN_TIME_CONSISTENT, ONLY_FILES_TRANSFERRED. Default: POINT_IN_TIME_CONSISTENT.
	verifyMode?: null | string @go(VerifyMode,*string)
}

#OptionsParameters: {
	// A file metadata that shows the last time a file was accessed (that is when the file was read or written to). If set to BEST_EFFORT, the DataSync Task attempts to preserve the original (that is, the version before sync PREPARING phase) atime attribute on all source files. Valid values: BEST_EFFORT, NONE. Default: BEST_EFFORT.
	// +kubebuilder:validation:Optional
	atime?: null | string @go(Atime,*string)

	// Limits the bandwidth utilized. For example, to set a maximum of 1 MB, set this value to 1048576. Value values: -1 or greater. Default: -1 (unlimited).
	// +kubebuilder:validation:Optional
	bytesPerSecond?: null | float64 @go(BytesPerSecond,*float64)

	// Group identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	// +kubebuilder:validation:Optional
	gid?: null | string @go(GID,*string)

	// Determines the type of logs that DataSync publishes to a log stream in the Amazon CloudWatch log group that you provide. Valid values: OFF, BASIC, TRANSFER. Default: OFF.
	// +kubebuilder:validation:Optional
	logLevel?: null | string @go(LogLevel,*string)

	// A file metadata that indicates the last time a file was modified (written to) before the sync PREPARING phase. Value values: NONE, PRESERVE. Default: PRESERVE.
	// +kubebuilder:validation:Optional
	mtime?: null | string @go(Mtime,*string)

	// Determines whether files at the destination should be overwritten or preserved when copying files. Valid values: ALWAYS, NEVER. Default: ALWAYS.
	// +kubebuilder:validation:Optional
	overwriteMode?: null | string @go(OverwriteMode,*string)

	// Determines which users or groups can access a file for a specific purpose such as reading, writing, or execution of the file. Valid values: NONE, PRESERVE. Default: PRESERVE.
	// +kubebuilder:validation:Optional
	posixPermissions?: null | string @go(PosixPermissions,*string)

	// Whether files deleted in the source should be removed or preserved in the destination file system. Valid values: PRESERVE, REMOVE. Default: PRESERVE.
	// +kubebuilder:validation:Optional
	preserveDeletedFiles?: null | string @go(PreserveDeletedFiles,*string)

	// Whether the DataSync Task should preserve the metadata of block and character devices in the source files system, and recreate the files with that device name and metadata on the destination. The DataSync Task can’t sync the actual contents of such devices, because many of the devices are non-terminal and don’t return an end of file (EOF) marker. Valid values: NONE, PRESERVE. Default: NONE (ignore special devices).
	// +kubebuilder:validation:Optional
	preserveDevices?: null | string @go(PreserveDevices,*string)

	// Determines which components of the SMB security descriptor are copied from source to destination objects. This value is only used for transfers between SMB and Amazon FSx for Windows File Server locations, or between two Amazon FSx for Windows File Server locations. Valid values: NONE, OWNER_DACL, OWNER_DACL_SACL.
	// +kubebuilder:validation:Optional
	securityDescriptorCopyFlags?: null | string @go(SecurityDescriptorCopyFlags,*string)

	// Determines whether tasks should be queued before executing the tasks. Valid values: ENABLED, DISABLED. Default ENABLED.
	// +kubebuilder:validation:Optional
	taskQueueing?: null | string @go(TaskQueueing,*string)

	// Determines whether DataSync transfers only the data and metadata that differ between the source and the destination location, or whether DataSync transfers all the content from the source, without comparing to the destination location. Valid values: CHANGED, ALL. Default: CHANGED
	// +kubebuilder:validation:Optional
	transferMode?: null | string @go(TransferMode,*string)

	// User identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
	// +kubebuilder:validation:Optional
	uid?: null | string @go(UID,*string)

	// Whether a data integrity verification should be performed at the end of a task execution after all data and metadata have been transferred. Valid values: NONE, POINT_IN_TIME_CONSISTENT, ONLY_FILES_TRANSFERRED. Default: POINT_IN_TIME_CONSISTENT.
	// +kubebuilder:validation:Optional
	verifyMode?: null | string @go(VerifyMode,*string)
}

#ScheduleInitParameters: {
	// Specifies the schedule you want your task to use for repeated executions. For more information, see Schedule Expressions for Rules.
	scheduleExpression?: null | string @go(ScheduleExpression,*string)
}

#ScheduleObservation: {
	// Specifies the schedule you want your task to use for repeated executions. For more information, see Schedule Expressions for Rules.
	scheduleExpression?: null | string @go(ScheduleExpression,*string)
}

#ScheduleParameters: {
	// Specifies the schedule you want your task to use for repeated executions. For more information, see Schedule Expressions for Rules.
	// +kubebuilder:validation:Optional
	scheduleExpression?: null | string @go(ScheduleExpression,*string)
}

#TaskInitParameters: {
	// Filter rules that determines which files to exclude from a task.
	excludes?: [...#ExcludesInitParameters] @go(Excludes,[]ExcludesInitParameters)

	// Filter rules that determines which files to include in a task.
	includes?: [...#IncludesInitParameters] @go(Includes,[]IncludesInitParameters)

	// Name of the DataSync Task.
	name?: null | string @go(Name,*string)

	// Configuration block containing option that controls the default behavior when you start an execution of this DataSync Task. For each individual task execution, you can override these options by specifying an overriding configuration in those executions.
	options?: [...#OptionsInitParameters] @go(Options,[]OptionsInitParameters)

	// Specifies a schedule used to periodically transfer files from a source to a destination location.
	schedule?: [...#ScheduleInitParameters] @go(Schedule,[]ScheduleInitParameters)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#TaskObservation: {
	// Amazon Resource Name (ARN) of the DataSync Task.
	arn?: null | string @go(Arn,*string)

	// Amazon Resource Name (ARN) of the CloudWatch Log Group that is used to monitor and log events in the sync task.
	cloudwatchLogGroupArn?: null | string @go(CloudwatchLogGroupArn,*string)

	// Amazon Resource Name (ARN) of destination DataSync Location.
	destinationLocationArn?: null | string @go(DestinationLocationArn,*string)

	// Filter rules that determines which files to exclude from a task.
	excludes?: [...#ExcludesObservation] @go(Excludes,[]ExcludesObservation)

	// Amazon Resource Name (ARN) of the DataSync Task.
	id?: null | string @go(ID,*string)

	// Filter rules that determines which files to include in a task.
	includes?: [...#IncludesObservation] @go(Includes,[]IncludesObservation)

	// Name of the DataSync Task.
	name?: null | string @go(Name,*string)

	// Configuration block containing option that controls the default behavior when you start an execution of this DataSync Task. For each individual task execution, you can override these options by specifying an overriding configuration in those executions.
	options?: [...#OptionsObservation] @go(Options,[]OptionsObservation)

	// Specifies a schedule used to periodically transfer files from a source to a destination location.
	schedule?: [...#ScheduleObservation] @go(Schedule,[]ScheduleObservation)

	// Amazon Resource Name (ARN) of source DataSync Location.
	sourceLocationArn?: null | string @go(SourceLocationArn,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#TaskParameters: {
	// Amazon Resource Name (ARN) of the CloudWatch Log Group that is used to monitor and log events in the sync task.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/cloudwatchlogs/v1beta1.Group
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	cloudwatchLogGroupArn?: null | string @go(CloudwatchLogGroupArn,*string)

	// Reference to a Group in cloudwatchlogs to populate cloudwatchLogGroupArn.
	// +kubebuilder:validation:Optional
	cloudwatchLogGroupArnRef?: null | v1.#Reference @go(CloudwatchLogGroupArnRef,*v1.Reference)

	// Selector for a Group in cloudwatchlogs to populate cloudwatchLogGroupArn.
	// +kubebuilder:validation:Optional
	cloudwatchLogGroupArnSelector?: null | v1.#Selector @go(CloudwatchLogGroupArnSelector,*v1.Selector)

	// Amazon Resource Name (ARN) of destination DataSync Location.
	// +crossplane:generate:reference:type=LocationS3
	// +kubebuilder:validation:Optional
	destinationLocationArn?: null | string @go(DestinationLocationArn,*string)

	// Reference to a LocationS3 to populate destinationLocationArn.
	// +kubebuilder:validation:Optional
	destinationLocationArnRef?: null | v1.#Reference @go(DestinationLocationArnRef,*v1.Reference)

	// Selector for a LocationS3 to populate destinationLocationArn.
	// +kubebuilder:validation:Optional
	destinationLocationArnSelector?: null | v1.#Selector @go(DestinationLocationArnSelector,*v1.Selector)

	// Filter rules that determines which files to exclude from a task.
	// +kubebuilder:validation:Optional
	excludes?: [...#ExcludesParameters] @go(Excludes,[]ExcludesParameters)

	// Filter rules that determines which files to include in a task.
	// +kubebuilder:validation:Optional
	includes?: [...#IncludesParameters] @go(Includes,[]IncludesParameters)

	// Name of the DataSync Task.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Configuration block containing option that controls the default behavior when you start an execution of this DataSync Task. For each individual task execution, you can override these options by specifying an overriding configuration in those executions.
	// +kubebuilder:validation:Optional
	options?: [...#OptionsParameters] @go(Options,[]OptionsParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Specifies a schedule used to periodically transfer files from a source to a destination location.
	// +kubebuilder:validation:Optional
	schedule?: [...#ScheduleParameters] @go(Schedule,[]ScheduleParameters)

	// Amazon Resource Name (ARN) of source DataSync Location.
	// +crossplane:generate:reference:type=LocationS3
	// +kubebuilder:validation:Optional
	sourceLocationArn?: null | string @go(SourceLocationArn,*string)

	// Reference to a LocationS3 to populate sourceLocationArn.
	// +kubebuilder:validation:Optional
	sourceLocationArnRef?: null | v1.#Reference @go(SourceLocationArnRef,*v1.Reference)

	// Selector for a LocationS3 to populate sourceLocationArn.
	// +kubebuilder:validation:Optional
	sourceLocationArnSelector?: null | v1.#Selector @go(SourceLocationArnSelector,*v1.Selector)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// TaskSpec defines the desired state of Task
#TaskSpec: {
	v1.#ResourceSpec
	forProvider: #TaskParameters @go(ForProvider)

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
	initProvider?: #TaskInitParameters @go(InitProvider)
}

// TaskStatus defines the observed state of Task.
#TaskStatus: {
	v1.#ResourceStatus
	atProvider?: #TaskObservation @go(AtProvider)
}

// Task is the Schema for the Tasks API. Manages an AWS DataSync Task
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Task: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #TaskSpec          @go(Spec)
	status?:   #TaskStatus        @go(Status)
}

// TaskList contains a list of Tasks
#TaskList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Task] @go(Items,[]Task)
}
