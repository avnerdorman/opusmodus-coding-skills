Opusmodus                                                                                        respell   1

respell sequence &key type section exclude
[Function]

Arguments and Values
sequence                  a pitch or omn-form sequence.
type                      :chord or :direction. The default both are active.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description

RESPELL function can be used to change the pitch name of chord clusters to avoid the
identical note names that produce con icts in notation display. The function will also respell
ascending pitch sequences to sharps and ats when pitches descend.

(respell '(c4cs4))
=> (c4db4)

(respell '(c4 db4 d4 eb4 e4 f4 gb4 g4 ab4 a4 bb4 b4 c5))
=> (c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4 c5)

(respell '(c5 b4 as4 a4 gs4 g4 fs4 f4 e4 ds4 d4 cs4 c4))
=> (c5 b4 bb4 a4 ab4 g4 gb4 f4 e4 eb4 d4 db4 c4)

(respell '((c4 db4d4 eb4 e4 f4) (gb4g4 ab4 a4 bb4 b4)))
=> ((c4 cs4d4 ds4 e4 f4) (fs4g4 gs4 a4 as4 b4))

The two keywords under :type are :chord and :direction. Both are active and will
sense chord or scalic passages. If you want to choose just one :type, for example :chord
so clusters are respelled but the directional respell is left alone, then
indicate :type :chord. See example below.
                                 fl
                                      fl
Opusmodus                                                                      respell   2

Examples

With :type :chord:

(respell
 '((c4 db4d4 eb4 e4 f4) (gb4g4 ab4 a4 bb4 b4)) :type :chord)
=> ((c4 cs4d4 eb4 e4 f4) (fs4g4 ab4 a4 bb4 b4))

With :type :direction:

(respell '((c4 db4d4 eb4 e4 f4) (gb4g4 ab4 a4 bb4 b4))
         :type :direction)
=> ((c4 cs4d4 ds4 e4 f4) (gb4g4 gs4 a4 as4 b4))

OMN:

(respell '((-e c4cs4fs4 mp - fs4g4c5 c4cs4fs4)
           (e fs4g4c5 c4cs4fs4 - fs4g4c5 -)
           (e c4cs4fs4 fff fs4g4c5 c4cs4fs4 - fs4g4c5)
           (-e c4cs4fs4 fs4g4c5 c4cs4fs4 fs4g4c5)))
=> ((-e c4db4fs4 mp - fs4g4c5 c4db4fs4)
    (e fs4g4c5 c4db4fs4 - fs4g4c5 -)
    (e c4db4fs4 fff fs4g4c5 c4db4fs4 - fs4g4c5)
    (-e c4db4fs4 fs4g4c5 c4db4fs4 fs4g4c5))

(respell '((e c3 mp g2 fs2 cs2 c2 tie)
           (e c2 mp cs2 fs2 g2 c3 tie)
           (e c3 mp g2 fs2 cs2 c2 tie)
           (e c2 mp cs2 fs2 g2 c3 tie)
           (e c3 mp g2 fs2 cs2 c2)))
=> ((e c3 mp g2 gb2 db2 c2 tie)
    (e c2 mp cs2 fs2 g2 c3 tie)
    (e c3 mp g2 gb2 db2 c2 tie)
    (e c2 mp cs2 fs2 g2 c3 tie)
    (e c3 mp g2 gb2 db2 c2))

To see RESPELL in action go to Tutorial Guide, Stage-29 and respell both of the piano
parts.
