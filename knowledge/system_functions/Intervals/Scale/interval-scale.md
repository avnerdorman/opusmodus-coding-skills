Opusmodus                                                                        interval-scale   1

interval-scale scale intervals &key ambitus start
[Function]

Arguments and Values:
scale                     oating point number.
intervals               list of intervals.
ambitus                 integers (low high), pitches (low high) or instrument-name.
                        The default is 'piano.
start                   integer or pitch name. The default is 0 (c4).


Description:

This function allows the scaling of an interval row. This could be valuable to the
composer who wants to create variants on an interval row.

(interval-scale 0.5 '(2 4 6 8))
=> (1 2 3 4)

(pcs '6-Z10)
=> (0 1 3 4 5 7)

(interval-scale 1.5 (pcs '6-Z10))
=> (0 2 4 6 8 10)

(interval-scale 0.5 (pcs '6-Z10))
=> (0 0 2 2 2 4)


Example:
(interval-scale 1.5 '(-11 -7 6 -12 9 -4 8))
=> (-16 -10 9 -18 14 -6 12)

(interval-scale
 1.5 '(-6 2 (-3 2) -8 5 -1 6 1 -9 1) :ambitus '(-5 12))
=> (9 -3 (4 -3) -12 8 -2 9 2 -14 2)

(interval-scale
 2.0 '((-6 2 (-3 2) -8) (5 -1 6 1 -9 1)))
=> ((-12 4 (-6 4) -16) (10 -2 12 2 -18 2))
                  fl
Opusmodus                                          interval-scale   2

(interval-scale
 '(1.0 2.0) '((-6 2 (-3 2) -8) (5 -1 6 1 -9 1))
 :ambitus '(-5 12) :start 'd5)
=> ((-6 2 (-3 2) 8) (-10 2 12 2 -6 -2))

(interval-scale
 '(1.0 0.8) '((-6 2 (-3 2) -8) (5 -1 6 1 -9 1)))
=> ((-6 2 (-3 2) -8) (4 -1 5 1 -7 1))
