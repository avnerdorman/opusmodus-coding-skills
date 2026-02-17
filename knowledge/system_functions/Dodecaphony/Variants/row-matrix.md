Opusmodus                                                                             row-matrix   1

row-matrix set &key remove mod assoc array type variant seed
[Function]

Arguments and Values:
set                     list of integers (a row).
remove                  NIL or T. The default is NIL.
array                   NIL or T. The default is NIL.
mod                     an integer. The default is 12.
assoc                   an integer. The default is 12.
type                    :integer or :pitch. The default is :integer.
variant                 'p (prime), 'r (retrograde), 'i (invert) and 'ri (retrograde-invert).
seed                    NIL or an integer. The default is NIL.


Description:

This function has an expansion facility which enables in the rst instance variants to be
produced based on inversion of a row. In the example the PCS row is expanded by the
number of its intervals. It can be seen that the function works in an identical way to
INTERVAL-ROW-MATRIX, but in rows alone there are no minus values.

(row-matrix (pcs '6-Z10))
=> ((0 1 3 4 5 7) (11 0 2 3 4 6) (9 10 0 1 2 4)
    (8 9 11 0 1 3) (7 8 10 11 0 2) (5 6 8 9 10 0))

(interval-row-matrix (pcs '6-Z10))
=> ((0 1 3 4 5 7) (-11 0 2 3 4 6) (-9 -10 0 1 2 4)
    (-8 -9 -11 0 1 3) (-7 -8 -10 -11 0 2) (-5 -6 -8 -9 -10 0))

As the examples demonstrate further editing can take place. Below the rst example shows
how to remove all intervals marked 2 from the rows.

(row-matrix (pcs '6-Z10) :remove 2)
=> ((0 1 3 4 5 7) (11 0 3 4 6) (9 10 0 1 4)
    (8 9 11 0 1 3) (7 8 10 11 0) (5 6 8 9 10 0))
                                                         fi
                                                                     fi
Opusmodus                                                row-matrix   2

Examples:
(row-matrix '(0 1 3 8 11 9 5 4 10 7 2 6))
=> ((0 1 3 8 11 9 5 4 10 7 2 6)
    (11 0 2 7 10 8 4 3 9 6 1 5)
    (9 10 0 5 8 6 2 1 7 4 11 3)
    (4 5 7 0 3 1 9 8 2 11 6 10)
    (1 2 4 9 0 10 6 5 11 8 3 7)
    (3 4 6 11 2 0 8 7 1 10 5 9)
    (7 8 10 3 6 4 0 11 5 2 9 1)
    (8 9 11 4 7 5 1 0 6 3 10 2)
    (2 3 5 10 1 11 7 6 0 9 4 8)
    (5 6 8 1 4 2 10 9 3 0 7 11)
    (10 11 1 6 9 7 3 2 8 5 0 4)
    (6 7 9 2 5 3 11 10 4 1 8 0))

(row-matrix '(0 1 3 8 11 9 5 4 10 7 2 6) :type :pitch)
=> ((c4 cs4 ds4 gs4 b4 a4 f4 e4 as4 g4 d4 fs4)
    (b4 c4 d4 g4 as4 gs4 e4 ds4 a4 fs4 cs4 f4)
    (a4 as4 c4 f4 gs4 fs4 d4 cs4 g4 e4 b4 ds4)
    (e4 f4 g4 c4 ds4 cs4 a4 gs4 d4 b4 fs4 as4)
    (cs4 d4 e4 a4 c4 as4 fs4 f4 b4 gs4 ds4 g4)
    (ds4 e4 fs4 b4 d4 c4 gs4 g4 cs4 as4 f4 a4)
    (g4 gs4 as4 ds4 fs4 e4 c4 b4 f4 d4 a4 cs4)
    (gs4 a4 b4 e4 g4 f4 cs4 c4 fs4 ds4 as4 d4)
    (d4 ds4 f4 as4 cs4 b4 g4 fs4 c4 a4 e4 gs4)
    (f4 fs4 gs4 cs4 e4 d4 as4 a4 ds4 c4 g4 b4)
    (as4 b4 cs4 fs4 a4 g4 ds4 d4 gs4 f4 c4 e4)
    (fs4 g4 a4 d4 f4 ds4 b4 as4 e4 cs4 gs4 c4))

(row-matrix '(9 5 4 10 7 2 6 0 1 3 8 11 12 13 14)
             :remove nil :assoc 12 :array t :mod 14)
=> #2A((9 5 4 10 7 2 6 0 1 3 8 11 12 13 0)
       (13 9 8 0 11 6 10 4 5 7 12 1 2 3 4)
       (0 10 9 1 12 7 11 5 6 8 13 2 3 4 5)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (11 7 6 12 9 4 8 2 3 5 10 13 0 1 2)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (12 8 7 13 10 5 9 3 4 6 11 0 1 2 3)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (5 1 0 6 3 12 2 10 11 13 4 7 8 9 10)
       (1 11 10 2 13 8 12 6 7 9 0 3 4 5 6)
       (10 6 5 11 8 3 7 1 2 4 9 12 13 0 1)
       (7 3 2 8 5 0 4 12 13 1 6 9 10 11 12)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (7 3 2 8 5 0 4 12 13 1 6 9 10 11 12)
       (8 4 3 9 6 1 5 13 0 2 7 10 11 12 13))
Opusmodus                                                     row-matrix   3

(row-matrix '(9 5 4 10 7 2 6 0 1 3 8 11 12 13 14)
             :assoc 12 :array t :mod 14)
=> #2A((9 5 4 10 7 2 6 0 1 3 8 11 12 13 0)
       (13 9 8 0 11 6 10 4 5 7 12 1 2 3 4)
       (0 10 9 1 12 7 11 5 6 8 13 2 3 4 5)
       (8 4 3 9 6 1 5 13 0 2 7 10 11 12 13)
       (11 7 6 12 9 4 8 2 3 5 10 13 0 1 2)
       (2 12 11 3 0 9 13 7 8 10 1 4 5 6 7)
       (12 8 7 13 10 5 9 3 4 6 11 0 1 2 3)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (5 1 0 6 3 12 2 10 11 13 4 7 8 9 10)
       (1 11 10 2 13 8 12 6 7 9 0 3 4 5 6)
       (10 6 5 11 8 3 7 1 2 4 9 12 13 0 1)
       (5 1 0 6 3 12 2 10 11 13 4 7 8 9 10)
       (6 2 1 7 4 13 3 11 12 0 5 8 9 10 11)
       (7 3 2 8 5 0 4 12 13 1 6 9 10 11 12)
       (8 4 3 9 6 1 5 13 0 2 7 10 11 12 13))

(setf row (row-matrix '(9 5 4 10 7 2 6 0 1 3 8 11 12 13 14)
                        :remove '(7 8 9)))
=> ((5 4 10 2 6 0 1 3 11 0 1 2)
    (1 2 11 6 10 4 5 0 3 4 5 6)
    (2 10 3 0 11 5 6 1 4 5 6)
    (4 3 6 1 5 11 0 2 10 11 0 1)
    (11 6 0 4 2 3 5 10 1 2 3 4)
    (4 0 11 5 2 1 10 3 6)
    (0 1 10 5 3 4 6 11 2 3 4 5)
    (6 2 1 4 11 3 10 0 5 10 11)
    (5 1 0 6 3 10 2 11 4 10)
    (3 11 10 4 1 0 6 2 5 6)
    (10 6 5 11 3 1 2 4 0 1 2 3)
    (3 2 5 0 4 10 11 1 6 10 11 0)
    (6 2 1 4 11 3 10 0 5 10 11)
    (5 1 0 6 3 10 2 11 4 10)
    (4 3 6 1 5 11 0 2 10 11 0 1))
Opusmodus                                               row-matrix   4

(list-plot row :point-radius 2 :style :fill)




All 4 variants:

(row-matrix '(3 11 10 2 1 0 6 4 7 5 9 8))
=> ((3 11 10 2 1 0 6 4 7 5 9 8)
    (7 3 2 6 5 4 10 8 11 9 1 0)
    (8 4 3 7 6 5 11 9 0 10 2 1)
    (4 0 11 3 2 1 7 5 8 6 10 9)
    (5 1 0 4 3 2 8 6 9 7 11 10)
    (6 2 1 5 4 3 9 7 10 8 0 11)
    (0 8 7 11 10 9 3 1 4 2 6 5)
    (2 10 9 1 0 11 5 3 6 4 8 7)
    (11 7 6 10 9 8 2 0 3 1 5 4)
    (1 9 8 0 11 10 4 2 5 3 7 6)
    (9 5 4 8 7 6 0 10 1 11 3 2)
    (10 6 5 9 8 7 1 11 2 0 4 3))

(row-matrix '(3 11 10 2 1 0 6 4 7 5 9 8) :variant 'r)
=> ((8 9 5 7 4 6 0 1 2 10 11 3)
    (0 1 9 11 8 10 4 5 6 2 3 7)
    (1 2 10 0 9 11 5 6 7 3 4 8)
    (9 10 6 8 5 7 1 2 3 11 0 4)
    (10 11 7 9 6 8 2 3 4 0 1 5)
    (11 0 8 10 7 9 3 4 5 1 2 6)
    (5 6 2 4 1 3 9 10 11 7 8 0)
    (7 8 4 6 3 5 11 0 1 9 10 2)
    (4 5 1 3 0 2 8 9 10 6 7 11)
    (6 7 3 5 2 4 10 11 0 8 9 1)
    (2 3 11 1 10 0 6 7 8 4 5 9)
    (3 4 0 2 11 1 7 8 9 5 6 10))
Opusmodus                                                row-matrix   5

(row-matrix '(3 11 10 2 1 0 6 4 7 5 9 8) :variant 'i)
=> ((3 7 8 4 5 6 0 2 11 1 9 10)
    (11 3 4 0 1 2 8 10 7 9 5 6)
    (10 2 3 11 0 1 7 9 6 8 4 5)
    (2 6 7 3 4 5 11 1 10 0 8 9)
    (1 5 6 2 3 4 10 0 9 11 7 8)
    (0 4 5 1 2 3 9 11 8 10 6 7)
    (6 10 11 7 8 9 3 5 2 4 0 1)
    (4 8 9 5 6 7 1 3 0 2 10 11)
    (7 11 0 8 9 10 4 6 3 5 1 2)
    (5 9 10 6 7 8 2 4 1 3 11 0)
    (9 1 2 10 11 0 6 8 5 7 3 4)
    (8 0 1 9 10 11 5 7 4 6 2 3))

(row-matrix '(3 11 10 2 1 0 6 4 7 5 9 8) :variant 'ri)
=> ((10 9 1 11 2 0 6 5 4 8 7 3)
    (6 5 9 7 10 8 2 1 0 4 3 11)
    (5 4 8 6 9 7 1 0 11 3 2 10)
    (9 8 0 10 1 11 5 4 3 7 6 2)
    (8 7 11 9 0 10 4 3 2 6 5 1)
    (7 6 10 8 11 9 3 2 1 5 4 0)
    (1 0 4 2 5 3 9 8 7 11 10 6)
    (11 10 2 0 3 1 7 6 5 9 8 4)
    (2 1 5 3 6 4 10 9 8 0 11 7)
    (0 11 3 1 4 2 8 7 6 10 9 5)
    (4 3 7 5 8 6 0 11 10 2 1 9)
    (3 2 6 4 7 5 11 10 9 1 0 8))
