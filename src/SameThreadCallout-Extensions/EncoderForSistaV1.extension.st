Extension { #name : 'EncoderForSistaV1' }

{ #category : '*SameThreadCallout-Extensions' }
EncoderForSistaV1 >> genSameThreadCallout: aLiteralIndex [ 
	
	stream
		nextPut: 230;
		nextPut: aLiteralIndex
]
