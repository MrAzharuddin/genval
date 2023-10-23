// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane/crossplane/apis/pkg/meta/v1alpha1

package v1alpha1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// FunctionSpec specifies the configuration of a Function.
#FunctionSpec: {
	#MetaSpec
}

// A Function is the description of a Crossplane Function package.
#Function: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #FunctionSpec      @go(Spec)
}