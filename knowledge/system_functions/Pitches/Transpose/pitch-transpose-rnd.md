Opusmodus                                                                    pitch-transpose-rnd       1

pitch-transpose-rnd count transpose sequence
                                    &key section exclude ambitus omn seed

[Function]

Arguments and Values:
count                     number of chosen pitches - can be a list.
transpose                 Integer or pitch, can be a list.
sequence                  list or lists of pitches.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.
seed                      NIL or an integer. The default is NIL.


Description:

The function PITCH-TRANSPOSE-RND will transpose a given number of randomly
selected pitches in a list by a speci ed value or values.

(pitch-transpose-rnd 2 12 '(c4 c4 c4 c4 c4 c4 c4))
=> (c4 = = = c3 c5 c4)

Note that the transposition may go both up and down. When working with lists each count
and transpose value applies to the list as a whole. So in the following example, the rst
list will have one value transposed +/- 7 semitones, the second list will have two values
transposed +/- an octave:

(pitch-transpose-rnd
 '(1 2) '(7 12) '((c4 c4 c4 c4) (c4 c4 c4 c4)))
=> ((c4 = f3 c4) (c3 c4 c3 c4))

If there are more lists than values then the sequence will be repeated:

(pitch-transpose-rnd
 '(1 2) '(7 12) '((c4 c4 c4 c4) (c4 c4 c4 c4) (c4 c4 c4 c4)))
=> ((c4 f3 c4 =) (c4 c5 c4 c3) (c4 = = g4))
                            fi
                                                                                         fi
Opusmodus                                             pitch-transpose-rnd   2

Examples:

Transpose three pitches in each list by an octave:

(pitch-transpose-rnd 3 12 '((c4 c4 c4 c4) (c4 c4 c4 c4)))
=> ((c3 c4 c5 c3) (c3 c4 c3 c5))



Process only selected sublists:

(pitch-transpose-rnd
 '(1 2) '(7 12) '((c4 c4 c4 c4) (c4 c4 c4 c4) (c4 c4 c4 c4))
 :section '(0 2))
=> (((c4 = f3 c4) (c4 = = =) (c4 = f3 c4))

(pitch-transpose-rnd
 '(1 2) '(7 12)
 '((q c4 c4 c4 c4) (q c4g4 c4 c4g4 c4) (e c4 c4g4 c4 c4e4g4))
 :section '(0 2))
=> ((q c4 g4 c4 =) (q c4g4 c4 c4g4 c4) (e c4 c4g4 c4 g4b4d5))

Microtonal transposition:
0.5 = 1/4 tone
0.25 = 1/8 tone

(pitch-transpose-rnd 2 6.5 '(q a4 a4+ as4 as4+ b4 b4- bb4 bb4- a4))
=> (q a4 a4+ e5+ b4- b4 b4- e4- a4+ a4)
