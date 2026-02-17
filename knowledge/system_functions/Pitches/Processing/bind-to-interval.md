Opusmodus                                                                       bind-to-interval   1

bind-to-interval intervals sequence
                              &key rotate variant omit prob seed

[Function]

Arguments and Values:
intervals                  an integer or list of integers (binding intervals).
sequence                   a list of pitches or omn list.
rotate                     an integer or list of integers (rotation).
variant                    'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                           'a (ascending), 'd (descending), 'ad (ascending-descending),
                           'da (descending-ascending), 'ro (random order) or '? (at random).
                           The default is NIL.
omit                       list of variants to omit. The default is NIL.
prob                       a oating point value between 0.1 and 0.9. The default is 0.5.
seed                       an integer. Ensures the same result each time the code is evaluated.
                           The default is NIL.


Description:

The function BIND-TO-INTERVAL will bind (connect) a series of lists (patterns) to each-
other with the given interval. Each transposition value is the sum of the last pitch in the list
plus the given interval. The result of the process is a start transposition value for the next list.
If :rotate and variant options are used, the :rotate process is the rst followed
by :variant and nally the start transposition.

In the example below the last pitch in the rst list is g4, with binding interval 1 (semitone),
therefore the start transposition value of the next list is gs4:

(bind-to-interval '(1) '((c4 d4 e4 g4) (c4 d4 g4 e4)))
=> ((c4 d4 e4 g4) (gs4 bb4 eb5 c5))


Examples:
(setf pattern '((s c4 d4 e4 g4) (s c4 d4 g4 e4)
                (s g4 e4 c4 d4) (s c4 d4 f4 g4)
                (s c4 d4 g4 f4) (s g4 f4 c4 d4)
                (s c4 d4 g4 f4) (s g4 gb4 f4 g4)
                (s g4 gb4 f4 a4) (s d4 f4 g4 a4)
                (s a4 g4 f4 d4) (s d4 f4 g4 c5)))
              fi
                      fl
                                      fi
                                                                        fi
Opusmodus                                                              bind-to-interval   2

In this example the binding intervals are 1 and 2 randomly selected:

(bind-to-interval
 (rnd-sample (length pattern) '(1 2)) pattern)
=> ((s c4 d4 e4 g4) (s gs4 bb4 eb5 c5) (s d5 b4 g4 a4) (s b4 cs5 e5 fs5)
    (s g5 a5 d6 c6) (s d6 c6 g5 a5) (s bb5 c6 f6 eb6) (s f6 e6 eb6 f6)
    (s g6 fs6 f6 a6) (s bb6 cs7 eb7 f7) (s fs7 e7 d7 b6)
    (s cs7 e7 fs7 b7))

In the next example the binding intervals are 13 and -13 with random variant:

(bind-to-interval
 (rnd-sample (length pattern) '(13 -13)) pattern :variant '?)
=> ((s c4 d4 e4 g4) (s fs3 a3 e3 d3) (s eb4 fs4 bb4 gs4) (s g3 f3 d3 c3)
    (s b1 a1 e1 fs1) (s g2 f2 bb2 c3) (s b1 a1 d2 e2) (s eb1 eb1 d1 cs1)
    (s d2 cs2 c2 e2) (s f3 d3 c3 bb2) (s b3 d4 e4 fs4) (s g5 bb5 c6 f6))

Here the binding intervals are 1, -1, 2 -2:

(bind-to-interval '(1 -1 2 -1 2 -1 2) pattern)
=> ((s c4 d4 e4 g4) (s gs4 bb4 eb5 c5) (s b4 gs4 e4 fs4)
    (s gs4 bb4 cs5 eb5) (s d5 e5 a5 g5) (s a5 g5 d5 e5)
    (s eb5 f5 bb5 gs5) (s bb5 a5 gs5 bb5) (s b5 bb5 a5 cs6)
    (s c6 eb6 f6 g6) (s a6 g6 f6 d6) (s cs6 e6 fs6 b6))

(bind-to-interval '(1 -1 2 -1 2 -1 2) pattern :variant '?)
=> ((s c4 d4 e4 g4) (s gs4 f4 bb4 c5) (s b4 gs4 e4 fs4)
    (s gs4 bb4 cs5 eb5) (s d5 c5 a4 g4) (s a4 g4 e4 d4)
    (s cs4 eb4 gs4 fs4) (s gs4 a4 bb4 gs4) (s a4 bb4 b4 g4)
    (s fs4 a4 b4 cs5) (s eb5 c5 bb4 gs4) (s g4 e4 d4 a3))

Example with rotation:

(bind-to-interval (rnd-sample (length pattern) '(1 2))
                  pattern :rotate '(1 2 1 2 1))
=> ((s c4 d4 e4 g4) (s a4 f4 g4 c5) (s d5 e5 a5 fs5)
    (s gs5 cs5 eb5 fs5) (s gs5 fs5 cs5 eb5) (s e5 a5 g5 d5)
    (s e5 b4 cs5 fs5) (s g5 a5 a5 gs5) (s bb5 gs5 g5 fs5)
    (s g5 a5 d5 f5) (s g5 d6 c6 bb5) (s c6 d5 f5 g5))
