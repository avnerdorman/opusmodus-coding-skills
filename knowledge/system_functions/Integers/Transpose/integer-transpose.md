Opusmodus                                                                         integer-transpose   1

integer-transpose value sequence &key section exclude
[Function]

Arguments and Values:
value                    an integer or list of integers.
sequence                 a list or lists of integers.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The function INTEGER-TRANSPOSE transposes a sequence of integers to a given
value.

A simple example:

(integer-transpose 2 '(0 2 4))
=> (2 4 6


Examples:

Transpose multiple lists with the same value:

(integer-transpose 2 '((0 2 4) (2 4 5) (4 5 7)))
=> ((2 4 6) (4 6 7) (6 7 9))

Transpose multiple lists with multiple values:

(integer-transpose '(7 -5 -12) '((0 2 4) (2 4 5) (4 5 7)))
=> ((7 9 11) (-3 -1 0) (-8 -7 -5))

Transpose only selected sublists:

(integer-transpose '(7 -5) '((0 2 4) (2 4 5) (4 5 7)) :section '(0 2))
=> ((7 9 11) (2 4 5) (-1 0 2))
