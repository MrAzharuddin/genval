// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/route53recoverycontrolconfig/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ClusterEndpointsInitParameters: {
}

#ClusterEndpointsObservation: {
	// Cluster endpoint.
	endpoint?: null | string @go(Endpoint,*string)

	// Region of the endpoint.
	region?: null | string @go(Region,*string)
}

#ClusterEndpointsParameters: {
}

#ClusterInitParameters: {
	// Unique name describing the cluster.
	name?: null | string @go(Name,*string)
}

#ClusterObservation: {
	// ARN of the cluster
	arn?: null | string @go(Arn,*string)

	// List of 5 endpoints in 5 regions that can be used to talk to the cluster. See below.
	clusterEndpoints?: [...#ClusterEndpointsObservation] @go(ClusterEndpoints,[]ClusterEndpointsObservation)
	id?: null | string @go(ID,*string)

	// Unique name describing the cluster.
	name?: null | string @go(Name,*string)

	// Status of cluster. PENDING when it is being created, PENDING_DELETION when it is being deleted and DEPLOYED otherwise.
	status?: null | string @go(Status,*string)
}

#ClusterParameters: {
	// Unique name describing the cluster.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region of the endpoint.
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// ClusterSpec defines the desired state of Cluster
#ClusterSpec: {
	v1.#ResourceSpec
	forProvider: #ClusterParameters @go(ForProvider)

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
	initProvider?: #ClusterInitParameters @go(InitProvider)
}

// ClusterStatus defines the observed state of Cluster.
#ClusterStatus: {
	v1.#ResourceStatus
	atProvider?: #ClusterObservation @go(AtProvider)
}

// Cluster is the Schema for the Clusters API. Provides an AWS Route 53 Recovery Control Config Cluster
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Cluster: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #ClusterSpec   @go(Spec)
	status?: #ClusterStatus @go(Status)
}

// ClusterList contains a list of Clusters
#ClusterList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Cluster] @go(Items,[]Cluster)
}
