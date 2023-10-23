// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go sigs.k8s.io/cluster-api/api/v1beta1

package v1beta1

import (
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// ConditionSeverity expresses the severity of a Condition Type failing.
#ConditionSeverity: string // #enumConditionSeverity

#enumConditionSeverity:
	#ConditionSeverityError |
	#ConditionSeverityWarning |
	#ConditionSeverityInfo |
	#ConditionSeverityNone

// ConditionSeverityError specifies that a condition with `Status=False` is an error.
#ConditionSeverityError: #ConditionSeverity & "Error"

// ConditionSeverityWarning specifies that a condition with `Status=False` is a warning.
#ConditionSeverityWarning: #ConditionSeverity & "Warning"

// ConditionSeverityInfo specifies that a condition with `Status=False` is informative.
#ConditionSeverityInfo: #ConditionSeverity & "Info"

// ConditionSeverityNone should apply only to conditions with `Status=True`.
#ConditionSeverityNone: #ConditionSeverity & ""

// ConditionType is a valid value for Condition.Type.
#ConditionType: string // #enumConditionType

#enumConditionType:
	#ReadyCondition |
	#InfrastructureReadyCondition |
	#ClusterClassVariablesReconciledCondition |
	#ControlPlaneInitializedCondition |
	#ControlPlaneReadyCondition |
	#BootstrapReadyCondition |
	#DrainingSucceededCondition |
	#PreDrainDeleteHookSucceededCondition |
	#PreTerminateDeleteHookSucceededCondition |
	#VolumeDetachSucceededCondition |
	#MachineHealthCheckSucceededCondition |
	#MachineOwnerRemediatedCondition |
	#ExternalRemediationTemplateAvailableCondition |
	#ExternalRemediationRequestAvailableCondition |
	#MachineNodeHealthyCondition |
	#RemediationAllowedCondition |
	#MachineDeploymentAvailableCondition |
	#MachinesCreatedCondition |
	#MachinesReadyCondition |
	#ResizedCondition |
	#TopologyReconciledCondition |
	#ClusterClassRefVersionsUpToDateCondition

// Condition defines an observation of a Cluster API resource operational state.
#Condition: {
	// Type of condition in CamelCase or in foo.example.com/CamelCase.
	// Many .condition.type values are consistent across resources like Available, but because arbitrary conditions
	// can be useful (see .node.status.conditions), the ability to deconflict is important.
	type: #ConditionType @go(Type)

	// Status of the condition, one of True, False, Unknown.
	status: corev1.#ConditionStatus @go(Status)

	// Severity provides an explicit classification of Reason code, so the users or machines can immediately
	// understand the current situation and act accordingly.
	// The Severity field MUST be set only when Status=False.
	// +optional
	severity?: #ConditionSeverity @go(Severity)

	// Last time the condition transitioned from one status to another.
	// This should be when the underlying condition changed. If that is not known, then using the time when
	// the API field changed is acceptable.
	lastTransitionTime: metav1.#Time @go(LastTransitionTime)

	// The reason for the condition's last transition in CamelCase.
	// The specific API may choose whether or not this field is considered a guaranteed API.
	// This field may not be empty.
	// +optional
	reason?: string @go(Reason)

	// A human readable message indicating details about the transition.
	// This field may be empty.
	// +optional
	message?: string @go(Message)
}

// Conditions provide observations of the operational state of a Cluster API resource.
#Conditions: [...#Condition]