Opusmodus                                                                   matrix-transpose       1

matrix-transpose A
[Function]

Arguments and Values:
A                         lists, vector or array.


Description:

The function MATRIX-TRANSPOSE performs a simple matrix transpose operation on a list
of lists, vector and array. In linear algebra, the transpose of a matrix A is another matrix At.
The transpose At of a matrix A can be obtained by re ecting the elements along its main
diagonal. Repeating the process on the transposed matrix, returns the elements to their
original position.

A
(matrix-transpose '((1 2)
                    (3 4)
                    (5 6)))
At
=> ((1 3 5)
    (2 4 6))

At
(matrix-transpose '((1 3 5)
                    (2 4 6)))

A
=> ((1 2)
    (3 4)
    (5 6))


Example:
(matrix-transpose '((1 3 5) (2 4 6)))
=> ((1 2) (3 4) (5 6))

(matrix-transpose #((1 3 5) (2 4 6)))
=> #((1 2) (3 4) (5 6))

(matrix-transpose #2a((1 3 5) (2 4 6)))
=> #2A((1 2) (3 4) (5 6))
                                                    fl
Opusmodus                                matrix-transpose   2

(setf bin-A
      '((0 0 1 0 0 0 1 0 0 0 0 1 0)
        (0 0 0 0 0 0 0 0 0 0 1 0 0)
        (0 1 0 0 0 0 0 0 0 0 0 0 1)
        (1 0 0 0 1 0 0 0 0 1 0 0 0)
        (0 0 0 0 0 0 0 0 1 0 1 0 0)
        (0 0 0 0 0 0 0 0 0 0 1 0 0)
        (0 0 1 0 0 0 0 1 0 0 0 0 0)))

(setf bin-At (matrix-transpose bin-A))
=> ((0 0 0 1 0 0 0)
    (0 0 1 0 0 0 0)
    (1 0 0 0 0 0 1)
    (0 0 0 0 0 0 0)
    (0 0 0 1 0 0 0)
    (0 0 0 0 0 0 0)
    (1 0 0 0 0 0 0)
    (0 0 0 0 0 0 1)
    (0 0 0 0 1 0 0)
    (0 0 0 1 0 0 0)
    (0 1 0 0 1 1 0)
    (1 0 0 0 0 0 0)
    (0 0 1 0 0 0 0))

(matrix-transpose bin-At)
=> ((0 0 1 0 0 0 1 0 0 0 0 1 0)
    (0 0 0 0 0 0 0 0 0 0 1 0 0)
    (0 1 0 0 0 0 0 0 0 0 0 0 1)
    (1 0 0 0 1 0 0 0 0 1 0 0 0)
    (0 0 0 0 0 0 0 0 1 0 1 0 0)
    (0 0 0 0 0 0 0 0 0 0 1 0 0)
    (0 0 1 0 0 0 0 1 0 0 0 0 0))
