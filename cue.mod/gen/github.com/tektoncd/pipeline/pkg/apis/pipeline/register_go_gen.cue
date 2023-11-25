// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/tektoncd/pipeline/pkg/apis/pipeline

package pipeline

// GroupName is the Kubernetes resource group name for Pipeline types.
#GroupName: "tekton.dev"

// ClusterTaskLabelKey is used as the label identifier for a ClusterTask
#ClusterTaskLabelKey: "tekton.dev/clusterTask"

// TaskLabelKey is used as the label identifier for a Task
#TaskLabelKey: "tekton.dev/task"

// TaskRunLabelKey is used as the label identifier for a TaskRun
#TaskRunLabelKey: "tekton.dev/taskRun"

// PipelineLabelKey is used as the label identifier for a Pipeline
#PipelineLabelKey: "tekton.dev/pipeline"

// PipelineRunLabelKey is used as the label identifier for a PipelineRun
#PipelineRunLabelKey: "tekton.dev/pipelineRun"

// PipelineTaskLabelKey is used as the label identifier for a PipelineTask
#PipelineTaskLabelKey: "tekton.dev/pipelineTask"

// RunKey is used as the label identifier for a Run
#RunKey: "tekton.dev/run"

// CustomRunKey is used as the label identifier for a CustomRun
#CustomRunKey: "tekton.dev/customRun"

// MemberOfLabelKey is used as the label identifier for a PipelineTask
// Set to Tasks/Finally depending on the position of the PipelineTask
#MemberOfLabelKey: "tekton.dev/memberOf"
