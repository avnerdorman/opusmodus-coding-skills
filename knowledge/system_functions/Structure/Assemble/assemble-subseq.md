Opusmodus                                                               assemble-subseq   1

assemble-subseq sequence
[Function]

Arguments and Values:
sequence                 sequence of lists.


Description:

This function has a similar mechanism to that found in COMPILE-SONG and illustrated in
the Tutorial Guide Stage 27.

(compile-score
 '((invocation-1 :start 1 :end 8)
   (invocation-2 :start 1 :end 16)
   (invocation-3 :start 1 :end 16)
   (invocation-1 :start 1 :end 8))
 )

Here three separate score-scripts are sequenced in the same manner as the early list-based
sequencers allowed. Remember Steinberg’s Pro 24? This is a powerful and unique feature of
OPUSMODUS.

The difference between ASSEMBLE-SUBSEQ and the COMPILE-SONG mechanism is that
ASSEMBLE-SUBSEQ allows a similar sequencing operation to take place at a local level, i.e.
with a single score-script.


Examples:
(setf seq-1 '((c4 cs4 fs4 g4) (c5 g4 fs4 cs4)
              (c4 d4 fs4 gs4) (c5 gs4 fs4 d4)))

(setf seq-2 '((c4 cs4 d4 fs4 g4 gs4) (c5 gs4 g4 fs4 d4 cs4)
              (c4 cs4 ds4 fs4 g4 a4) (c5 a4 g4 fs4 ds4 cs4)))

(setf seq-3 '((c4 cs4 d4 ds4 fs4 g4 gs4 a4)
              (c5 a4 gs4 g4 fs4 ds4 d4 cs4)
              (c4 cs4 d4 e4 fs4 g4 gs4 as4)
              (c5 as4 gs4 g4 fs4 e4 d4 cs4)))
Opusmodus                                                assemble-subseq   2

(assemble-subseq
 '((seq-1 :start 1 :end 2)
   (seq-2 :start 1 :end 4)
   (seq-3 :start 3 :end 3)
   (seq-1 :start 2 :end 3)))
=> ((c4 cs4 fs4 g4) (c5 g4 fs4 cs4) (c4 cs4 d4 fs4 g4 gs4)
    (c5 gs4 g4 fs4 d4 cs4) (c4 cs4 ds4 fs4 g4 a4)
    (c5 a4 g4 fs4 ds4 cs4) (c4 cs4 d4 e4 fs4 g4 gs4 as4)
    (c5 g4 fs4 cs4) (c4 d4 fs4 gs4))



Score Example:

Here is a more complex example using lists of OMN.

(setf a-rh '((h c6 mp) (h g5gs4 mp) (h g5fs5 mp)
             (h e5as4 mp) (h b4a4 mp) (h e5as4 mp)
             (h g4d4 mp) (h c5g4 mp) (h as4fs4 mp)
             (h g4d4 mp) (h g4gs3 mp) (h cs4g3 mp)
             (h gs3g3 mp) (h cs4g3 mp) (h gs3g3 mp)
             (h g4gs3 mp)))

(setf a-lh '((h d4as3 mp) (h e4cs4 mp) (h f4ds4 mp)
             (h ds3 mp) (h f4cs4 mp) (h ds3 mp)
             (h cs4 mp) (h b2a2 mp) (h f4c4 mp)
             (h cs4 mp) (h g2 mp) (h f3d3 mp)
             (h b2gs2 mp) (h f3d3 mp) (h b2gs2 mp)
             (h g2 mp)))

(setf b-rh '((h c6 p) (-q g5gs4 mp) (-e s g5 f fs5 -e s g5 fs5)
             (-e s e5 f as4 -e s e5 as4) (e b4a4 ff - b4a4 -)
             (-q e5as4 mp) (h g4d4 p) (e c5g4 ff - c5g4 -)
             (e as4fs4 ff - as4fs4 -) (e g4d4 ff - g4d4 -)
             (h g4gs3 p) (e cs4g3 ff - cs4g3 -) (-q gs3g3 mp)
             (e cs4g3 ff - cs4g3 -) (h gs3g3 p) (-q g4gs3 mp)))

(setf b-lh '((h d4as3 p) (-e s e4 f cs4 -e s e4 cs4)
             (e f4ds4 ff - f4ds4 -) (h ds3 p)
             (e f4cs4 ff - f4cs4 -) (e ds3 ff - ds3 -)
             (-q cs4 mp) (h b2a2 p) (-q f4c4 mp)
             (e cs4 ff - cs4 -) (e g2 ff - g2 -)
             (-e s f3 f d3 -e s f3 d3) (-q b2gs2 mp)
             (-q f3d3 mp) (-q b2gs2 mp) (-q g2 mp)))
Opusmodus                                                   assemble-subseq   3

(setf piano-rh
      (assemble-subseq
       '((a-rh :start 1 :end 1)
         (b-rh :start 2 :end 3)
         (a-rh :start 4 :end 6)
         (b-rh :start 7 :end 12)
         (a-rh :start 13 :end 15)
         (b-rh :start 15 :end 16))))

(setf piano-lh
      (assemble-subseq
         '((a-lh :start 1 :end 1)
           (b-lh :start 2 :end 3)
           (a-lh :start 4 :end 6)
           (b-lh :start 7 :end 12)
           (a-lh :start 13 :end 15)
           (b-lh :start 15 :end 16))))

(def-score piano
           (:key-signature '(c maj)
            :time-signature (get-time-signature piano-rh)
            :tempo 80
            :layout (piano-layout 'piano-rh 'piano-lh))

 (piano-rh
  :omn piano-rh
  :channel 1
  :sound 'gm
  :program 'acoustic-grand-piano)

 (piano-lh
   :omn piano-lh)
 )
