Opusmodus                                                                     pitch-transpose-n       1

pitch-transpose-n transpose sequence &key section exclude
                               ambitus omn

[Function]

Arguments and Values:
transpose                integer or pitch, can be a list.
sequence                 list or lists of pitches.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
ambitus                  instrument name or an integer or pitch list (low high). The default is 'piano.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The function PITCH-TRANSPOSE-N will apply a sequence of transpositions on each
individual pitch in a list.

(pitch-transpose-n '(0 2) '(c4 c4 g4 g4))
=> (c4 d4 g4 a4)

(pitch-transpose-n '(d5 e5) '(c4 c4 g4 g4))
=> (d5 e5 a5 b5)

As in PITCH-TRANSPOSE, the transposition values can either be integers or pitch values.


Examples:

Transpose multiple lists with a sequence:

(pitch-transpose-n
 '(0 2) '((c4 c4 g4 g4) (d4 d4 a4 a4) (e4 e4 b4 b4)))
=> ((c4 d4 g4 a4) (d4 e4 a4 b4) (e4 gb4 b4 db5))

Transpose only selected sublists:

(pitch-transpose-n '(0 2) '((c4 c4 g4 g4)
                            (d4 d4 a4 a4)
                            (e4 e4 b4 b4))
                   :section '(0 2))
=> ((c4 d4 g4 a4) (d4 d4 a4 a4) (e4 gb4 b4 db5))
Opusmodus                                               pitch-transpose-n   2

(pitch-transpose-n '(-5 7) '((q c4 e c4 g4 q g4)
                             (e d4 d4 q a4 a4)
                             (q e4 e4 e b4 b4))
                   :section '(0 2))
=> ((q g3 e g4 d4 q d5) (e d4 d4 q a4 a4) (q b3 b4 e gb4 gb5))
Microtonal transposition:
0.5 = 1/4 tone
0.25 = 1/8 tone

(pitch-transpose-n '(0.5 13.5) '(q a4 a4+ as4 as4+ b4 b4- bb4 bb4- a4))
=> (q a4+ b5 b4- c6 b4+ c6 b4- b5 a4+)
