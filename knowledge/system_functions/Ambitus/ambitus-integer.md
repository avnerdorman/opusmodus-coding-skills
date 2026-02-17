Opusmodus                                                                          ambitus-integer   1

ambitus-integer range sequence &key section exclude
[Function]

Arguments and Values:
range                    integers (low high), pitches (low high) or instrument-name.
sequence                 a list or lists of integers.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The AMBITUS-INTEGER function enables an integer sequence to be modi ed to a given
range. If the integer is not in the given range then transposition is applied - 12, 24, 36,
-12, -24, etc... if further process is need it then the inversion is applied.


Examples:
(ambitus-integer '(0 12) '(0 7 -13 0 -5 18 -33 13))
=> (0 7 11 0 7 6 3 1)

(ambitus-integer '(0 6) '(0 7 -13 0 -5 18 -33 13))
=> (0 5 1 0 5 6 3 1)

(ambitus-integer '(0 6) '(10 20 5 18 14 15 2 7))
=> (2 4 5 6 2 3 2 5)

(ambitus-integer '(g3 f5) '(10 20 5 18 14 15 2 7))
=> (10 8 5 6 14 15 2 7)

(ambitus-integer 'violin '((0 7) (-13 0) (-5 18) (-33 13)))
=> ((0 7) (-1 0) (-5 18) (3 13))

Integer to pitch:

(integer-to-pitch
 (ambitus-integer '(g3 f5) '(10 20 5 18 14 15 2 7)))
=> (bb4 gs4 f4 fs4 d5 eb5 d4 g4)
                                                                              fi
