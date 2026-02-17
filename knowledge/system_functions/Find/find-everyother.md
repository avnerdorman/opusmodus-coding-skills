Opusmodus                                                           find-everyother   1

find-everyother n sequence &key offset
[Function]

Arguments and Values:
n                          an integer.
sequence                   a sequence.
offset                     an integer or NIL. The default is NIL.


Description:

This function returns every nth item in a sequence.

(find-everyother 2 '(1 2 3 4 5 6 7 8))
=> (1 3 5 7)

(find-everyother 3 '(1 2 3 4 5 6 7 8))
=> (1 4 7)

(find-everyother 2 '(1 2 3 4 5 6 7 8) :offset 1)
=> (2 4 6 8)

With sublists, each list is processed separately.

(find-everyother 2 '((1 2 3 4 5 6 7 8)
                     (1 2 3 4 5 6 7 8 9 10 11)))
=> ((1 3 5 7) (1 3 5 7 9 11))

Note the handling of further nested sublists:

(find-everyother 2 '(((1 2) (3 4) (5 6) (7 8))
                       ((1 2) (3 4) (5 6) (7 8) (9 10) (11))))
=> (((1 2) (5 6)) ((1 2) (5 6) (9 10)))

(find-everyother 2 '(c4 d4 e4 f4 g4 a4 b4 c5))
=> (c4 e4 g4 b4)

Note the handling of tuplets:

(find-everyother 2 '(s c4 mp cs5 d5 cs4 3q c5 c6 d5 e ds6 f5 e4 ds3))
=> (s c4 mp s d5 mp 3q c5 mp c6 d5 e f5 mp e ds3 mp)

(find-everyother 3 '(s c4 mp cs5 d5 cs4 3q c5 c6 d5 e ds6 f5 e4 ds3))
=> (s c4 mp s cs4 mp e f5 mp)

(find-everyother 2 '(s = = = 3q = = e = = =))
=> (1/16 1/16 1/12 1/12 1/12 1/8 1/8)
Opusmodus                                                               find-everyother   2

(find-everyother 3 '(s = = = 3q = = e = = =))
=> (1/16 1/16 1/8)


Examples:

As with many of the FIND functions this can be used to generate a further part. For example
it provides a way to add bass and chords spaced evenly under a melody.

(setf seq (rnd-sample 25 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 213))
=> (g4 c4 c4 g4 fs4 c4 fs4 gs4 c4 g4 c5 cs4 c4
    c4 g4 c4 c4 c4 g4 c4 g4 fs4 c5 c4 fs4)

(span seq '(e))
=> (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8
    1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8)

(setf bass (find-everyother 5 seq))
=> (g4 c4 c5 c4 g4)

(setf chord (gen-trim 5 (gen-chord 12 3 4 0 0 seq :seed 31)))
=> (g4c4 fs4c4gs4 c4g4c5cs4 c4g4 c4)
