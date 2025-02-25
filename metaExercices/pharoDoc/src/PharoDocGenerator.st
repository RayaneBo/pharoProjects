Object subclass: #PharoDocGenerator
    instanceVariableNames: 'packageName'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc'.

PharoDocGenerator >> initializeWithPackage: aPackageName [
    packageName := aPackageName.
]

PharoDocGenerator >> generateDoc [
    | classes doc |
    classes := (RPackage named: packageName) classes.
    doc := String new.
    
    classes do: [ :class |
        | superClass subClasses instanceVars methods |
        
        superClass := class superclass.
        subClasses := class subclasses.
        instanceVars := class allInstVarNames.
        methods := class methodDict keys.
        
        doc := doc , ('# ', class name , String cr).
        doc := doc , ('Super-classe: ', superClass name , String cr).
        doc := doc , ('Sous-classes: ', (subClasses collect: #name) joinSeparatedBy: ', ', String cr).
        doc := doc , ('Variables d''instance: ', instanceVars joinSeparatedBy: ', ', String cr).
        
        methods do: [ :method |
            | senders |
            senders := (class sendersOf: method).
            doc := doc , ('- ', method , ' (appelé par: ', (senders collect: [ :m | m methodClass name , '>>' , m selector ]) joinSeparatedBy: ', ', ')' , String cr).
        ].
        
        doc := doc , String cr.
    ].
    
    ^ doc
]

PharoDocGenerator class >> generateForPackage: aPackageName [
    ^ self new initializeWithPackage: aPackageName; generateDoc
]
