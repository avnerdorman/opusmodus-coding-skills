Opusmodus                                                                 ambitus-interval   1

ambitus-interval range sequence &key section exclude
[Function]

Arguments and Values:
range                  an integer (low high), a pitch symbol (low high) or instrument-name.
sequence               a list or lists of intervals.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.


Description:

The AMBITUS-INTERVAL function enables an interval sequence to be modi ed to t into a
given range (low high). If the interval is not in the given range then inversion is
applied to all following intervals.


Examples:
(ambitus-interval
 '(c3 c5) '((1) 3 -4 2 -1 3 8 1 1 6 1 1 -11 1 1 1 1 -14 1 1))
=> ((1) 3 -4 2 -1 3 8 -1 -1 -6 -1 -1 -11 1 1 1 1 14 -1 -1)

(ambitus-interval
 '(-12 12) '((1 3 -4 2 -1 3 8 1 1) (6 1 1 -11 1 1 1 1 -14 1 1)))
=> ((1 3 -4 2 -1 3 8 -1 -1) (-6 -1 -1 -11 1 1 1 1 14 -1 -1))

(ambitus-interval
 '(-10 12)
 '((-12 3) -4 (2 -1) 3 (8 1) 11 (1 1) 1 (1 1) 1 1 (-14 1) 1))
=> ((12 -3) -4 (2 -1) 3 (-8 -1) 11 (1 -1) -1 (-1 -1) -1 -1 (-14 1) 1)

(ambitus-interval
 '(0 6) '(-12 3 -4 2 -1 3 8 1 11 1 1 1 1 1 1 1 -14 1 1))
=> (0 3 2 -2 1 -3 2 1 1 -1 -1 -1 -1 -1 1 1 2 -1 -1)

(ambitus-interval
 'violin '(2 3 4 1 4 1 2 -3 -4 -1 -4 -3 -2 -5 -1 -1))
=> (2 3 4 1 4 1 2 -3 -4 -1 -4 -3 -2 -5 1 1)
                                                                     fi
                                                                               fi
Opusmodus                                               ambitus-interval   2

Interval to pitch:

(interval-to-pitch
 (ambitus-interval
  'violin '(2 3 4 1 4 1 2 -3 -4 -1 -4 -3 -2 -5 -1 -1)))
=> (c4 d4 f4 a4 bb4 d5 eb5 f5 d5 bb4 a4 f4 d4 c4 g3 gs3 a3)
