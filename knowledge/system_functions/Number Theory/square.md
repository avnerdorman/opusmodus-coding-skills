Opusmodus                                                                        square     1

square n
[Function]

Arguments and Values:
n                        an integer.


Description:

The function SQUARE will calculate the square of a given integer. In mathematics, a
SQUARE of a number means the result of multiplying the number by itself. For example, the
SQUARE of 6 is 6×6=36. Squaring a number can also be written as 62=36.

(square 6)
=> 36

(square 4355)
=> 18966025



Examples:
(setf squared-spiral
      (mapcar 'square (flatten (array-to-list (spiral-array 4 2)))))
=> (0 1 49 4 36 9 25 16)

(setf chords
      (mapcar 'compress (integer-to-pitch
                         (mapcar 'explode squared-spiral))))
=> (c4 cs4 e4a4 e4 eb4fs4 a4 d4f4 cs4fs4)

Note the use of a number of LISP primitives in these two expressions above. The rst,
MAPCAR 'maps' the function SQUARE on each integer in the array-list.

(setf array-list (flatten (array-to-list (spiral-array 4 2))))
=> (0 1 7 2 6 3 5 4)

(mapcar 'square array-list)
=> (0 1 49 4 36 9 25 16)
                                                                         fi
Opusmodus                                                                   square   2

(setf chord-lis (mapcar 'explode '(0 1 49 4 36 9 25 16)))
=> ((0) (1) (4 9) (4) (3 6) (9) (2 5) (1 6))

(mapcar 'compress (integer-to-pitch chord-lis))
=> (c4 cs4 e4a4 e4 eb4fs4 a4 d4f4 cs4fs4)

In the second EXPLODE and COMPRESS are used to dissemble and the assemble the
contents of a list.
