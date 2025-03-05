Object subclass: #DocGenerator
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc'.

DocGenerator >> generateForPackage: packageDoc [
    self subclassResponsibility.
]
