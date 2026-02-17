Opusmodus                                                                           ambitus-scale   1

ambitus-scale from to sequence &key type section exclude
[Function]

Arguments and Values:
from                      an integer (low high), a pitch symbol (low high) or instrument-name.
to                        an integer (low high), a pitch symbol (low high) or instrument-name.
sequence                  a list or lists of pitches or omn sequence.
type                      :transpose, :invert or :flat-invert.
                          The default is :transpose.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

Returns a sequence of pitches scaled to a given range. The minimum range value is 6
semitones. In the examples below four lists of identical chromatic scales are considered as a
single list.

It might be helpful to see the inner workings of this scaling:

We have 4 lists:

low (gen-cresc 4 7 24) => ( 7 13 18 24)
high (gen-cresc 4 12 36) => (12 20 28 36)

The 1st list ambitus is (7 12) or (g4 c5)
The 2nd list ambitus is (13 20) or (cs5 gs5)
The 3rd list ambitus is (19 28) or (g5 e6)
The 4th list ambitus is (24 36) or (c6 c7)

Using this function the composer can produce elaborate 'range waves' of pitches and
dynamics. Note that ambitus range integers such as '(7 12) can be used instead of pitches
'(g4 c5). Remember ambitus integer 0 is equivalent to c4.
Opusmodus                                                  ambitus-scale   2

Examples:
(setf pitch
      (gen-repeat 4 '((c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4))))

(ambitus-scale '(g4 c5) '(c6 c7) pitch)
=> ((c5 a4 gs4 g4 a4 bb4 a4 g4 gs4 a4 bb4 b4)
    (fs5 cs5 d5 eb5 e5 f5 fs5 g5 gs5 eb5 d5 cs5)
    (c6 cs6 d6 eb6 e6 g5 c6 g5 gs5 a5 bb5 b5)
    (c6 cs6 d6 eb6 e6 f6 fs6 g6 gs6 a6 bb6 b6))


(ambitus-scale 'piccolo '(-30 -12) pitch)
=> ((c5 cs5 d5 eb5 e5 f5 fs5 g5 gs5 a5 bb5 b5)
    (c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
    (c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a3 bb3 b3)
    (c3 cs2 d2 eb2 e2 f2 fs2 g2 gs2 a2 bb2 b2))

Using OMN list form:

(setf mat
     (gen-repeat 4 '((s c4 mf cs4 d4 eb4
                      t e4 f4 fs4 g4 gs4 a4 bb4 b4))))

(ambitus-scale '(c6 c7) '(g4 c5) mat)
=> ((s c6 mf cs6 d6 eb6 t e6 f6 fs6 g6 gs6 a6 bb6 b6)
    (s c6 mf cs6 d6 eb6 t e6 g5 c6 g5 gs5 a5 bb5 b5)
    (s fs5 mf cs5 d5 eb5 t e5 f5 fs5 g5 gs5 eb5 d5 cs5)
    (s c5 mf a4 gs4 g4 t a4 bb4 a4 g4 gs4 a4 bb4 b4))

(ambitus-scale '(20 30) '(-5 12) mat :section '(0 3))
=> ((s c6 mf cs6 d6 eb6 t e6 f6 fs6 f6 gs5 a5 bb5 b5)
    (s c4 mf cs4 d4 eb4 t e4 f4 fs4 g4 gs4 a4 bb4 b4)
    (s c4 mf cs4 d4 eb4 t e4 f4 fs4 g4 gs4 a4 bb4 b4)
    (s c4 mf cs4 d4 eb4 t e4 f4 fs4 g4 gs4 a4 bb4 b4))
