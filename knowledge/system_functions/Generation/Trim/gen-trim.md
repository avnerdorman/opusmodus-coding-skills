Opusmodus                                                                             gen-trim    1

gen-trim size sequence &key encode section exclude
[Function]

Arguments and Values:
size                      an integer.
sequence                  a list of items.
encode                    T or NIL. With :encode T (the default) the function transforms OMN repeat
                          symbols (=) into its values, while :encode NIL returns selections
                          unchanged.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

GEN-TRIM will either trim or extend a list to a desired size.

(gen-trim 5 '(1 2 3 4 5 6 6 7 9))
=> (1 2 3 4 5)

(gen-trim 12 '(1 2 3 4 5 6 6 7 9))
=> (1 2 3 4 5 6 6 7 9 1 2 3)

(gen-trim 12 '(c4 g4c5 (g4e5 c4) g3 a3 b3))
=> (c4 g4c5 (g4e5 c4) g3 a3 b3 c4 g4c5 (g4e5 c4) g3 a3 b3)

The function GEN-TRIM also works with lists.

(gen-trim 12 '((3 4) (1 2) (5 3) (5 3)))
=> ((3 4) (1 2) (5 3) (5 3) (3 4) (1 2)
    (5 3) (5 3) (3 4) (1 2) (5 3) (5 3))

If size is a list then each list is trim individualy.

(gen-trim '(12) '((3 4) (1 2) (5 3) (5 3)))
=> ((3 4 3 4 3 4 3 4 3 4 3 4)
    (1 2 1 2 1 2 1 2 1 2 1 2)
    (5 3 5 3 5 3 5 3 5 3 5 3)
    (5 3 5 3 5 3 5 3 5 3 5 3))

(gen-trim '(2 3 12) '((1 2 3) (4 5 6) (6 7 9)))
=> ((1 2) (4 5 6) (6 7 9 6 7 9 6 7 9 6 7 9))

(gen-trim '(12 6) '((1 2 3) (4 5 6) (6 7 9)) :section '(1 2))
=> ((1 2 3) (4 5 6 4 5 6 4 5 6 4 5 6) (6 7 9 6 7 9))
Opusmodus                                                                        gen-trim   2

Examples:
(setf seq-1 (rnd-sample 25 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 897))
=> (gs4 c5 g4 cs4 cs4 fs4 gs4 g4 d4 cs4 g4 d4 g4
    g4 cs4 cs4 fs4 g4 g4 cs4 c5 d4 fs4 g4 g4)

(span seq-1 '(e))
=> (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8
    1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8)

(setf bass-1 (find-everyother 5 seq-1))
=> (gs4 fs4 g4 cs4 c5)

(span bass-1 '(q_q.))
=> (5/8 5/8 5/8 5/8 5/8)

This function is essential to deal with those situations where output cannot be predicted. In
the example below this is certainly the case with the function GEN-CHORD. In the expression
below we need ve chords but GEN-CHORD outputs seven.

(gen-chord 12 3 4 0 0 seq-1 :ambitus '(c3 c5) :seed 31)
=> (gs4c5g4cs4 cs4fs4gs4g4 d4cs4g4 g4cs4 cs4fs4g4 g4cs4c5 d4fs4g4)

This is why GEN-TRIM is used:

(setf
 chord-1
 (gen-trim 5 (gen-chord 12 3 4 0 0 seq-1 :ambitus '(c3 c5) :seed 31)))
=> (gs4c5g4cs4 cs4fs4gs4g4 d4cs4g4 g4cs4 cs4fs4g4)

(span chord-1 '(q. q))
=> (3/8 1/4 3/8 1/4 3/8)

OMN:

(gen-trim 12 '(q c4 mf e d4 e4))
=> (q c4 mf e d4 e4 q c4 e d4 e4 q c4 e d4 e4 q c4 e d4 e4)

(gen-trim '(12 4) '((e c4 mf d4) (e e4 mf s f4 g4)))
=> ((e c4 mf d4 c4 d4 c4 d4 c4 d4 c4 d4 c4 d4)
    (e e4 mf s f4 g4 e e4))
         fi
