Extension { #name : 'OCIRPrinterVisitor' }

{ #category : '*SameThreadCallout-Extensions' }
OCIRPrinterVisitor >> visitSameThreadCallout: anOCIRSameThreadCallout [ 

	stream nextPutAll: 'sameThreadCallout: '.
	anOCIRSameThreadCallout functionDefinition printOn: stream
]
