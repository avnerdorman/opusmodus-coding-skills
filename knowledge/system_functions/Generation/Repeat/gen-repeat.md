Opusmodus                                                                          gen-repeat    1

gen-repeat number sequence &key encode section exclude

[Function]

Arguments and Values:
number                   an integer or list of integers.
sequence                 a list of items or omn sequence.
encode                   T or NIL. With :encode T (the default) the function transforms OMN repeat
                         symbols (=) into its values, while :encode NIL returns selections
                         unchanged.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function returns any number of repeats of a list or atom.

(gen-repeat 3 'c4)
=> (c4 c4 c4)

(gen-repeat 3 '(c4 d4))
=> (c4 d4 c4 d4 c4 d4)


Examples:

The repeat sign is probably the best example of an algorithm in MusicXML. It is a musical
sign in notation that 'does' something.

(gen-repeat 3 '((c4 g4) (c4 a4)))
=> ((c4 g4) (c4 a4) (c4 g4) (c4 a4) (c4 g4) (c4 a4))

If number is a list then each list is repeat individually.

(gen-repeat '(3) '((c4 g4) (c4 a4)))
=> ((c4 g4 c4 g4 c4 g4) (c4 a4 c4 a4 c4 a4))

(gen-repeat '(2 3) '((c4 g4) (c4 a4)))
=> ((c4 g4 c4 g4) (c4 a4 c4 a4 c4 a4))


(gen-repeat '(3 2) '((c4 g4) (c4 a4) (b4 d5 fs5))
            :section '(1 2))
=> ((c4 g4) (c4 a4 c4 a4 c4 a4) (b4 d5 fs5 b4 d5 fs5))
Opusmodus                                                                         gen-repeat   2

(gen-chord 13 1 3 0 0
 (gen-repeat 4 (list '(c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)))
 :ambitus '(-25 12) :seed 45)
=> ((c4 cs4d4eb4 e4f4fs4 g4gs4a4 bb4b4)
    (c4 cs4d4eb4 e4f4 fs4g4 gs4a4 bb4b4)
    (c4 cs4d4 eb4e4 f4fs4 g4gs4 a4 bb4 b4)
    (c4cs4 d4eb4 e4 f4fs4 g4gs4a4 bb4 b4))

The example below uses the Slonimsky #11 pattern with GEN-CHORD.

(setf sl-11 '(c4 cs4 d4 fs4 g4 gs4 c5))

(gen-chord 12 1 2 0 0 (gen-repeat 4 sl-11)
           :ambitus '(c3 c4) :seed 45)
=> (c4cs3 fs3 g3gs3 c4 c4 cs3 fs3 g3 gs3c4
    c4cs3 fs3g3 gs3 c4 c4 cs3 fs3g3 gs3c4)

This function can be used to produce a lot of material very quickly. It's invaluable for
creating percussion parts that often use only a few notes as source material.

(setf
  c-1 '(c4 cs4)
  c-2 '(cs4 c4 d4)
  c-3 '(cs4 c4 cs4 d4)
  b-1 '(ds4 e4)
  b-2 '(ds4 e4 ds4)
  b-3 '(e4 = ds4 e4)
)

These pitches used above are the MIDI pitches for congas and bongos.

(setf perc-solo (apply-eval (gen-repeat '(1 2 1 3) '(b-1 c-1 c-2 b-2))))
=> ((ds4 e4) (c4 cs4 c4 cs4) (cs4 c4 d4)
    (ds4 e4 ds4 ds4 e4 ds4 ds4 e4 ds4))

OMN:

(gen-repeat 3 '(s c4 q d4))
=> (s c4 mf q d4 s c4 q d4 s c4 q d4)

(gen-repeat '(3) '(q c4 d4 e4 f4 g4 a4))
=> ((q c4 mf c4 c4) (q d4 mf d4 d4) (q e4 mf e4 e4)
    (q f4 mf f4 f4) (q g4 mf g4 g4) (q a4 mf a4 a4))

(gen-repeat 3 '((q c4 g4) (s c4 a4)))
=> ((q c4 mf g4) (s c4 mf a4) (q c4 mf g4)
    (s c4 mf a4) (q c4 mf g4) (s c4 mf a4))
Opusmodus                                                    gen-repeat   3

(gen-repeat '(3) '((q c4 e g4) (s c4 a4) (e b4 d5 q fs5)))
=> ((q c4 mf e g4 q c4 e g4 q c4 e g4)
    (s c4 mf a4 c4 a4 c4 a4)
    (e b4 mf d5 q fs5 e b4 d5 q fs5 e b4 d5 q fs5))

(gen-repeat '(3 2) '((q c4 g4) (s c4 a4) (e b4 d5)))
=> ((q c4 mf g4 c4 g4 c4 g4)
    (s c4 mf a4 c4 a4)
    (e b4 mf d5 b4 d5 b4 d5))
