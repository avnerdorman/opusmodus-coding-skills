Opusmodus                                                                          interval-series   1

interval-series n step &key ambitus seed start
[Function]

Arguments and Values:
n                          a list of integers.
step                       interval size.
ambitus                    integers (low high), pitches (low high) or instrument-name.
                           The default is 'piano.
start                      start (a pitch or an integer).
seed                       NIL or an integer. The default is NIL.


Description:

This function creates series of interval rows from a list of integers and a list of interval sizes.

(interval-series '(3 2 1 2 3) '(1 2 3) :seed 34)
=> ((2 -1 1) (-1 3) (-2) (-3 3) (3 -3 -2))

(interval-series '(3 2 1 2 3) '(1 2 4) :seed 34)
=> ((2 -1 1) (-1 4) (-2) (-4 4) (4 -4 -2))

(interval-series
 '(3 2 1 2 3) '(1 2 3) :start 'gs6 :seed 45)
=> ((1 -3 -3) (1 -1) (3) (-3 2) (2 -1 -2))


Example:

This might be used to create elaborate pitch sequences with ALL-INTERVAL scales.

(setf my-air-rnd (rnd-air :seed 45))
=> (0 1 8 5 7 10 9 3 11 4 2 6)

(setf int-ser (rnd-sample 12 '(1 2 3 4 5 6 7 8 9) :seed 87))
=> (2 2 2 2 8 3 7 4 4 5 4 6)

(interval-series int-ser my-air-rnd)
=> ((11 6) (-10 -6) (6 11) (3 -7) (1 -11 -5 5 5 -5 -8 10)
    (-11 -6 0) (4 -8 -8 -5 -4 -6 2) (2 2 9 10) (0 5 3 9)
    (-8 2 8 1 0) (9 -1 -9 -2) (-10 4 4 6 -6 -1))
