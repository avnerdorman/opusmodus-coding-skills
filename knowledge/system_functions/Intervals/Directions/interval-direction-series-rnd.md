Opusmodus                                                    interval-direction-series-rnd   1

interval-direction-series-rnd intervals &key type ambitus seed
[Function]

Arguments and Values:
intervals               list of intervals.
type                    'list, NIL or '? (at random). The default is NIL (random).
ambitus                 integers (low high), pitches (low high) or instrument-name.
                        The default is 'piano.
seed                    NIL or an integer. The default is NIL.


Description:

This function is similar to INTERVAL-DIRECTION-SERIES but it has no secondary list
or direction ag, these arguments are randomised.

(interval-direction-series-rnd '((1) 2 1 (2 1) 1 2 3 1 2 6))
=> ((-1) -2 1 (2 1) -1 2 -3 -1 -2 -6)


Examples:

Remember also how chordal intervals are interpreted in an interval list, particularly at
the head of a list.

(interval-to-pitch
 (interval-direction-series-rnd '((1) 2 1 (2 1) 1 2 3 1 2 6)))
=> (c4b3 db4 c4 d4db4 c4 d4 f4 gb4 ab4 d4)

(interval-direction-series-rnd '((6 2 7) (5 7 3) (1 0 5 4 9 11)))
=> ((-6 -2 -7) (5 7 3) (-1 0 5 4 9 -11))

(interval-direction-series-rnd '((6 2 7) (5 7 3) ((1 0) 5 4 9 11))
                               :type 'list)
=> ((6 2 7) (-5 -7 -3) ((1 0) 5 4 9 11))

(interval-direction-series-rnd '((6 2 7) (5 7 3) ((1 0) 5 4 9 11)))
=> ((6 -2 7) (5 7 -3) ((-1 0) 5 -4 -9 -11))

(interval-direction-series-rnd '(((6 2) 7) (5 7 3) (1 0 5 4 (9 11)))
                               :type '?)
=> (((6 2) 7) (-5 -7 -3) (-1 0 -5 4 (-9 -11)))

(interval-direction-series-rnd '((1) 2 1 (2 1) 1 2 3 1 2 6))
=> ((1) 2 1 (2 -1) -1 -2 3 -1 2 6)
       fl
