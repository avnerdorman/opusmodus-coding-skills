Opusmodus                                                  row-group-rotation-combination         1

row-group-rotation-combination number model1 model2 set
                                                      &key type chord flatten

[Function]

Arguments and Values:
number                    an integer.
model1                    integer lists.
model2                    integer lists.
set                       list of integers (twelve-tone row).
type                      :integer or :pitch. The default is :integer.
chord                     NIL or T. The default is NIL.
flatten                   NIL or T. The default is NIL.


Description:

This function employs rotation. This was an important and well-used device in Hauer's
composition practice, either rotation of the whole series, rotation of the hexagram 'halves, or
rotation of smaller segments.

(row-group-combination
 4 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((5 4 3 2 1 0) (11 10 9 8 7 6))

(row-group-modification
 4 '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((3 4 5 0 1 2) (9 10 11 6 7 8))

(row-group-rotation-combination
 4 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((3 4 5 0 1 2) (9 10 11 6 7 8))

Notice that the output of the last two examples is identical, but the rst argument in the
function is an integer controlling rotation.

(row-group-rotation-combination
 5 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((4 5 0 1 2 3) (10 11 6 7 8 9))
                                                              fi
Opusmodus                                    row-group-rotation-combination   2

Examples:
(row-group-rotation-combination
 2 '(9 2 1) '(6 5 1) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 2 3 4 5 6 7 8 0) (10 9) (11))

(row-group-rotation-combination
 2 '(9 2 1) '(6 5 1) '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (1 2 3 4 5 6 7 8 0 10 9 11)

(row-group-rotation-combination
 2 '(6 2 2 2) '(2 6 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch)
=> ((db4 d4 eb4 e4 f4 c4) (g4 gb4) (a4 ab4) (b4 bb4))
