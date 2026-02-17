Opusmodus                                                                 pitch-transpose-start       1

pitch-transpose-start transpose sequence
                                      &key section exclude ambitus omn

[Function]

Arguments and Values:
transpose                integer or pitch, can be a list (start transposition).
sequence                 a list or list of pitches.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
ambitus                  instrument name or an integer or pitch list (low high). The default is 'piano.
seed                     NIL or an integer. The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

Use this function to apply a start transposition across pitch sequence.

(setf mel-series (gen-divide
                  (rnd-sample 7 '(2 3 4 5))
                  (rnd-sample 24 '(c4 cs4 d4 fs4 g4 gs4))))
=> ((gs4 c4) (d4 fs4 d4 cs4 cs4) (g4 g4)
    (cs4 d4) (d4 fs4 g4 g4 g4) (d4 fs4 gs4)
    (d4 d4 d4) (cs4 c4))

(pitch-transpose-start (rnd-sample 7 '(12 0 3 7 5)) mel-series)
=> ((eb4 g3) (eb4 g4 eb4 d4 =) (c4 =) (g4 ab4)
   (f4 a4 bb4 = =) (g4 b4 db5) (c4 = =) (eb4 d4))

Use a pitch symbol (ex g4 or cs5) or an integer represent a value based on 0 as c4 (ex. 1 -
cs4 or 3 - eb4). This means that the composer might apply random-generated
transpositions to a list of pitch phrases.

(pitch-transpose-start (rnd-sample 7 '(12 0 3 7 5)) mel-series)
=> ((g4 =) (eb4 d4 a3 ab3 d4) (g4 c5 g4 d5 =)
    (f4 b4) (c5 f4 c5 gb4) (c4 = ab3 g3) (eb4 a4))



Examples:
(pitch-transpose-start 'd4 '(gs4b4 c4 d4 e4))
=> (d4f4 gb3 ab3 bb3)
Opusmodus                                                          pitch-transpose-start      2

(pitch-transpose-start 3 '(d4 cs4 d4 = c4cs4))
=> (eb4 d4 eb4 = db4d4)

In the above example the integer represents a value based on 0 as c4, thus 3 is eb4.

(pitch-transpose-start '(ds4 c4) '((d4 cs4 d4 c4cs4) (gs4b4 c4 d4 e4)))
=> ((eb4 d4 eb4 db4d4) (c4eb4 e3 gb3 ab3))

(pitch-transpose-start '(0 1) '((gs4b4 c4 d4 e4) (gs4b4 c4 d4 e4)))
=> ((c4eb4 e3 gb3 ab3) (db4e4 f3 g3 a3))

In the above example the integer represents a value based on 0 as c4, thus 0 is c4 and 1 is
cs4.

(pitch-transpose-start
 '(gb5 d4)
 '((gs4b4 c4 d4 = = e4)
   (gs4b4 = = c4 d4 e4)
   (gs4b4 cs4 = = d4 eb4)
   (g5 gs5 a4 = = as5))
 :section '(0 3))
=> ((gb5a5 bb4 c5 = = d5) (gs4b4 = = c4 d4 e4)
    (gs4b4 cs4 = = d4) (d4 eb4 e3 = = f4))

In the above example the argument :section tells us that only the rst and fourth sections
are transposed. Remember the :section integers count from zero.

Microtonal transposition:
0.5 = 1/4 tone
0.25 = 1/8 tone

(pitch-transpose-start 2.5 '(q a4 a4+ as4 as4+ b4 b4- bb4 bb4- a4))
=> (q d4+ eb4 e4- e4 e4+ e4 e4- eb4 d4+)
                                                              fi
