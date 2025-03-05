Matrix subclass: #SparseMatrix
    instanceVariableNames: 'triplets'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SparseMatrixExample'.

SparseMatrix >> initializeWithTriplets: aTriplets rows: r cols: c [
    super initializeRows: r cols: c.
    triplets := aTriplets.
]

SparseMatrix >> atRow: i col: j [
    | found |
    found := triplets detect: [ :t | (t first = i) and: (t second = j) ] ifNone: [ nil ].
    ^ found isNil ifTrue: [ 0 ] ifFalse: [ found third ].
]

SparseMatrix >> asDense [
    | dense |
    dense := DenseMatrix new initializeRows: rows cols: cols.
    triplets do: [ :t |
        dense atRow: t first col: t second put: t third.
    ].
    ^ dense.
]

SparseMatrix class >> fromTriplets: aTriplets rows: r cols: c [
    ^ self new initializeWithTriplets: aTriplets rows: r cols: c.
]
