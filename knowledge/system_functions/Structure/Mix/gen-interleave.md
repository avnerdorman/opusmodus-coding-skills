     Opusmodus                                                                              gen-interleave   1

     gen-interleave size sequence &key flatten section exclude
     [Function]

     Arguments and Values:
     size                      size of sets to generate.
     sequence                  a sequence.
     flatten                   NIL or T. The default is NIL.
     section                   an integer or list of integers. Selected list or lists to process.
                               The default is NIL.
     exclude                   an integer or list of integers. Excluded list or lists from process.
                               The default is NIL.


     Description:

     GEN-INTERLEAVE will step through each item in the list, generating a sublist of a given
     length beginning with that item.

     (gen-interleave 4 '(c4 d4 e4 f4 g4 a4 b4 c5))
     => ((c4 d4 e4 f4) (d4 e4 f4 g4) (e4 f4 g4 a4)
         (f4 g4 a4 b4) (g4 a4 b4 c5))

     (gen-interleave '(2 3) '(c4 d4 e4 f4 g4 a4 b4 c5))
     => ((c4 d4) (d4 e4 f4) (e4 f4) (f4 g4 a4)
         (g4 a4) (a4 b4 c5) (b4 c5))

     (gen-interleave 2 '(q s s e e s 3e 3e 3e s s s q 3e 3e 3e))
     => ((1/4 1/16) (1/16 1/16) (1/16 1/8) (1/8 1/8) (1/8 1/16)
         (1/16 1/24 1/24 1/24) (1/24 1/24 1/24 1/16) (1/16 1/16)
         (1/16 1/16) (1/16 1/4) (1/4 1/24 1/24 1/24))


     Examples:

     This function can be invaluable for creating arpeggiated textures - up or down, or both. In the
     second example below the Slonimsky pattern #5 is developed as an arpeggio accompaniment
      gure.

     (setf sl-5 '(c4 cs4 d4 fs4 g4 gs4 c5))

     (gen-interleave 4 (gen-palindrome sl-5))
     => ((c4 cs4 d4 fs4) (cs4 d4 fs4 g4) (d4 fs4 g4 gs4) (fs4 g4 gs4 c5)
         (g4 gs4 c5 gs4) (gs4 c5 gs4 g4) (c5 gs4 g4 fs4) (gs4 g4 fs4 d4)
         (g4 fs4 d4 cs4) (fs4 d4 cs4 c4))
fi
Opusmodus                                                 gen-interleave   2

(gen-interleave 3 (gen-palindrome sl-5) :flatten t)
=> (c4 cs4 d4 cs4 d4 fs4 d4 fs4 g4 fs4 g4 gs4 g4 gs4 c5 gs4 c5
    gs4 c5 gs4 g4 gs4 g4 fs4 g4 fs4 d4 fs4 d4 cs4 d4 cs4 c4)

(ambitus
 '(g3 g5)
 (gen-interleave
  (rnd-sample 15 '(3 5 3 4) :seed 45)
  (integer-to-pitch (gen-accumulate '(2 7) :start -5 :count 16)))
 :type :invert)
=> ((g3 a3 e4 fs4 cs5) (a3 e4 fs4) (e4 fs4 cs5 eb5) (fs4 cs5 eb5 gs4)
    (cs5 eb5 gs4 fs4) (eb5 gs4 fs4 b3) (bb4 c5 g5) (c5 g5 f5)
    (g5 f5 bb4 gs4) (a4 e5 fs5 b4) (e5 fs5 b4 a4 d4) (fs5 b4 a4)
    (cs5 eb5 gs4))

OMN:

(gen-interleave
 2 '(s c4 ppp d4 pp e4 p f4 mp g4 mf 3q a4 f b4 ff c5 fff))
=> ((s c4 ppp d4 pp) (s d4 pp e4 p) (s e4 p f4 mp)
    (s f4 mp g4 mf) (s g4 mf 3q a4 f b4 ff c5 fff))

(gen-interleave
 '((2) (3))
 '((s c4 ppp d4 pp e4 p f4 mp g4 mf a4 f b4 ff c5 fff)
   (s c4 ppp d4 pp e4 p f4 mp g4 mf a4 f b4 ff c5 fff))
 :flatten t)
=> ((s c4 ppp d4 pp d4 e4 p e4 f4 mp f4
     g4 mf g4 a4 f a4 b4 ff b4 c5 fff)
    (s c4 ppp d4 pp e4 p d4 pp e4 p f4 mp e4 p
    f4 mp g4 mf f4 mp g4 mf 3q a4 f b4 ff c5 fff))
