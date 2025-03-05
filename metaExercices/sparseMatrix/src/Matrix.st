Object subclass: #Matrix
    instanceVariableNames: 'rows cols'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SparseMatrixExample'.

Matrix >> initializeRows: r cols: c [
    rows := r.
    cols := c.
]

Matrix >> rows [
    ^ rows.
]

Matrix >> cols [
    ^ cols.
]
