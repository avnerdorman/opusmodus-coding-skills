Opusmodus                                                                     interval-scale2   1

interval-scale2 scale intervals &key ambitus start
[Function]

Arguments and Values:
scale                   oating point number (from to).
intervals             list of intervals.
ambitus               integers (low high), pitches (low high) or instrument-name.
                      The default is 'piano.
start                 integer or pitch name. The default is 0 (c4).


Description:

This function allows for further scaling of an interval row. This extension of
INTERVAL-SCALE2 enables more complex scaling as can be seen in the fourth example in
the preliminary list.

(interval-scale2 '(0.5 1.5) '(2 4 6 8 10 12 14))
=> (1 3 5 8 12 16 -21)

(pcs '6-Z10)
=> (0 1 3 4 5 7)

(interval-scale 1.5 (pcs '6-Z10))
=> (0 2 4 6 8 10)

(interval-scale 0.5 (pcs '6-Z10))
=> (0 0 2 2 2 4)

(interval-scale2 '(1.5 2.0) (pcs '6-Z10))
=> (0 2 5 7 10 14)

(interval-scale2 '(1.5 2.0) '(-11 -7 6 -12 9 -4 8))
=> (-16 -11 10 -21 17 -8 16)
                 fl
Opusmodus                                                interval-scale2   2

Example:
(interval-scale2
 '(1.0 2.0) '(-6 2 (-3 2) -8 5 -1 6 1 -9 1) :ambitus '(-5 12))
=> (6 -2 (4 -2) -11 7 -2 10 2 -17 2)

(interval-scale2
 '((2.0 0.5) (0.5 2.0)) '((-6 2 (-3 2) -8) (5 -1 6 1 -9 1)))
=> ((-12 3 (-3 2) -4) (2 -1 7 1 -15 2))

(interval-scale2 '(1.0 2.0) '((-6 2 (-3 2) -8) (5 -1 6 1 -9 1))
 :ambitus '(-5 12) :start 'bb4)
=> ((-6 3 (-5 3) 4) (-5 1 -8 -2 16 -2))
