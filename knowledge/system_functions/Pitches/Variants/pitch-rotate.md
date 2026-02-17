Opusmodus                                                                         pitch-rotate     1

pitch-rotate rotation-number sequence &key chord
                   section exclude ambitus

[Function]

Arguments and Values:
rotation-number       a number or list of numbers.
sequence              list of pitches.
chord                 NIL or T (chord rotation). The default is T.
ambitus               instrument name or an integer or pitch list (low high). The default is 'piano.
section               an integer or list of integers. Selected list or lists to process.
                      The default is NIL.
exclude               an integer or list of integers. Excluded list or lists from process.
                      The default is NIL.


Description:

The function PITCH-ROTATE employs chordal rotation based on a rotation-number
value.

(pitch-rotate 1 '(c4 d4 e4 f4 g4 a4 b4))
=> (d4 e4 f4 g4 a4 b4 c5)

(pitch-rotate 2 '(c4 d4 e4 f4 g4 a4 b4))
=> (e4 f4 g4 a4 b4 c5 d5)

(pitch-rotate 1 '(c4e4g4 d4f4 e4g4))
=> (d4f4 e4g4 e4g4c5)

(pitch-rotate 2 '(c4e4g4 d4f4 e4g4))
=> (e4g4 e4g4c5 f4d5)

Without rotation on the chords :chord NIL

(pitch-rotate 2 '(c4e4g4 d4f4 e4g4) :chord nil)
=> (e4g4 c5e5g5 d5f5)
Opusmodus                                                   pitch-rotate   2

Examples:
(setf seq '((a4 a4bb4g4d5 bb4 d5c5bb4a4c5 a4)
            (bb4a4g4c5 g4 bb4a4g4a4 d5 bb4a4g4)
            (d5c5bb4a4c5 d5 bb4a4g4c5 c5 bb4a4g4g4)))

(pitch-rotate '(1 2 -3) seq)
=> ((a4bb4g4d5 bb4 d5c5bb4a4c5 a4 a5)
    (bb4a4g4a4 d5 bb4a4g4 a4g4c5bb5 g5)
    (c4bb4a4g4 c4 g3bb4a4g4 d5c5bb4a4c5 d5))

(pitch-rotate '(1 2 -3) seq :chord nil)
=> ((a4bb4g4d5 bb4 d5c5bb4a4c5 a4 a5)
    (bb4a4g4a4 d5 bb4a4g4 bb5a5g5c6 g5)
    (bb3a3g3c4 c4 bb3a3g3g3 d5c5bb4a4c5 d5))

(pitch-rotate '(1 2 -3 3) (append seq seq) :section '(0 2 3 5))
=> ((a4bb4g4d5 bb4 d5c5bb4a4c5 a4 a5)
    (bb4a4g4c5 g4 bb4a4g4a4 d5 bb4a4g4)
    (c4bb4a4g4 c4 g3bb4a4g4 d5c5bb4a4c5 d5)
    (d5c5bb4a4c5 a4 a5 bb4g4d5a5 bb5)
    (bb4a4g4c5 g4 bb4a4g4a4 d5 bb4a4g4)
    (bb4a4g4c5 c5 bb4a4g4g4 c5bb4a4c5d6 d6))

(pitch-rotate
 (rnd-sample 6 (gen-integer -6 6))
 '((q a4bb4g4d5 e bb4 = q d5c5bb4a4c5 e a4 a5)
   (q bb4a4g4c5 e g4 q bb4a4g4a4 e d5 q bb4a4g4)
   (q c4bb4a4g4 e c4 = q g3bb4a4g4 d5c5bb4a4c5 e d5)
   (q d5c5bb4a4c5 e a4 a5 q bb4g4d5a5 e bb5)
   (q bb4a4g4c5 e g4 q bb4a4g4a4 e d5 q bb4a4g4)
   (q bb4a4g4c5 e c5 q bb4a4g4g4 c5bb4a4c5d6 e d6)))

=> ((q d4a4bb4g4 e bb3 bb3 q c4d5c5bb4a4 e a3 a4)
    (q a4g4c5bb5 e g5 q a4g4a4bb5 e d6 q a4g4bb5)
    (q d5c5bb4a4c5 e d5 bb4a4g4c5 q c5 c5 e bb4a4g4g4)
    (q c4d5c5bb4a4 e a3 a4 q a4bb4g4d5 e bb4)
    (q c4bb4a4g4 e g3 q a3bb4a4g4 e d4 q g3bb4a4)
    (q c4 e g3bb4a4g4 q d5c5bb4a4c5 d5 e bb4a4g4c5))
