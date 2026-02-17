Opusmodus                                                                         chord-interval-add   1

chord-interval-add interval pitch &key chord section exclude
[Function]

Arguments and Values:
interval                  lists of intervals.
pitch                     lists of pitches.
chord                     NIL or T. If NIL then chord is omitted. The default is T.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

The function CHORD-INTERVAl-ADD returns new list of pitches adding a required
interval to each pitch or chord.

(chord-interval-add '(4 3 6 4) '(c4 b3 g4 ab4))
=> (c4e4 b3d4 g4cs5 ab4c5)

It is particularly valuable when writing for solo instruments such as the piano, harp, mallet
percussion or guitar as it avoids working in separate parts and then mixing. For examples of
its use see the scores for solo piano of Stages 20 and 24 in the Tutorial Guide.

(setf pitches '(c4 cs4 fs4 g4 c5))
(setf p-seq (gen-repeat 5 (list pitches)))

(setf lhp-pause
      (gen-pause
       (chord-interval-add
        '((5 6 7 5) (4 8 9 7) (3 5 6 7))
        (gen-retrograde (pitch-transpose -24 p-seq)))
       :section '(1 3)))
Opusmodus                                                              chord-interval-add    2

Examples:

The examples below illustrate many extra possibilities this function allows. These include
adding extra intervals to existing chords or indeed avoiding adding further pitches to
passages that include melodies and chords.

(chord-interval-add
 '((4 3) (6 4))
 '((c4 d4 e4 fs4) (c5 b4 fs4 c4) (c3 b4 g4 gs4)))

=> ((c4e4 d4f4 e4gs4 fs4a4)
    (c5fs5 b4ds5 fs4c5 c4e4)
    (c3e3 b4d5 g4b4 gs4b4))
(chord-interval-add
 '(4 3 6 4)
 '(c4 cs4g5 fs4 g4db5 c5ab4 f5 fs5d4 b5a3))
=> (c4e4 cs4g5as5 fs4c5 g4db5f5 c5ab4 f5gs5 fs5d4gs4 b5a3cs4)

In this example the :chords are omitted:

(chord-interval-add
 '(4 3 6 4)
 '(c4 cs4g5 fs4 g4db5 c5ab4 f5 fs5d4 b5a3) :chord nil)
=> (c4e4 cs4g5 fs4c5 g4db5 c5ab4 f5gs5 fs5d4 b5a3)
