Opusmodus                                                                 assemble-section      1

assemble-section prefix sequence
[Function]

Arguments and Values:
prefix                    a symbol.
sequence                  a sequence.


Description:

The function ASSEMBLE-SECTION uses a list of numerical or alphabetical symbols to
enable the structuring of variables. It is particularly suited to assembling collage-like
structures of note-length, pitch, and velocity where it is necessary for these different
parameters to align. In the example below the variable list of note-lengths is created with a
'x prefix (the pre x can be any symbol).

(setf xa '(e e)
      xb '(-e e)
      xc '(-e s e.)
      xd '(-s e s)
      xe '(s s s s s s)
      xf '(-e s s -e))

(setf seq (rnd-sample 12 '(a b c d e f) :seed 2346))
=> (b c c b c a f a b c e d)

(assemble-section 'x seq)
=> '((-e e) (-e s e.) (-e s e.) (-e e) (-e s e.) (e e)
     (-e s s -e) (e e) (-e e) (-e s e.) (s s s s s s) (-s e s))

The alphabetical / symbolic structuring can be entered by hand, by a random process (as
above) or by the generation of a wave form.

(vector-map '(a b c d e f g) (gen-sine 24 1 0.5))
=> (d e e f g g g g g f f e d c c b a a a a a b b c)
               fi
Opusmodus                                                          assemble-section   2

Score Example:

Here we use numerical structuring, by a random process using RND-SAMPLE function.

(setf r0 '(e e)
      r1 '(-e e)
      r2 '(-e s e.)
      r3 '(-s e s)
      r4 '(s s s s s s)
      r5 '(-e s s -e))

(setf p0 '(c4c2 fs4)
      p1 '(cs4cs2 g4)
      p2 '(c4 g4g3)
      p3 '(fs4 c5fs2)
      p4 '(fs5 cs5cs3)
      p5 '(g5 c5fs4))

(setf v0 '(f)
      v1 '(mp)
      v2 '(f)
      v3 '(pp)
      v4 '(p f mf)
      v5 '(fff))

(setf sec (rnd-sample 12 '(0 1 2 3 4 5) :seed 2346))
(setf r-list (assemble-section 'r sec))
(setf p-list (assemble-section 'p sec))
(setf v-list (assemble-section 'v sec))

(setf phrases (make-omn
               :length r-list
               :pitch p-list
               :velocity v-list))

(def-score collage
           (:key-signature 'chromatic
            :time-signature (get-time-signature phrases)
            :tempo 80
            :layout (piano-grand-layout 'piano))

 (piano
   :omn phrases
   :channel 1
   :sound 'gm
   :program 0)
 )
