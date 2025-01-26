Extension { #name : 'FFIFunctionParserTest' }

{ #category : '*SameThreadCallout-Extensions' }
FFIFunctionParserTest >> testParseFunction3 [

	| functionSpec1 builder method1 |
	functionSpec1 := self newParser parseNamedFunction:
		                 #( int SDL_LockTexture ( self , void* 0 , void** _b , int * d_ ) ).

	functionSpec1 resolveUsing: resolver.


	builder := (FFIBackend current calloutAPIClass inContext: nil)
		           newBuilder
						useBytecode: true;
		           sender: ctx;
		           yourself.
	"signature: functionSignature;
			sender: sender."
	method1 := builder generateMethodFromSpec: functionSpec1.

]

{ #category : '*SameThreadCallout-Extensions' }
FFIFunctionParserTest >> testParseFunction4 [

	| functionSpec1 builder method1 |
	functionSpec1 := self newParser parseNamedFunction:
		                 #( int git_libgit2_init() ).

	functionSpec1 resolveUsing: resolver.


	builder := (FFIBackend current calloutAPIClass inContext: nil)
		           newBuilder
						useBytecode: true;
		           sender: ctx;
		           yourself.
	"signature: functionSignature;
			sender: sender."
	method1 := builder generateMethodFromSpec: functionSpec1.

]

{ #category : '*SameThreadCallout-Extensions' }
FFIFunctionParserTest >> testParseFunction5 [

	| functionSpec1 builder method1 |
	functionSpec1 := self newParser parseNamedFunction:
		                 #( void objc_registerClassPair(void* _b) ).

	functionSpec1 resolveUsing: resolver.


	builder := (FFIBackend current calloutAPIClass inContext: nil)
		           newBuilder
						useBytecode: true;
		           sender: ctx;
		           yourself.
	"signature: functionSignature;
			sender: sender."
	method1 := builder generateMethodFromSpec: functionSpec1.

]
