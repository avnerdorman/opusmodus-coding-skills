Opusmodus                                                                              gen-mix   1

gen-mix &rest args &key flatten
[Function]

Arguments and Values:
args                       lists of items or omn lists.
flatten                    NIL or T. The default is NIL.


Description:

The function GEN-MIX enables two or more sub-lists to be appended together sequentially.
The result is an interleaving process but instead of retaining the list length, as in the function
GEN-COMBINE, this function extends the list, in effect doubling the list size.

(gen-mix '(c4 d4 e4) '(f4 g4 a4))
=> ((c4 f4) (d4 g4) (e4 a4))

(setf mat1 '((c4 db4) (ab4 f4) (g4 bb4) (a4 eb4) (b4 e4) (d4 gb4)))
(setf mat2 '((db4 ab4) (f4 g4) (bb4 a4) (eb4 b4) (e4 d4) (gb4 c4)))

(gen-mix mat1 mat2)
=> ((c4 db4) (db4 ab4) (ab4 f4) (f4 g4) (g4 bb4) (bb4 a4)
    (a4 eb4) (eb4 b4) (b4 e4) (e4 d4) (d4 gb4) (gb4 c4))

(gen-mix mat1 mat2 :flatten t)
=> ((c4 db4 db4 ab4) (ab4 f4 f4 g4) (g4 bb4 bb4 a4)
    (a4 eb4 eb4 b4) (b4 e4 e4 d4) (d4 gb4 gb4 c4))


Examples:

The example below is taken from the score-script of a toccata-like piano study from the use
of GEN-MIX. See the whole score in the documentation for the function GEN-COLLECT.

(setf sine (gen-sine 36 1 '(0.5 0.2 0.1) :phase 60))
(setf vec (add-sine-waves 4 36 4 0.6 :modulation sine))

(setf mat (vector-to-pitch '(g2 g7) vec))
=> (bb3 gs5 bb6 b6 a6 eb6 c6 bb5 d6 d7 cs7 cs7 gs6 d6
    d5 d6 f4 e4 fs5 gs4 a6 e4 eb7 e7 a5 fs6 f4 eb6 fs4
    cs5 g4 d3 g2 g7 gs6 e6)

(setf divide (gen-divide 6 mat))
=> ((bb3 gs5 bb6 b6 a6 eb6) (c6 bb5 d6 d7 cs7 cs7)
    (gs6 d6 d5 d6 f4 e4) (fs5 gs4 a6 e4 eb7 e7)
    (a5 fs6 f4 eb6 fs4 cs5) (g4 d3 g2 g7 gs6 e6))
Opusmodus                                                       gen-mix   2

(setf div1 (gen-collect 3 divide))
=> ((bb3 gs5 bb6) (c6 bb5 d6) (gs6 d6 d5)
    (fs5 gs4 a6) (a5 fs6 f4) (g4 d3 g2))

(setf div2 (gen-collect 3 divide :rest t))
=> ((b6 a6 eb6) (d7 cs7 cs7) (d6 f4 e4)
    (e4 eb7 e7) (eb6 fs4 cs5) (g7 gs6 e6))

(setf pich1 (randomize-octaves '(g2 b3) div1 :seed 346))
=> ((bb3 gs3 bb2) (c3 bb2 d3) (gs3 d3 d3)
    (fs3 gs3 a2) (a2 fs3 f3) (g3 d3 g3))

(setf pich2 (randomize-octaves '(c4 g7) div2 :seed 245))
=> ((b4 a6 eb5) (d6 cs5 cs5) (d5 f6 e6)
    (e7 eb5 e4) (eb6 fs4 cs6) (g6 gs6 e6))

Finally:

(setf pitch (gen-mix pich1 pich2 :flatten t))
=> ((bb2 gs3 bb2 b4 a6 eb5) (c3 bb3 d3 d6 cs5 cs5)
    (gs3 d3 d3 d5 f6 e6) (fs3 gs3 a3 e7 eb5 e4)
    (a2 fs3 f3 eb6 fs4 cs6) (g3 d3 g3 g6 gs6 e6))

OMN:

(gen-mix '(q c4 p d4 e4) '(e f4 f g4 a4))
=> ((q c4 p e f4 f) (q d4 p e g4 f) (q e4 p e a4 f))

(setf omn1 '((q c4 mp e db4 p) (e ab4 mf f4) (q g4 p bb4)
             (s a4 f eb4) (q b4 mp e4) (e d4 mf gb4)))

(setf omn2 '((s db4 f e ab4 mf) (q f4 p g4) (s bb4 f a4)
             (q eb4 mp b4) (e e4 mf d4) (q gb4 p c4)))

(gen-mix omn1 omn2)
=> ((q c4 mp e db4 p) (s db4 f e ab4 mf) (e ab4 mf f4)
    (q f4 p g4) (q g4 p bb4) (s bb4 f a4) (s a4 f eb4)
    (q eb4 mp b4) (q b4 mp e4) (e e4 mf d4) (e d4 mf gb4) (q gb4 p c4))

(gen-mix omn1 omn2 :flatten t)
=> ((q c4 mp e db4 p s f e ab4 mf) (e ab4 mf f4 q p g4)
    (q g4 p bb4 s f a4) (s a4 f eb4 q mp b4)
    (q b4 mp e4 e mf d4) (e d4 mf gb4 q p c4))
