Opusmodus                                                            row-group-rotation6+6        1

row-group-rotation6+6 n set &key type chord flatten
[Function]

Arguments and Values:
n                         an integer.
set                       list of integers (twelve-tone row).
type                      :integer or :pitch. The default is :integer.
chord                     NIL or T. The default is NIL.
flatten                   NIL or T. The default is NIL.


Description:

This function employs rotation. This was an important and well-used device in Hauer's
composition practice, either rotation of the whole series, rotation of the hexagram 'halves, or
rotation of smaller segments. Rotation is controlled from the rst argument of the function
parameters when hexagrams are present. Here both hexagram groups rotate in tandem from
value n times.

(row-group-rotation6+6 2 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 2 3 4 5 0) (7 8 9 10 11 6))

(row-group-rotation6+6 8 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 2 3 4 5 0) (7 8 9 10 11 6))


Examples:
(row-group-rotation6+6
 8 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 2 3 4 5 0) (7 8 9 10 11 6))

(row-group-rotation6+6
 4 '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch)
=> ((eb4 e4 f4 c4 db4 d4) (a4 bb4 b4 gb4 g4 ab4))

(row-group-rotation6+6
 2 '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (1 2 3 4 5 0 7 8 9 10 11 6)
                                                        fi
