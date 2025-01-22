Extension { #name : 'OCIRBytecodeGenerator' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRBytecodeGenerator >> sameThreadCallout: aTFExternalFunction [ 
	
	| literalIndex |

	literalIndex := self literalIndexOf: aTFExternalFunction.
	^ encoder genSameThreadCallout: literalIndex.
]
