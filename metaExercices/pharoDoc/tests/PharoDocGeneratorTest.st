TestCase subclass: #PharoDocGeneratorTest
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc-Tests'.

PharoDocGeneratorTest >> testClassDocumentation [
    | doc classDoc |
    
    classDoc := ClassDocumentation new initializeWithClass: OrderedCollection.
    
    self assert: classDoc className = 'OrderedCollection'.
    self assert: (classDoc subClassNames includes: 'SortedCollection').
    self assert: (classDoc instanceVariableNames includes: 'array').
    self assert: (classDoc methodNames includes: 'add:').
]

PharoDocGeneratorTest >> testPackageDocumentation [
    | packageDoc |
    
    packageDoc := PackageDocumentation new initializeWithPackage: 'Collections-Abstract'.
    
    self assert: packageDoc packageName = 'Collections-Abstract'.
    self assert: packageDoc classes size > 0.
]

PharoDocGeneratorTest >> testTextGeneration [
    | packageDoc generator doc |
    
    packageDoc := PackageDocumentation new initializeWithPackage: 'Collections-Abstract'.
    generator := TextDocGenerator new.
    doc := generator generateForPackage: packageDoc.
    
    self assert: (doc includesSubstring: 'Package: Collections-Abstract').
]
