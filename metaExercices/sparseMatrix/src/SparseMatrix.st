Object subclass: #SparseMatrix
    instanceVariableNames: 'triplets rows cols'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SparseMatrixExample'.

SparseMatrix >> initializeWithTriplets: aTriplets rows: r cols: c [
    triplets := aTriplets.
    rows := r.
    cols := c.
    ^ self.
]

SparseMatrix class >> fromDense: aMatrix [
    | sparseTriplets |
    sparseTriplets := OrderedCollection new.
    
    aMatrix withIndexDo: [ :row :i |
        row withIndexDo: [ :value :j |  
            value ~= 0 ifTrue: [ sparseTriplets add: { i. j. value } ].
        ].
    ].
    
    ^ self new initializeWithTriplets: sparseTriplets rows: aMatrix size cols: aMatrix first size.
]

SparseMatrix class >> toDense: triplets rows: n cols: m [
    | denseMatrix |
    denseMatrix := Array new: n withAll: [ Array new: m withAll: 0 ].
    
    triplets do: [ :t |
        (denseMatrix at: t first) at: t second put: t third.
    ].
    
    ^ denseMatrix.
]

SparseMatrix >> asDense [
    ^ SparseMatrix toDense: triplets rows: rows cols: cols.
]