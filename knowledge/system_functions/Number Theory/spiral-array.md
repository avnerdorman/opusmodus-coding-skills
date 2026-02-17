Opusmodus                                                               spiral-array    1

spiral-array rows columns
[Function]

Arguments and Values:
rows                      an integer.
columns                   an integer.


Description:

SPIRAL-ARRAY will produce a two-dimensional Lisp array containing a spiral matrix. A
spiral array is a square arrangement of the rst N2 natural numbers, where the numbers
increase sequentially as you go around the edges of the array spiralling inwards.

(integer-to-pitch (array-to-list (spiral-array 5 3)))
=> ((c4 cs4 d4) (b4 c5 eb4) (bb4 cs5 e4) (a4 d5 f4) (gs4 g4 fs4))


Examples:

Calculate a rectangular spiral matrix:

(spiral-array 5 3)
=> #2A(( 0 1 2)
       (11 12 3)
       (10 13 4)
       ( 9 14 5)
       ( 8 7 6))

(spiral-array 6 6)
=> #2A(( 0 1 2 3 4 5)
       (19 20 21 22 23 6)
       (18 31 32 33 24 7)
       (17 30 35 34 25 8)
       (16 29 28 27 26 9)
       (15 14 13 12 11 10))
                                        fi
Opusmodus                                       spiral-array   2

(list-plot (array-to-list (spiral-array 6 6))
 :join-points t :point-radius 2
 :line-width 0.5 :zero-based t)
