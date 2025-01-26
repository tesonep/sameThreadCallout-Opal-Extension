Extension { #name : 'TFCalloutMethodBuilder' }

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder >> canUseBytecode: aRunner [ 

	^ aRunner = TFSameThreadRunner uniqueInstance and: useBytecode.

]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder >> generateFFICallout: builder spec: functionSpec ffiLibrary: ffiLibrary [

	(self canUseBytecode: ffiLibrary uniqueInstance runner)
		ifTrue: [ ^ self generateFFICalloutUsingBytecode: builder spec: functionSpec ffiLibrary: ffiLibrary].

	TFCalloutAPI isTracing ifTrue: [
		TFCalloutAPI trace: sender.
		builder
			pushLiteral: TFCalloutAPI;
			pushLiteral: sender;
			send: #trace: ].

	builder
		pushLiteral: (ffiLibrary uniqueInstance runner).

	"save ffi call as literal"
	builder pushLiteral: (self createFFICalloutLiteralFromSpec: functionSpec).
	"iterate arguments in order (in the function) to create the function call"

	functionSpec arguments
		do: [ :each | self emitArgument: each optimizingIn:builder ].

	"create the array"
	builder pushConsArray: functionSpec arguments size.
	builder addTemp: #argumentsArray.
	builder storeTemp: #argumentsArray.

	"send call and store into result"
	builder send: #invokeFunction:withArguments:.

	functionSpec arguments withIndexDo: [ :each :index|
		each emitReturnArgument: builder context: sender.
		each resolvedType tfExternalTypeWithArity
			emitFreeIfNeededOfIndex: index
			argumentsArrayTempName: #argumentsArray
			withBuilder: builder  ].

	"Additional marshall in the case of TFFI"
	functionSpec returnType resolvedType tfExternalTypeWithArity emitMarshallFromPrimitive: builder.

	"convert in case return type needs it. And return reseult"

	^ functionSpec returnType
		emitReturn: builder
		resultTempVar: #result
		context: sender
		inCallout: self requestor
]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder >> generateFFICalloutUsingBytecode: builder spec: functionSpec ffiLibrary: ffiLibrary [ 


	| functionDefinition |
	TFCalloutAPI isTracing ifTrue: [
		TFCalloutAPI trace: sender.
		builder
			pushLiteral: TFCalloutAPI;
			pushLiteral: sender;
			send: #trace: ].

	functionDefinition := self createFFICalloutLiteralFromSpec: functionSpec.
	functionDefinition validate.

	"iterate arguments in order (in the function) to create the function call"
	functionSpec arguments
		do: [ :each | self emitArgument: each optimizingIn:builder ].

	builder sameThreadCallout: functionDefinition.

	functionSpec arguments withIndexDo: [ :each :index|
		each emitReturnArgument: builder context: sender.
		each resolvedType tfExternalTypeWithArity
			emitFreeIfNeededOfIndex: index
			argumentsArrayTempName: #argumentsArray
			withBuilder: builder  ].

	"Additional marshall in the case of TFFI"
	functionSpec returnType resolvedType tfExternalTypeWithArity emitMarshallFromPrimitive: builder.

	"convert in case return type needs it. And return reseult"

	functionSpec returnType resolvedType isVoid ifTrue: [ 
		^ builder 
			pushReceiver;
			returnTop ].

	^ functionSpec returnType
		emitReturn: builder
		resultTempVar: #result
		context: sender
		inCallout: self requestor
]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder >> initialize [ 
	
	super initialize.
	useBytecode := self class useBytecode
]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder class >> useBytecode [

	^ UseBytecode ifNil: [ UseBytecode := false ]
]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder class >> useBytecode: aValue [

	UseBytecode := aValue
]

{ #category : '*SameThreadCallout-Extensions' }
TFCalloutMethodBuilder >> useBytecode: aValue [

	useBytecode := aValue
]
