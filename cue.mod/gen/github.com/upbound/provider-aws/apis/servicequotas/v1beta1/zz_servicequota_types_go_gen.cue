// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/servicequotas/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#MetricDimensionsInitParameters: {
}

#MetricDimensionsObservation: {
	class?:    null | string @go(Class,*string)
	resource?: null | string @go(Resource,*string)
	service?:  null | string @go(Service,*string)
	type?:     null | string @go(Type,*string)
}

#MetricDimensionsParameters: {
}

#ServiceQuotaInitParameters: {
	// Code of the service quota to track. For example: L-F678F1CE. Available values can be found with the AWS CLI service-quotas list-service-quotas command.
	quotaCode?: null | string @go(QuotaCode,*string)

	// Code of the service to track. For example: vpc. Available values can be found with the AWS CLI service-quotas list-services command.
	serviceCode?: null | string @go(ServiceCode,*string)

	// Float specifying the desired value for the service quota. If the desired value is higher than the current value, a quota increase request is submitted. When a known request is submitted and pending, the value reflects the desired value of the pending request.
	value?: null | float64 @go(Value,*float64)
}

#ServiceQuotaObservation: {
	// Whether the service quota can be increased.
	adjustable?: null | bool @go(Adjustable,*bool)

	// Amazon Resource Name (ARN) of the service quota.
	arn?: null | string @go(Arn,*string)

	// Default value of the service quota.
	defaultValue?: null | float64 @go(DefaultValue,*float64)

	// Service code and quota code, separated by a front slash (/)
	id?: null | string @go(ID,*string)

	// Code of the service quota to track. For example: L-F678F1CE. Available values can be found with the AWS CLI service-quotas list-service-quotas command.
	quotaCode?: null | string @go(QuotaCode,*string)

	// Name of the quota.
	quotaName?: null | string @go(QuotaName,*string)

	// Service code and quota code, separated by a front slash (/)
	requestId?:     null | string @go(RequestID,*string)
	requestStatus?: null | string @go(RequestStatus,*string)

	// Code of the service to track. For example: vpc. Available values can be found with the AWS CLI service-quotas list-services command.
	serviceCode?: null | string @go(ServiceCode,*string)

	// Name of the service.
	serviceName?: null | string @go(ServiceName,*string)

	// Information about the measurement.
	usageMetric?: [...#UsageMetricObservation] @go(UsageMetric,[]UsageMetricObservation)

	// Float specifying the desired value for the service quota. If the desired value is higher than the current value, a quota increase request is submitted. When a known request is submitted and pending, the value reflects the desired value of the pending request.
	value?: null | float64 @go(Value,*float64)
}

#ServiceQuotaParameters: {
	// Code of the service quota to track. For example: L-F678F1CE. Available values can be found with the AWS CLI service-quotas list-service-quotas command.
	// +kubebuilder:validation:Optional
	quotaCode?: null | string @go(QuotaCode,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Code of the service to track. For example: vpc. Available values can be found with the AWS CLI service-quotas list-services command.
	// +kubebuilder:validation:Optional
	serviceCode?: null | string @go(ServiceCode,*string)

	// Float specifying the desired value for the service quota. If the desired value is higher than the current value, a quota increase request is submitted. When a known request is submitted and pending, the value reflects the desired value of the pending request.
	// +kubebuilder:validation:Optional
	value?: null | float64 @go(Value,*float64)
}

#UsageMetricInitParameters: {
}

#UsageMetricObservation: {
	// The metric dimensions.
	metricDimensions?: [...#MetricDimensionsObservation] @go(MetricDimensions,[]MetricDimensionsObservation)

	// The name of the metric.
	metricName?: null | string @go(MetricName,*string)

	// The namespace of the metric.
	metricNamespace?: null | string @go(MetricNamespace,*string)

	// The metric statistic that AWS recommend you use when determining quota usage.
	metricStatisticRecommendation?: null | string @go(MetricStatisticRecommendation,*string)
}

#UsageMetricParameters: {
}

// ServiceQuotaSpec defines the desired state of ServiceQuota
#ServiceQuotaSpec: {
	v1.#ResourceSpec
	forProvider: #ServiceQuotaParameters @go(ForProvider)

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
	initProvider?: #ServiceQuotaInitParameters @go(InitProvider)
}

// ServiceQuotaStatus defines the observed state of ServiceQuota.
#ServiceQuotaStatus: {
	v1.#ResourceStatus
	atProvider?: #ServiceQuotaObservation @go(AtProvider)
}

// ServiceQuota is the Schema for the ServiceQuotas API. Manages an individual Service Quota
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ServiceQuota: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.quotaCode) || (has(self.initProvider) && has(self.initProvider.quotaCode))",message="spec.forProvider.quotaCode is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.serviceCode) || (has(self.initProvider) && has(self.initProvider.serviceCode))",message="spec.forProvider.serviceCode is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.value) || (has(self.initProvider) && has(self.initProvider.value))",message="spec.forProvider.value is a required parameter"
	spec:    #ServiceQuotaSpec   @go(Spec)
	status?: #ServiceQuotaStatus @go(Status)
}

// ServiceQuotaList contains a list of ServiceQuotas
#ServiceQuotaList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ServiceQuota] @go(Items,[]ServiceQuota)
}