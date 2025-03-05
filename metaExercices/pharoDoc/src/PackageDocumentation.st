Object subclass: #PackageDocumentation
    instanceVariableNames: 'packageName classDocs'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PharoDoc'.

PackageDocumentation >> initializeWithPackage: aPackageName [
    packageName := aPackageName.
    classDocs := (RPackage named: packageName) classes collect: [ :class |
        ClassDocumentation new initializeWithClass: class.
    ].
]

PackageDocumentation >> packageName [
    ^ packageName.
]

PackageDocumentation >> classes [
    ^ classDocs.
]
