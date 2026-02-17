Opusmodus                                                           interval-expansion-series   1

interval-expansion-series n step count intervals
                                             &key max-interval ambitus start seed

[Function]

Arguments and Values:
n                       an integer.
step                    interval size.
count                   list of integers.
intervals               list of intervals.
max-interval            an integer (maximum interval size).
ambitus                 integers (low high), pitches (low high) or instrument-name.
                        The default is 'piano.
seed                    NIL or an integer. The default is NIL.


Description:

This function allows a source list of intervals to expand into n variations.

(interval-expansion-series 8 '(1 -1 1) '(2) '(1 1 1 1) :max-interval 3)
=> ((1 1 1 1) (1 0 1 2) (0 0 1 1) (0 0 2 2)
    (0 1 2 3) (0 0 3 3) (1 0 3 2) (2 1 3 2))

(interval-expansion-series
 10 '(1 -1 2 -2) '(1 2 3) '(-6 -5 3 4) :max-interval 6)
=> ((-6 -5 3 4) (-6 5 3 6) (-6 4 5 4) (5 4 6 3) (-6 4 -4 3)
    (-6 2 -5 2) (-4 2 6 2) (-4 4 5 1) (-4 -6 5 2) (-4 4 5 2))

In the example below 10 expansions are made of the interval list '(-6 -5 3 4). The
interval step (size and direction) is a corresponding list '(1 -1 2 -2). There follows a
count list (number of intervals to process) '(1 2 3) and then the interval source list
itself '(-6 -5 3 4). Use this function to produce a mosaic of outputs from a note row of
intervals.


Examples:
(interval-expansion-series
 10 '(1 -1 2 -2) '(1 2 3) '(-6 -5 3 4) :max-interval 6 :seed 20)
=> ((-6 -5 3 4) (-6 -6 3 4) (4 -6 1 2) (5 -6 3 0) (4 -6 3 0)
    (3 -6 3 2) (2 -6 5 4) (2 -5 5 4) (2 -6 5 5) (2 -6 5 3))
Opusmodus                                                      interval-expansion-series     2

(interval-expansion-series
 10 '(1 -1 2 -2) '(1 2 3) '(-6 -5 3 4)
 :ambitus '(-5 11) :start 20 :seed 20)
=> ((-6 -5 3 4) (-6 6 -3 -4) (8 6 -1 -2) (-7 -6 3 0) (8 -6 3 0)
    (-3 6 -3 -2) (10 -6 5 -4) (-10 5 -5 4) (10 -6 5 -5) (2 -6 5 3))

What can be achieved with this function is a measured evolution or variation of a motif or
phrase.

(setf evolve-var
        (integer-to-pitch
         (interval-expansion-series
          10 '(3 -1 4 -1 2) '(2 1 1) '(1 6 7 -5 2) :seed 5368)))
=> ((cs4 fs4 g4 g3 d4) (cs4 fs4 a4 g3 cs4) (f4 fs4 a4 fs3 cs4)
    (a4 fs3 eb3 fs4 b3) (eb3 fs3 eb3 fs4 g3) (eb3 fs3 c3 fs4 g3)
    (eb3 fs3 c3 fs4 g4) (cs5 fs4 c5 fs3 a4) (cs5 fs4 b4 fs3 gs4)
    (c3 fs3 b2 fs4 e3))

(pitch-list-plot (flatten evolve-var) :join-points t :join-chords nil)


      c6c6


     fs5fs5


      c5c5


     fs4fs4


      c4c4


     fs3fs3


      c3c3


     fs2fs2


      c2c2
               55      10
                        10     15
                                15    20
                                       20     25
                                               25     30
                                                       30     35
                                                               35     40
                                                                       40     45
                                                                               45    50
                                                                                      50
