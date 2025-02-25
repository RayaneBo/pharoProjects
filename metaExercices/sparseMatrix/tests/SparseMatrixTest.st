| dense sparse converted |
dense := #(
    (0 0 3 0)
    (4 0 0 7)
    (0 5 0 0)
).

"Conversion en matrice creuse"
sparse := SparseMatrix fromDense: dense.
Transcript show: sparse; cr.

"Reconversion en matrice dense"
converted := sparse asDense.
Transcript show: converted; cr.

"Vérification"
(dense = converted) ifTrue: [ Transcript show: 'Test réussi!' ].
