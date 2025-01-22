Extension { #name : 'OCIRInstruction' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRInstruction class >> sameThreadCallout: aTFExternalFunction [ 
	
	^ OCIRSameThreadCallout new
		functionDefinition: aTFExternalFunction;
		yourself
]
