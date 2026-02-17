Opusmodus                                                                   interval-repeat    1

interval-repeat n low-change high-change low-repeat high-repeat
                           interval &key seed

[Function]

Arguments and Values:
n                        number of intervals to generate (can be a list).
low-change               an integer.
high-change              an integer.
low-repeat               an integer.
high-repeat              an integer.
interval                 list of intervals.
seed                     NIL or an integer. The default is NIL.


Description:

This function generates repetitions of a single interval above or below a base (0). It
responds to low-change and high-change, and low-repeat and high-repeat
arguments.

(interval-repeat 12 4 10 5 11 7)
=> (-7 7 -7 7 -7 7 0 0 0 0 0 -7)

(setf row-r (interval-repeat 5 2 6 3 1 3))
=> (-3 3 -3 3 -3)

(interval-repeat '(4 5 6) 1 3 1 2 '(13 11 13 6))
=> ((-13 13 0 -13) (-11 0 11 0 0)
    (-13 13 -13 0 13 -13) (6 -6 6 0))))


Examples:

This is the kind of function that invites experimentation. Can you imagine creating a whole
piece from a single interval source? It's the kind of challenge many composers have risen to
in the past. With the addition of OPUSMODUS functions and algorithms all kinds of new
adventures with musical material are possible.

(interval-repeat 4 1 3 1 2 13 :seed 56)
=> (13 -13 13 0)

(interval-repeat
 (rnd-sample 4 (gen-integer 5 8)) 1 3 1 2 '(13 11 13 6))
=> ((13 -13 0 13 -13) (-11 0 11 0 0)
    (13 0 0 -13 0 13 -13 13) (6 -6 6 0 0 -6 0 0))
Opusmodus                                               interval-repeat   2

Score Example:

Interval study for guitar.

(create-chord sd-1 '(g4 cs5 f5 gs5))
(create-chord sd-2 '(c2 fs2 b2 d3))

(setf
  on-g (interval-repeat '(4 5 6) 1 3 1 2 (rest sd-1))
  on-b (interval-repeat '(4 5 6) 1 3 1 2 (rest sd-2))
)

(setf
  on-g1 (gen-repeat '(2 1 2) on-g)
  on-b1 (gen-repeat '(2 1 2) on-b)
)

(setf
  on-g1-a (interval-map '(g4) on-g1)
  on-b1-a (interval-map '(b4) on-b1)
  on-g-x (interval-map '(g4) on-g)
)

(setf g1-rhy (span on-g1-a '(1/8)))
(setf coda (span on-g '(1/16)))
(setf g1-dur (length-merge g1-rhy))
(setf b1-rhy (span on-b1-a '(1/8)))
(setf b1-dur (length-merge b1-rhy))

(def-score i-r-study
             (:title "i-r-study"
              :key-signature 'atonal
              :time-signature '(5 8)
              :tempo 110)

 (guitar
  :length (append g1-rhy b1-rhy coda)
  :pitch (append on-g1-a on-b1-a on-g-x)
  :velocity '((mp) (f) (ff) (mf) (ff))
  :duration (append g1-dur b1-dur coda)
  :channel 1
  :sound 'gm
  :program 'acoustic-guitar-nylon))

(display-midi (compile-score 'i-r-study))
