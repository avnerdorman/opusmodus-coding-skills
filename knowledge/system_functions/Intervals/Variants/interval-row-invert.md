Opusmodus                                                          interval-row-invert   1

interval-row-invert intervals &key direction mod assoc seed
[Function]

Arguments and Values:
intervals               row of intervals.
direction               NIL or an integer. The default is NIL.
assoc                   row size. The default is 12.
mod                     row size. The default is 12.
seed                    NIL or an integer. The default is NIL.


Description:

In this function an interval row is inverted. The direction argument when set at T further
inverts the row around the original inversion. The argument :assoc refers to length of the
row and the :mod argument to the interval size within a row.


Examples:
(interval-row-invert '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12))
=> (-3 -7 8 -2 5 -10 6 0 -11 9 -4 1 -1 0)

(interval-row-invert
 '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12) :mod 14)
=> (-3 -7 8 -14 5 -10 6 0 -13 9 -4 13 -11 0)

(interval-row-invert
 '(19 5 -4 10 -7 2 -6 1 -3 8 -11) :assoc 12 :mod 14 :seed 42)
=> (-7 -7 8 -2 5 -14 6 -11 9 -4 1)

(interval-row-invert
 '((1 -13 8 -11 19 -5 14 10 -7 2 16) (19 5 -4 10 -7 2 -6 1 -3 8 -11))
 :assoc 12 :mod 14 :seed 2465)
=> ((-13 11 -4 13 -5 7 -10 -2 5 -10 -4)
    (-5 -7 8 -14 5 -10 6 -13 9 -4 13))
