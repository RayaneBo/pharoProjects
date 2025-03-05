Matrix subclass: #DenseMatrix
    instanceVariableNames: 'values'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SparseMatrixExample'.

DenseMatrix >> initializeRows: r cols: c [
    super initializeRows: r cols: c.
    values := Array new: r withAll: [ Array new: c withAll: 0 ].
]

DenseMatrix >> atRow: i col: j [
    ^ (values at: i) at: j.
]

DenseMatrix >> atRow: i col: j put: value [
    (values at: i) at: j put: value.
]

DenseMatrix >> asSparse [
    | triplets |
    triplets := OrderedCollection new.
    1 to: rows do: [ :i |
        1 to: cols do: [ :j |
            | value |
            value := self atRow: i col: j.
            value ~= 0 ifTrue: [ triplets add: { i. j. value } ].
        ].
    ].
    ^ SparseMatrix fromTriplets: triplets rows: rows cols: cols.
]
