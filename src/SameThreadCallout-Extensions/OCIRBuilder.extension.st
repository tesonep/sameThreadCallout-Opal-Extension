Extension { #name : 'OCIRBuilder' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRBuilder >> sameThreadCallout: aTFExternalFunction [ 

	^ self add: (OCIRInstruction sameThreadCallout: aTFExternalFunction) 

]
