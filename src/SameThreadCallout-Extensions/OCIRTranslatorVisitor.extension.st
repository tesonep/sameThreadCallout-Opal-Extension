Extension { #name : 'OCIRTranslatorVisitor' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRTranslatorVisitor >> visitSameThreadCallout: anOCIRSameThreadCallout [ 

	^ gen sameThreadCallout: anOCIRSameThreadCallout functionDefinition 
]
