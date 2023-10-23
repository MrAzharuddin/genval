// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go sigs.k8s.io/cluster-api/errors

package errors

// ClusterError is a more descriptive kind of error that represents an error condition that
// should be set in the Cluster.Status. The "Reason" field is meant for short,
// enum-style constants meant to be interpreted by clusters. The "Message"
// field is meant to be read by humans.
#ClusterError: {
	Reason:  #ClusterStatusError
	Message: string
}