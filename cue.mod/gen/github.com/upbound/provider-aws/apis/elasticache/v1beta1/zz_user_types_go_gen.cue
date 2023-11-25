// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/elasticache/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AuthenticationModeInitParameters: {
	// Specifies the authentication type. Possible options are: password, no-password-required or iam.
	type?: null | string @go(Type,*string)
}

#AuthenticationModeObservation: {
	passwordCount?: null | float64 @go(PasswordCount,*float64)

	// Specifies the authentication type. Possible options are: password, no-password-required or iam.
	type?: null | string @go(Type,*string)
}

#AuthenticationModeParameters: {
	// Specifies the passwords to use for authentication if type is set to password.
	// +kubebuilder:validation:Optional
	passwordsSecretRef?: null | [...v1.#SecretKeySelector] @go(PasswordsSecretRef,*[]v1.SecretKeySelector)

	// Specifies the authentication type. Possible options are: password, no-password-required or iam.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#UserInitParameters: {
	// Access permissions string used for this user. See Specifying Permissions Using an Access String for more details.
	accessString?: null | string @go(AccessString,*string)

	// Denotes the user's authentication properties. Detailed below.
	authenticationMode?: [...#AuthenticationModeInitParameters] @go(AuthenticationMode,[]AuthenticationModeInitParameters)

	// The current supported value is REDIS.
	engine?: null | string @go(Engine,*string)

	// Indicates a password is not required for this user.
	noPasswordRequired?: null | bool @go(NoPasswordRequired,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The username of the user.
	userName?: null | string @go(UserName,*string)
}

#UserObservation: {
	// Access permissions string used for this user. See Specifying Permissions Using an Access String for more details.
	accessString?: null | string @go(AccessString,*string)

	// The ARN of the created ElastiCache User.
	arn?: null | string @go(Arn,*string)

	// Denotes the user's authentication properties. Detailed below.
	authenticationMode?: [...#AuthenticationModeObservation] @go(AuthenticationMode,[]AuthenticationModeObservation)

	// The current supported value is REDIS.
	engine?: null | string @go(Engine,*string)
	id?:     null | string @go(ID,*string)

	// Indicates a password is not required for this user.
	noPasswordRequired?: null | bool @go(NoPasswordRequired,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The username of the user.
	userName?: null | string @go(UserName,*string)
}

#UserParameters: {
	// Access permissions string used for this user. See Specifying Permissions Using an Access String for more details.
	// +kubebuilder:validation:Optional
	accessString?: null | string @go(AccessString,*string)

	// Denotes the user's authentication properties. Detailed below.
	// +kubebuilder:validation:Optional
	authenticationMode?: [...#AuthenticationModeParameters] @go(AuthenticationMode,[]AuthenticationModeParameters)

	// The current supported value is REDIS.
	// +kubebuilder:validation:Optional
	engine?: null | string @go(Engine,*string)

	// Indicates a password is not required for this user.
	// +kubebuilder:validation:Optional
	noPasswordRequired?: null | bool @go(NoPasswordRequired,*bool)

	// Passwords used for this user. You can create up to two passwords for each user.
	// +kubebuilder:validation:Optional
	passwordsSecretRef?: null | [...v1.#SecretKeySelector] @go(PasswordsSecretRef,*[]v1.SecretKeySelector)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The username of the user.
	// +kubebuilder:validation:Optional
	userName?: null | string @go(UserName,*string)
}

// UserSpec defines the desired state of User
#UserSpec: {
	v1.#ResourceSpec
	forProvider: #UserParameters @go(ForProvider)

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
	initProvider?: #UserInitParameters @go(InitProvider)
}

// UserStatus defines the observed state of User.
#UserStatus: {
	v1.#ResourceStatus
	atProvider?: #UserObservation @go(AtProvider)
}

// User is the Schema for the Users API. Provides an ElastiCache user.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#User: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.accessString) || (has(self.initProvider) && has(self.initProvider.accessString))",message="spec.forProvider.accessString is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.engine) || (has(self.initProvider) && has(self.initProvider.engine))",message="spec.forProvider.engine is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.userName) || (has(self.initProvider) && has(self.initProvider.userName))",message="spec.forProvider.userName is a required parameter"
	spec:    #UserSpec   @go(Spec)
	status?: #UserStatus @go(Status)
}

// UserList contains a list of Users
#UserList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#User] @go(Items,[]User)
}
