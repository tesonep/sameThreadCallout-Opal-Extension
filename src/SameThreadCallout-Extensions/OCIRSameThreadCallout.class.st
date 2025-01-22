Class {
	#name : 'OCIRSameThreadCallout',
	#superclass : 'OCIRInstruction',
	#instVars : [
		'functionDefinition'
	],
	#category : 'SameThreadCallout-Extensions-IR-Nodes',
	#package : 'SameThreadCallout-Extensions',
	#tag : 'IR-Nodes'
}

{ #category : 'visiting' }
OCIRSameThreadCallout >> accept: aVisitor [

	^ aVisitor visitSameThreadCallout: self
]

{ #category : 'as yet unclassified' }
OCIRSameThreadCallout >> functionDefinition [

	^ functionDefinition

]

{ #category : 'as yet unclassified' }
OCIRSameThreadCallout >> functionDefinition: aTFExternalFunction [ 

	functionDefinition := aTFExternalFunction 

]
