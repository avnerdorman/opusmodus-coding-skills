Opusmodus                                                               interval-direction-series   1

interval-direction-series count intervals &key section exclude
                                                ambitus first seed

[Function]

Arguments and Values:
count                    list of integers.
intervals                list of intervals.
first                    'a (ascending), 'd (descending) or '? (at random) direction.
                         The default is ?.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
ambitus                  integers (low high), pitches (low high) or instrument-name.
                         The default ambitus is 'piano.
seed                     NIL or an integer. The default is NIL.


Description:

This function returns a new interval list transformed by count and size of directions.

(interval-direction-series
 '(1 1 1) '(1 1 1 1 1) :first 'a)
=> (1 -1 1 -1 1)

(interval-direction-series
 '(1 1 1) '(1 1 (1 1) 1) :first 'd)
=> (-1 1 (-1 -1) 1)

(interval-direction-series
 '(1 2 3) '(1 2 1 (2 1)) :first 'd)
=> (-1 2 1 (-2 -1))

(interval-direction-series
 '(1 2 3) '(1 2 1 (2 1)) :first '?)
=> (1 -2 -1 (2 1))

To understand how the interval list is represented here's a reminder of the way chords of
intervals are shown.

(interval-to-pitch '(-1 2 1 (-2 -1)))
=> (c4 b3 db4 d4 c4b3)
Opusmodus                                        interval-direction-series   2

Examples:
(interval-direction-series
 '((1 2 3 2 2 1 1 2 3 2 2 1))
 '((1 2 1 (2 -1) 1 2 3 1 2 6)
   (1 2 1 (2 -1) 1 2 3 1 2 6)) :first 'd)
=> ((-1 2 1 (-2 -1) -1 -2 3 1 -2 -6) (-1 2 1 (-2 -1) -1 -2 3 1 -2 -6))

(interval-direction-series
 '((1 2 3 2 2 1) (1 2 3 2 2 1))
 '(((5 -6) 44 (-36 -11)) ((0 6) (11 -2) (8 6) (0 -2) (-8 13)))
 :first 'a)
=> (((5 6) -44 (36 11)) ((0 -6) (11 2) (8 6) (0 -2) (-8 -13)))

(interval-direction-series
 '((4)) '((4 5 6 7 8 9) (2 1) (2 1) ((1 2 3) 1 2 6)
          (11 11 11 11 11) (11 11 1))
 :ambitus 'violin :start 'gs6 :first 'd)
=> ((-4 -5 -6 -7 8 9) (-2 -1) (-2 -1) ((-1 -2 -3) -1 -2 -6)
    (-11 11 11 11 -11) (11 11 1))
