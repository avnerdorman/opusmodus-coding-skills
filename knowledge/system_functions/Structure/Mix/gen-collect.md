Opusmodus                                                                               gen-collect   1

gen-collect number sequence &key remain
[Function]

Arguments and Values:
number                   a number of collected items.
sequence                 lists of items.
remain                   NIL or T. If T the remain of the lists is returned. The default is NIL.


Description:

The function GEN-COLLECT makes it possible for n items from a list to be collected
incrementally and placed in a new list, and the remaining items collected and placed in
another list.

(setf pitches '(c4 d4 e4 f4 g4 a4 b4 c5))

(gen-collect 3 pitches)
=> (c4 d4 e4)

(gen-collect 3 pitches :remain t)
=> (f4 g4 a4 b4 c5)



Examples:
(setf mat '((c4 db4 ab4 f4 g4 bb4) (a4 eb4 b4 e4 d4 gb4)
            (db4 ab4 f4 g4 bb4 a4) (eb4 b4 e4 d4 gb4 c4)))

(gen-collect 3 mat)
=> ((c4 db4 ab4) (a4 eb4 b4)
    (db4 ab4 f4) (eb4 b4 e4))

(gen-collect 3 mat :remain t)
=> ((f4 g4 bb4) (e4 d4 gb4)
    (eb4 b4 e4) (d4 gb4 c4))

(gen-collect '(1 2 3 2) mat)
=> ((c4) (a4 eb4) (db4 ab4 f4) (eb4 b4))

(gen-collect '(1 2 3 2) mat :remain t)
=> ((db4 ab4 f4 g4 bb4) (b4 e4 d4 gb4)
    (g4 bb4 a4) (e4 d4 gb4 c4))
Opusmodus                                                                 gen-collect    2

OMN:

(setf omn '((q c4 mp 3q ds4 e4 f4 e ab4 f4 p g4 bb4)
            (e a4 f eb4 s b4 mp e4 d4 gb4)
            (s db4 mf ab4 f4 g4 e bb4 a4)
            (e eb4 f b4 e4 d4 q gb4 p c4)))

(gen-collect 3 omn)
=> ((q c4 mp 3q ds4 mp e4 f4 e ab4 mp) (e a4 f e eb4 f s b4 mp)
    (s db4 s ab4 s f4) (e eb4 f e b4 f e e4 f))

(gen-collect 3 omn :remain t)
=> ((e f4 p e g4 p e bb4 p) (s e4 mp s d4 mp s gb4 mp)
    (s g4 e bb4 e a4) (e d4 f q gb4 p q c4 p))

The example below demonstrates how you might build a toccata-like piano study from the
use of GEN-COLLECT. The DEF-SCORE keyword :layout is used to enable beaming
across treble and bass staves when a single input is used.

(setf sine (gen-sine 120 1 '(0.5 0.2 0.1) :phase 60))
(setf vec (add-sine-waves 4 120 4 0.6 :modulation sine))
(setf mat (vector-to-pitch '(g2 g7) vec))

(setf divide (gen-divide 6 mat))
(setf div1 (gen-collect 3 divide))
(setf div2 (gen-collect 3 divide :remain t))

(setf pich1 (rnd-octaves '(g2 b3) div1))
(setf pich2 (rnd-octaves '(c4 g7) div2))

(setf pitch (gen-mix pich1 pich2))
(setf length (span pitch '(s)))
(setf velocity (rnd-sample 120 '(pp mp mf ff)))

(setf omn (make-omn
           :length length
           :pitch pitch
           :velocity velocity))

(def-score grand
           (:key-signature '(c maj)
            :time-signature '(3 8)
            :tempo 130
            :layout (grand-layout 'pno))

 (pno :omn omn
      :channel 1
      :sound 'gm
      :program 0))
