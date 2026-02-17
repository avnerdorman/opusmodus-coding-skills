Opusmodus                                                                     interval-row-matrix   1

interval-row-matrix intervals &key remove assoc mod array seed
[Function]

Arguments and Values:
intervals                row of intervals.
remove                   an integer (interval) or :octaves. The default is NIL.
array                    NIL or T (output array). The default is NIL.
mod                      row size. The default is 12.
assoc                    row size. The default is 12.
seed                     NIL or an integer. The default is NIL.


Description:

This function has an expansion facility which enables in the rst instance variants to be
produced based on inversion of a row.

(interval-row-matrix '(0 1 2 3 4 5 6))
=> (( 0    1    2   3   4   5 6)
    (-11   0    1   2   3   4 5)
    (-10 -11    0   1   2   3 4)
    ( -9 -10 -11    0   1   2 3)
    ( -8 -9 -10 -11     0   1 2)
    ( -7 -8    -9 -10 -11   0 1)
    ( -6 -7    -8 -9 -10 -11 0))

In the example the PCS row is expanded by the number of its intervals.

(interval-row-matrix (pcs '6-Z10))
=> ((0 1 3 4 5 7)
    (-11 0 2 3 4 6)
    (-9 -10 0 1 2 4)
      (-8 -9 -11 0 1 3)
    (-7 -8 -10 -11 0 2)
    (-5 -6 -8 -9 -10 0))

As the examples demonstrate further editing can take place. Below the rst example shows
how to :remove all intervals marked 2 from the rows.

(interval-row-matrix (pcs '6-Z10) :remove 2)
=> ((0 1 3 4 5 7)
    (-11 0 3 4 6)
    (-9 -10 0 1 4)
    (-8 -9 -11 0 1 3)
    (-7 -8 -10 -11 0)
    (-5 -6 -8 -9 -10 0))
                                                           fi
                                                                        fi
Opusmodus                                                interval-row-matrix   2

Examples:
(interval-row-matrix '(0 1 -3 8 -11 9 -5 4 10 -7 2 6))
=> ((0 1 -3 8 -11 9 -5 4 10 -7 2 6)
    (-11 0 -2 7 -10 8 -4 3 9 -6 1 5)
      (9 10 0 -5 8 -6 2 -1 -7 4 11 -3)
      (-4 -5 7 0 -3 1 9 -8 2 11 -6 -10)
      (1 2 -4 9 0 10 -6 5 11 -8 3 7)
      (-3 -4 6 -11 -2 0 8 -7 1 10 -5 -9)
      (7 8 -10 -3 6 -4 0 11 -5 2 9 -1)
      (-8 -9 11 4 -7 5 -1 0 6 -3 -10 2)
      (-2 -3 5 -10 -1 -11 7 -6 0 9 -4 -8)
      (5 6 -8 -1 4 -2 -10 9 -3 0 7 11)
      (-10 -11 -1 6 -9 7 -3 2 8 -5 0 4)
      (-6 -7 9 2 -5 3 11 -10 4 -1 -8 0))

(interval-row-matrix
 '(0 1 -3 8 -11 9 -5 4 10 -7 2 6) :remove :octaves)
=> ((1 -3 8 -11 9 -5 4 10 -7 2 6)
    (-11 -2 7 -10 8 -4 3 9 -6 1 5)
    (9 10 -5 8 -6 2 -1 -7 4 11 -3)
    (-4 -5 7 -3 1 9 -8 2 11 -6 -10)
    (1 2 -4 9 10 -6 5 11 -8 3 7)
    (-3 -4 6 -11 -2 8 -7 1 10 -5 -9)
    (7 8 -10 -3 6 -4 11 -5 2 9 -1)
    (-8 -9 11 4 -7 5 -1 6 -3 -10 2)
    (-2 -3 5 -10 -1 -11 7 -6 9 -4 -8)
    (5 6 -8 -1 4 -2 -10 9 -3 7 11)
    (-10 -11 -1 6 -9 7 -3 2 8 -5 4)
    (-6 -7 9 2 -5 3 11 -10 4 -1 -8))

(interval-row-matrix
 '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 12 -13) :array t :mod 14 :seed 45)
=> #2A((9 5 -4 10 -7 2 -6 0 1 -3 8 -11 12 -13)
       (13 9 -8 0 -11 6 -10 4 5 -7 12 1 -2 3)
       (0 -10 9 1 12 -7 11 -5 -6 8 -13 -2 3 -4)
       (8 4 -3 9 -6 1 -5 -13 0 -2 7 -10 11 -12)
       (-11 -7 6 -12 9 -4 8 -2 -3 5 -10 13 0 -1)
       (-2 12 -11 -3 0 9 -13 7 8 -10 -1 4 -5 6)
       (-12 -8 7 -13 10 -5 9 -3 -4 6 -11 0 1 -2)
       (-6 -2 1 -7 4 13 3 11 12 0 -5 8 -9 10)
       (-5 -1 0 -6 3 12 2 10 11 -13 -4 7 -8 9)
       (1 -11 10 2 13 -8 12 -6 -7 9 0 -3 4 -5)
       (10 6 -5 11 -8 3 -7 1 2 -4 9 -12 13 0)
       (5 1 0 6 -3 -12 -2 -10 -11 13 4 -7 8 -9)
       (-6 -2 1 -7 4 13 3 11 12 0 -5 8 -9 10)
       (3 -13 12 4 -1 -10 0 -8 -9 11 2 -5 6 -7))
Opusmodus                                            interval-row-matrix   3

(setf intervals
      (interval-row-matrix
       '(0 1 2 -3 -5 8 13 9 -10 -7 -12 4 -11 -6)
       :remove 0 :assoc 12 :mod 14))
=> ((1 2 -3 -5 8 13 9 -10 -7 -12 4 -11 -6)
    (-11 -12 -13 -2 5 10 6 -7 -4 -9 1 -8 -3)
    (1 2 -3 -5 8 13 9 -10 -7 -12 4 -11 -6)
    (-11 -12 -13 -2 5 10 6 -7 -4 -9 1 -8 -3)
    (1 2 -3 -5 8 13 9 -10 -7 -12 4 -11 -6)
    (9 10 11 -12 -3 -8 -4 5 2 7 13 6 1)
    (7 8 9 -10 -12 -1 -6 -2 3 5 11 4 -13)
    (-4 -5 -6 7 9 -12 3 -13 11 -2 -8 -1 10)
    (-1 -2 -3 4 6 -9 -10 11 8 13 -5 12 7)
    (-3 -4 -5 6 8 -11 2 -12 13 10 -1 -7 9)
    (2 3 4 -5 -7 10 -1 11 -12 -9 6 -13 -8)
    (5 6 7 -8 -10 13 -4 1 -12 3 9 2 -11)
    (1 2 -3 -5 8 13 9 -10 -7 -12 4 -11 -6)
    (-8 -9 -10 11 13 2 7 3 -4 -1 -6 -12 -5)
    (1 2 3 -4 -6 9 10 -11 -8 -13 5 -12 -7)
    (6 7 8 -9 -11 -5 -1 2 -13 4 10 3 -12))

(list-plot intervals :point-radius 2 :style :fill)
