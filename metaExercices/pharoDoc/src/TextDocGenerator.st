DocGenerator subclass: #TextDocGenerator
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc'.

TextDocGenerator >> generateForPackage: packageDoc [
    | doc |
    doc := String new.
    
    doc := doc , ('Package: ', packageDoc packageName, String cr, String cr).
    
    packageDoc classes do: [ :classDoc |
        doc := doc , ('# ', classDoc className , String cr).
        doc := doc , ('Super-classe: ', classDoc superClassName , String cr).
        doc := doc , ('Sous-classes: ', classDoc subClassNames joinSeparatedBy: ', ', String cr).
        doc := doc , ('Variables d''instance: ', classDoc instanceVariableNames joinSeparatedBy: ', ', String cr).
        
        classDoc methodNames do: [ :method |
            | senders |
            senders := classDoc sendersOf: method.
            doc := doc , ('- ', method , ' (appelé par: ', senders joinSeparatedBy: ', ', ')' , String cr).
        ].
        
        doc := doc , String cr.
    ].
    
    ^ doc.
]
