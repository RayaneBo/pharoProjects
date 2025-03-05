TestCase subclass: #SparseMatrixTest
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SparseMatrixExample-Tests'.

SparseMatrixTest >> testConversion [
    | dense sparse backToDense |
    dense := DenseMatrix new initializeRows: 3 cols: 3.
    dense atRow: 1 col: 1 put: 5.
    dense atRow: 2 col: 2 put: 8.
    dense atRow: 3 col: 3 put: 3.
    
    sparse := dense asSparse.
    
    self assert: (sparse atRow: 1 col: 1) = 5.
    self assert: (sparse atRow: 2 col: 2) = 8.
    self assert: (sparse atRow: 3 col: 3) = 3.
    self assert: (sparse atRow: 1 col: 2) = 0.
    
    backToDense := sparse asDense.
    
    self assert: (backToDense atRow: 1 col: 1) = 5.
    self assert: (backToDense atRow: 2 col: 2) = 8.
    self assert: (backToDense atRow: 3 col: 3) = 3.
]
