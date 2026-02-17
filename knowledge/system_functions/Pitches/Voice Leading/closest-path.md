Opusmodus                                                                           closest-path     1

closest-path sequence &key start ambitus ambitus-chord
                     section exclude

[Function]

Arguments and Values:
sequence                a sequence of pitches or omn form list.
start                   NIL or chord. The default is NIL ( rst chord of the sequence).
ambitus                 instrument name or an integer or pitch list (low high). The default is 'piano.
ambitus-chord           chord size. The default is NIL (no ambitus).
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

The function CLOSEST-PATH returns a series of chords taking the closest path to the
previous chord.


Examples:
(closest-path '(b4g4e4c4 c5a4e4f4 b4a4f4d4 b4g4e4d4))




(closest-path '(c4e4g4 c5e5a5 e5fs5a5b5 d5f5bb5d6 g4c5d5f5))




(closest-path '(c4e4g4 c5e5a5 e5fs5a5b5 d5f5bb5d6 g4c5d5f5)
              :start ‘c3eb4f5d5)
                                                   fi
Opusmodus                                                   closest-path   2

(closest-path '(g5 cs3f3bb3gs4c5d5 fs5 a5b5eb6e6g2 cs3f3bb3gs4
                c5 d5fs5a5b5 eb6e6g2cs3 f3 bb3gs4c5 d5fs5a5
                b5eb6e6g2cs3f3 bb3 gs4c5d5fs5 a5b5 eb6e6g2cs3f3
                bb3gs4c5d5 fs5 a5b5eb6e6g2cs3 f3bb3gs4 c5
                d5fs5a5b5 eb6 e6g2cs3f3))




(closest-path '(g5 cs3f3bb3gs4c5d5 fs5 a5b5eb6e6g2 cs3f3bb3gs4
                c5 d5fs5a5b5 eb6e6g2cs3 f3 bb3gs4c5 d5fs5a5
                b5eb6e6g2cs3f3 bb3 gs4c5d5fs5 a5b5 eb6e6g2cs3f3
                bb3gs4c5d5 fs5 a5b5eb6e6g2cs3 f3bb3gs4 c5
                d5fs5a5b5 eb6 e6g2cs3f3)
              :start ‘c3eb4f5d6)
Opusmodus                                              closest-path   3

(closest-path '((eb3f3a3 f3a3b3 g3bb3cs4 e3g3bb3)
                (g4bb4cs5 bb4cs5e5 b4eb5f5 a4b4eb5)
                (b3eb4f4 eb4f4a4 e4fs4bb4 c4e4fs4)))




(closest-path '((eb3f3a3 f3a3b3 g3bb3cs4 e3g3bb3)
                (g4bb4cs5 bb4cs5e5 b4eb5f5 a4b4eb5)
                (b3eb4f4 eb4f4a4 e4fs4bb4 c4e4fs4))
              :start '(c3eb4 f5d5 eb4f5))
