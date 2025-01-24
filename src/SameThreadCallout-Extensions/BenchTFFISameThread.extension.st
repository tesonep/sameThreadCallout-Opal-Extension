Extension { #name : 'BenchTFFISameThread' }

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> doCallWithByteArray: aByteArray [

	self ffiCall: #(uint64 id_int(void* aByteArray))
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> doCallWithExternalAddress: anExternalAddress [

	self ffiCall: #(uint64 id_int(void* anExternalAddress))
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> doPointerVoid: aPointer [

	self ffiCall: #(void id_int(void* aPointer))
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> runCallWithByteArray [
	<script: 'self new runCallWithByteArray traceCr'>

	^ super runCallWithByteArray
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> runCallWithExternalAddress [
	<script: 'self new runCallWithExternalAddress traceCr'>

	^ super runCallWithExternalAddress
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> runCallWithPointerVoid [
	<script: 'self new runCallWithPointerVoid traceCr'>

	^ super runCallWithPointerVoid
]

{ #category : '*SameThreadCallout-Extensions' }
BenchTFFISameThread >> runCallWithPointerVoidWithByteArray [
	<script: 'self new runCallWithPointerVoidWithByteArray traceCr'>

	^ super runCallWithPointerVoidWithByteArray

]
