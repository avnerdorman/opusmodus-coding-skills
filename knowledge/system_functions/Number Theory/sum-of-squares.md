Opusmodus                                                             sum-of-squares   1

sum-of-squares numbers
[Function]

Arguments and Values:
numbers                 a list of integers.


Description:

The function SUM-OF-SQUARES will calculate all the squares for a series of numbers and
them sum them. In mathematics, a SQUARE of a number means the result of multiplying the
number by itself. For example, the square of 6 is 6×6=36. Squaring a number can also be
written as 62=36.

(sum-of-squares '(1 2 3 4))
=> 30

(sum-of-squares '(43 435 65))
=> 195299


Examples:
(setf mel-pattern
      (gen-divide 4 (rnd-sample 20 '(1 2 3 4) :seed 78)))
=> ((1 3 4 1) (1 1 1 4) (1 3 2 2) (3 2 3 2) (4 2 1 4))

(setf drone (mapcar 'sum-of-squares mel-pattern))
=> (27 19 18 26 37)

(setf mel-1 (integer-to-pitch mel-pattern))
=> ((cs4 eb4 e4 cs4) (cs4 cs4 cs4 e4) (cs4 eb4 d4 d4)
    (eb4 d4 eb4 d4) (e4 d4 cs4 e4))

(setf drone-1 (pitch-transpose -36 (integer-to-pitch drone)))
=> (eb3 g2 fs2 d3 cs4)
