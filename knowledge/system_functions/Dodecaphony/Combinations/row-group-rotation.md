Opusmodus                                                                row-group-rotation       1

row-group-rotation model set &key type chord flatten
[Function]

Arguments and Values:
model                     integer lists.
set                       list of integers (twelve-tone row).
type                      :integer or :pitch. The default is :integer.
chord                     NIL or T. The default is NIL.
flatten                   NIL or T. The default is NIL.


Description:

This function employs rotation. This was an important and well-used device in Hauer's
composition practice, either rotation of the whole series, rotation of the hexagram 'halves, or
rotation of smaller segments. Rotation is controlled from the rst argument of the function
parameters when hexagrams are present. With other values rotation occurs but is not so
controllable.

(row-group-rotation '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((5 4 3 2 1 0) (11 10 9 8 7 6))

(row-group-rotation '(1 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((0) (2 1) (3) (5 4) (6) (8 7) (9) (11 10))


Examples:
(row-group-rotation
 '(2 2 2 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 0) (3 2) (5 4) (7 6) (9 8) (11 10))

(row-group-rotation
 '(3 3 3 3) '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (2 1 0 5 4 3 8 7 6 11 10 9)

(row-group-rotation
 '(4 2 4 2) '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch)
=> ((eb4 d4 db4 c4) (f4 e4) (a4 ab4 g4 gb4) (b4 bb4))

(row-group-rotation
 '(4 4 4) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((3 2 1 0) (7 6 5 4) (11 10 9 8))
                                                        fi
