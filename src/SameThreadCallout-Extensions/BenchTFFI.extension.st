Extension { #name : 'BenchTFFI' }

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFI >> runCallWithByteArray [ 

	^ [ self doCallWithByteArray: (ByteArray new: 17)  ] bench
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFI >> runCallWithExternalAddress [ 

	^ [ self doCallWithExternalAddress: ExternalAddress null  ] bench
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFI >> runCallWithPointerVoid [

	^ [ self doPointerVoid: (ExternalAddress null)  ] bench
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFI >> runCallWithPointerVoidWithByteArray [

	^ [ self doPointerVoid: (ByteArray new: 17)  ] bench
]
