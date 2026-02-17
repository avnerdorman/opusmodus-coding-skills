Opusmodus                                                                         pitch-transpose      1

pitch-transpose transpose sequence &key section exclude ambitus omn
[Function]

Arguments and Values:
transpose                 integer or pitch, can be a list.
sequence                  a list or list of pitches.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
seed                      NIL or an integer. The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The function PITCH-TRANSPOSE can be used to transpose pitch values in either pitch
lists or OMN notation.

A simple example:

(pitch-transpose 2 '(c4 d4 e4))
=> (d4 e4 gb4)

A pitch can also be used instead of an integer, the pitch equivalent of the above being:

(pitch-transpose 'd4 '(c4 d4 e4))
=> (d4 e4 gb4)


Examples:

Transpose multiple lists with the same value:

(pitch-transpose 2 '((c4 d4 e4) (d4 e4 f4) (e4 f4 g4)))
=> ((d4 e4 gb4) (e4 gb4 g4) (gb4 g4 a4))

Transpose multiple lists with multiple values:

(pitch-transpose
 '(7 -5 -12) '((c4 d4 e4) (d4 e4 f4) (e4 f4 g4)))
=> ((g4 a4 b4) (a3 b3 c4) (e3 f3 g3))
Opusmodus                                                pitch-transpose   2

Transpose only selected sublists:

(pitch-transpose '(7 -5 -12) '((c4 d4 e4) (d4 e4 f4) (e4 f4 g4))
                 :section '(0 2))
=> ((g4 a4 b4) (d4 e4 f4) (e3 f3 g3))

(pitch-transpose '(7 -5 -12)
                 '((e c4 q d4 e e4)
                   (q d4 e e4 f4)
                   (e e4 f4 q g4))
                 :section '(0 2))
=> ((e g4 q a4 e b4) (q d4 e e4 f4) (e e3 f3 q g3))

Microtonal transposition:
0.5 = 1/4 tone
0.25 = 1/8 tone

(pitch-transpose 2.5 '(q a4 a4+ as4 as4+ b4 b4- bb4 bb4- a4))
=> (q b4+ c5 c5+ cs5 cs5+ cs5 c5+ c5 b4+)
