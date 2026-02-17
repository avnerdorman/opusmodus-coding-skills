Opusmodus                                                                           gen-divide    1

gen-divide size sequence &key omit-rest encode
[Function]

Arguments and Values:
size                      an integer or a list of integers.
sequence                  a sequence.
omit-rest                 T (omit length rests count) or NIL. The default is NIL.
encode                    T or NIL. With :encode T (the default) the function transforms OMN repeat
                          symbols (=) into its values, while :encode NIL returns
                          selections unchanged.


Description:

GEN-DIVIDE can be used to divide a sequence into sublists of a given size.


Examples:
(gen-divide 2 '(0 1 2 3 4 5 6 7 8 9))
=> ((0 1) (2 3) (4 5) (6 7) (8 9))

(gen-divide '(1 3 2) '(0 1 2 3 4 5 6 7 8 9))
=> ((0) (1 2 3) (4 5) (6) (7 8 9))

Existing sublists will be treated as single items.

(gen-divide 2 '(0 (1 2) (3 4) 5 (6 7) 8 9))
=> ((0 (1 2)) ((3 4) 5) ((6 7) 8) (9))

(gen-divide 3 '(q -q -e e e e q q -s s s s))
=> ((1/4 -1/4 -1/8) (1/8 1/8 1/8) (1/4 1/4 -1/16) (1/16 1/16 1/16))

(gen-divide 3 '(q -q -e e e e q q -s s s s) :omit-rest t)
=> ((1/4 -1/4 -1/8 1/8 1/8) (1/8 1/4 1/4) (-1/16 1/16 1/16 1/16))

(gen-divide 3 '(q -q -e e e e q q -s s s s) :omit-rest t :omn t)
=> ((q - -e = =) (e q =) (-s = = =))

OMN:

(gen-divide 3 '(q c4 -q -e d4 e e4 e f4 e g4 q a4 q b4 -s s c5 d5 e5))
=> ((q c4 mf - -e) (e d4 mf e4 f4) (e g4 mf q a4 b4)
    (-s c5 mf d5) (s e5 mf))
Opusmodus                                                                       gen-divide     2

(gen-divide 3 '(q c4 -q -e d4 e e4 e f4 e g4 q a4 q b4 -s s c5 d5 e5)
            :omit-rest t)
=> ((q c4 mf - -e d4 e4) (e f4 mf g4 q a4)
    (q b4 mf -s c5 d5) (s e5 mf))

(gen-divide
 '(2 4 2) '(q c4 -q -e d4 e e4 e f4 e g4 q a4 q b4 -s s c5 d5 e5))
=> ((q c4 mf -) (-e d4 mf e4 f4) (e g4 mf q a4)
    (q b4 mf -s) (s c5 mf d5 e5))

(gen-divide
 '(2 4 2) '(q c4 -q -e d4 e e4 e f4 e g4 q a4 q b4 -s s c5 d5 e5)
 :omit-rest t)
=> ((q c4 mf - -e d4) (e e4 mf f4 g4 q a4)
    (q b4 mf -s c5) (s d5 mf e5))

This is one of the most important and necessary functions for managing composition with
lists. Sometimes pieces begin with large streams of data, say from the output of a generator
like GEN-NOISE. When converted from vectors to pitches the output displays often
fascinating patterns, but to be organised into pieces of music such patterns may need to be
divided up into manageable lists.

Here's an example of GEN-DIVIDE being used to make a sequence of novel pentatonic
tonalities from a white-noise source. Try evaluating each part of the expression below
starting from the end with (gen-noise 50) then (vector-round 1 24 (gen-
noise 50)) then (vector-to-list (vector-round 1 24 (gen-noise
50))) and so on until you've taken apart the whole expression:

(setf five-pentatonic
      (sort-asc
       (gen-divide 5
                   (find-unique
                     (integer-to-pitch
                      (vector-round 1 24 (gen-noise 50)))))))
=> ((e4 fs4 bb4 fs5 b5) (d4 c5 eb5 gs5 c6)
    (eb4 f4 gs4 b4 e5) (cs4 g4 d5 f5 g5) (a4 cs5 a5))
