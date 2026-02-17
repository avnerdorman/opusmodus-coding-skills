Opusmodus                                                                 integer-transpose-start   1

integer-transpose-start value sequence &key section exclude
[Function]

Arguments and Values:
value                    an integer or list of integers.
sequence                 a list or lists of integers.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

Use this function to apply a start transposition across integer sequence.

A simple example:

(integer-transpose-start 2 '(0 2 4))
=> (2 4 6)


Examples:

Transpose multiple lists with the same value:

(integer-transpose-start 2 '((0 2 4) (2 4 5) (4 5 7)))
=> ((2 4 6) (2 4 5) (2 3 5))

Transpose multiple lists with multiple values:

(integer-transpose-start '(7 -5 -12) '((0 2 4) (2 4 5) (4 5 7)))
=> ((7 9 11) (-5 -3 -2) (-12 -11 -9))

Transpose only selected sublists:

(integer-transpose-start
 '(7 -5) '((0 2 4) (2 4 5) (4 5 7)) :section '(0 2))
=> ((7 9 11) (2 4 5) (-5 -4 -2))
