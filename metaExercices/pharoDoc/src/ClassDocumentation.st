Object subclass: #ClassDocumentation
    instanceVariableNames: 'class superClass subClasses instanceVars methods'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc'.

ClassDocumentation >> initializeWithClass: aClass [
    class := aClass.
    superClass := aClass superclass.
    subClasses := aClass subclasses.
    instanceVars := aClass allInstVarNames.
    methods := aClass methodDict keys.
]

ClassDocumentation >> className [
    ^ class name.
]

ClassDocumentation >> superClassName [
    ^ superClass isNil ifTrue: ['None'] ifFalse: [superClass name].
]

ClassDocumentation >> subClassNames [
    ^ subClasses collect: #name.
]

ClassDocumentation >> instanceVariableNames [
    ^ instanceVars.
]

ClassDocumentation >> methodNames [
    ^ methods.
]

ClassDocumentation >> sendersOf: method [
    ^ (class sendersOf: method) collect: [ :m | m methodClass name , '>>' , m selector ].
]
