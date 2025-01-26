Extension { #name : 'OCIRBytecodeGenerator' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRBytecodeGenerator >> sameThreadCallout: aTFExternalFunction [

	| literalIndex |
	literalIndex := self literalIndexOf: aTFExternalFunction.

	stack pop: aTFExternalFunction definition parameterTypes size.
	aTFExternalFunction definition returnType isVoid ifFalse: [ stack push ].

	^ encoder genSameThreadCallout: literalIndex
]
