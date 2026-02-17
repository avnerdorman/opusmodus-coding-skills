Opusmodus                                                                     gen-repeat-seq     1

gen-repeat-seq number low high sequence &key prob encode
                         section exclude seed

[Function]

Arguments and Values:
number                   an integer or list of integers.
low                      an integer (sequential repeat ratio).
high                     an integer (sequential repeat ratio).
sequence                 a lists of items or omn sequence.
encode                   T or NIL. With :encode T (the default) the function transforms OMN repeat
                         symbols (=) into its values, while :encode NIL returns selections
                         unchanged.
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or T. The default is NIL.


Description:

This function generates lists of a given list of numbers with sequential repeat ratio low
and high.

(gen-repeat-seq 12 1 3 '(c4 cs4 d4 eb4))
=> (c4 c4 c4 cs4 cs4 cs4 d4 d4 eb4 eb4 eb4 c4)

We can also change the ratio in which a value in a sublist is repeated, so here we have a 1:2
ratio of repeated values.

(gen-repeat-seq
 12 1 2 '((c4 cs4 d4 eb4) (e4 f4 fs4 g4) (gs4 a4 bb4 b4)))
=> ((c4 cs4 cs4 d4 eb4 eb4 c4 cs4 d4 d4 eb4 eb4)
    (e4 e4 f4 fs4 fs4 g4 g4 e4 e4 f4 f4 fs4)
    (gs4 a4 bb4 bb4 b4 b4 gs4 gs4 a4 bb4 b4 gs4))
                    fl
Opusmodus                                                                     gen-repeat-seq   2

Examples:

With using very short motifs it's possible to extend the content of the list by looping.

(gen-repeat-seq
 '(4 6 8) 1 1 '((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4)))
=> ((c4 cs4 c4 cs4)
    (cs4 c4 d4 cs4 c4 d4)
    (cs4 c4 cs4 d4 cs4 c4 cs4 d4))

These pitches used above are the MIDI pitches for congas and bongos.

OMN:

(gen-repeat-seq 8 1 3 '(q c4 mf e cs4 s d4 s eb4))
=> (q c4 mf e cs4 cs4 cs4 s d4 d4 d4 eb4)

(gen-repeat-seq
 '(5 2 7 1) 1 2
 '((q c4d4e4f4 p) (s c4 mp fs4)
   (e c4d4e4f4 f) (e c4 fs4 fs4) (e c4d4e4f4 p)))
=> ((q c4d4e4f4 p c4d4e4f4 c4d4e4f4 c4d4e4f4 c4d4e4f4)
    (s c4 mp fs4)
    (e c4d4e4f4 f c4d4e4f4 c4d4e4f4 c4d4e4f4 c4d4e4f4 c4d4e4f4 c4d4e4f4)
    (e c4 f)
    (e c4d4e4f4 p c4d4e4f4 c4d4e4f4 c4d4e4f4 c4d4e4f4))
