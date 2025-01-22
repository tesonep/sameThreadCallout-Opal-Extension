Class {
	#name : 'BenchTFFISameThreadUsingBytecode',
	#superclass : 'BenchTFFI',
	#category : 'SameThreadCallout-Extensions-Benchs',
	#package : 'SameThreadCallout-Extensions',
	#tag : 'Benchs'
}

{ #category : 'private' }
BenchTFFISameThreadUsingBytecode >> doCallWith: aFloat another: aDouble [

	| definition function |

	<opalBytecodeMethod>
	
	definition := TFFunctionDefinition
		        parameterTypes: {
				        TFBasicType float.
				        TFBasicType double }
		        returnType: TFBasicType float.

	function := TFExternalFunction
		        name: #sumAFloatAndADouble  
				  moduleName: TFTestLibraryUsingSameThreadRunner uniqueInstance libraryName
		        definition: definition.
		
	^ OCIRBuilder buildIR: [ :builder |
		  builder
			  numArgs: 2;
			  addTemps: #( #aFloat #aDouble );
			  pushTemp: #aFloat;
			  send: #asFloat;
			  pushTemp: #aDouble;
			  send: #asFloat;
			  sameThreadCallout: function;
			  returnTop ]
]

{ #category : 'private' }
BenchTFFISameThreadUsingBytecode >> doCallWithByteArray: aByteArray [

	| definition function |

	<opalBytecodeMethod>
	
	definition := TFFunctionDefinition
		        parameterTypes: {
				        TFBasicType pointer }
		        returnType: TFBasicType uint64.

	function := TFExternalFunction
		        name: #id_int  
				  moduleName: TFTestLibraryUsingSameThreadRunner uniqueInstance libraryName
		        definition: definition.
		
	^ OCIRBuilder buildIR: [ :builder |
		  builder
			  numArgs: 1;
			  addTemps: #( #aByteArray );
			  pushTemp: #aByteArray;
			  sameThreadCallout: function;
			  returnTop ]
]

{ #category : 'running' }
BenchTFFISameThreadUsingBytecode >> runCall [
	<script: 'self new runCall traceCr'>

	(self class >> #doCallWith:another: literalAt: 2) validate.
	^ super runCall
]
