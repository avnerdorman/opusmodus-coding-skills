Opusmodus                                                                                gen-chord3    1

gen-chord3 sequence intervals &key chord relative cycle ambitus seed
[Function]

Arguments and Values:
sequence                  a list or lists of pitches or omn-form sequence.
intervals                 lists of intervals.
chord                     NIL or T. The default is NIL (omits chord in the sequence).
relative                  NIL, T or :repeat. The default is NIL.
cycle                     NIL or T. The default is NIL.
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
seed                      NIL or number. The default is NIL.


Description:

The function GEN-CHORD3 enables the composer to generate chords from a list of
intervals. The number of the pitch values sets the number of chords to be generated.
The size of the chord is determined by the count of the interval values in the list.
Keywords like :chord, :relative, :cycle, :ambitus and :seed are further
parameters used within the function.

The interval lists selected at random:

(gen-chord3 '(c4 eb4 g4) '((3 7 11) (3 7 11) (3 7 11)))
=> (c4eb4g4b4 eb4fs4bb4d5 g4bb4d5fs5)

(gen-chord3 '(c4 eb4 g4) '((4 6 8 10) (3 5 7 9) (2 5 7 11)))
=> (c4eb4f4g4a4 eb4fs4gs4bb4c5 g4bb4c5d5e5)

In the next example the interval lists selected consecutively (:cycle):

(gen-chord3 '(c4 eb4 g4) '((4 6 8 10) (3 5 7 9) (2 5 7 11)) :cycle t)
=> (c4e4fs4gs4bb4 eb4fs4gs4bb4c5 g4a4c5d5fs5)


Examples:
(setf pitches '(g4 c4 a4 fs4 a4))
(setf intervals '((3 7 11) (3 5 13) (2 6 11)))

(gen-chord3 pitches intervals :seed 83)
=> (g4a4cs5fs5 c4eb4g4b4 a4b4eb5gs5 fs4a4cs5f5 a4b4eb5gs5)

(gen-chord3 pitches intervals :relative t :seed 83)
=> (g4a4cs5fs5 eb4b4c5g5 eb4gs4a4b5 cs4fs4a4f5 a3eb4b4gs5)
Opusmodus                                                       gen-chord3   2

(gen-chord3 pitches intervals :relative :repeat :seed 83)
=> (g4a4cs5fs5 eb4b4c5g5 eb4gs4a4b5 cs4a4f5fs5 a4b4eb5gs5)

(gen-chord3 pitches intervals :cycle t)
=> (g4bb4d5fs5 c4eb4f4cs5 a4b4eb5gs5 fs4a4cs5f5 a4c5d5bb5)

(gen-chord3 pitches intervals :cycle t :relative t :seed 83)
=> (g4bb4d5fs5 cs4c5eb5f5 eb4b4gs5a5 fs4a4f5cs6 d4c5a5bb5)

(gen-chord3 pitches intervals :cycle t :relative :repeat :seed 83)
=> (g4bb4d5fs5 cs4c5eb5f5 eb4a4b4gs5 fs4a4cs5f5 d4bb4c5a5)

(setf pitches2 '(g4 c4 a4 fs4a4))

(gen-chord3 pitches2 intervals :seed 83)
=> (g4a4cs5fs5 c4eb4g4b4 a4b4eb5gs5 fs4a4)

Example with optional :chord T:

(gen-chord3 pitches intervals :chord t :seed 83)
=> (g4a4cs5fs5 c4eb4g4b4 a4b4eb5gs5 fs4a4c5cs5e5f5gs5)

OMN:

(gen-chord3 '((3e cs4 g4 a5 gs5 e4 b3) (5q c4 gs3 a4 eb5 d5)
              (3e b5 b5 gs5 g5 f5 f5) (5q b4 fs4 bb5 eb4 d5)
              (3e cs5 c6 c6 gs4 d4 a4) (5q e5 g3 a5 a5 d4))
            '((6 8 11) (3 5 13) (2 7 11)))

                    3                     3
                                                           5




            8
       3


                                  3
                3
                                                       5


                                      3


       5


                3


                                                   5




                                                               OPUSMODUS
Opusmodus                                                       gen-chord3   3

(setf seq '((7q f4 ff c4 mp fs4 f f4 fs4 mp g4 p cs4 ppp)
            (7q a4 pp eb4 mp a4 mf b4 p pp bb4 mp -)
            (-7q a4 p eb4 f a4 eb4 mp d4 gs4)
            (7q fs4 c4 ff cs4 mp d4 ff e4 bb4 b4 pp)
            (7q e4 ppp bb4 ff c4 - d4 pp cs4 f -)
            (5q d4 f cs4 pp d4 mp bb4 gs4 p)
            (5q a4 f - eb4 e4 pp gs4)
            (5q d4 f c4 ff cs4 mf eb4 f -)
            (5q cs5 mf d6 ppp fs5 c6 mp cs5 p)
            (5q. g4 mp b4 5q f4 b4 f)
            (5q a4 f gs4 pp a4 mp f4 eb4 p)
            (5q e4 f - bb4 b4 pp eb4)
            (5q a4 f g4 ff gs4 mf bb4 f -)
            (5q gs5 mf a6 ppp cs6 g6 mp gs5 p)
            (5q. d5 mp fs4 5q c4 fs4 f)))

(gen-chord3 seq '((13) (-11) (-13) (11) (13) (1) (-13)))

                                         7                  7
                       7




                           7                      7


      4




                                                      5
               5                5

      6




                                     5                      5


      9




                   5




                                         5            8
                   5

      12


                                                            5




                                     5
      15




                                                                OPUSMODUS
Opusmodus                                                     gen-chord3   4

Score Example:
(progn
 (setf row (rnd-row :type :pitch))
 (setf root (rnd-octaves '(c3 c5) (rnd-sample 32 row)))
 (setf intervals (butlast (gen-divide 3 (pitch-to-integer root))))
 (setf chords (gen-chord3 root intervals :relative :repeat))
 (setf sop-pitch (pitch-demix 1 chords))
 (setf alt-pitch (pitch-demix 2 chords))
 (setf ten-pitch (pitch-demix 3 chords))
 (setf bas-pitch (pitch-demix 4 chords))
 (setf length '(w h. -q h -q w w w h. h. w w))
 (setf sop-length (length-span 12 (rnd-sample 40 length)))
 (setf alt-length (length-span 12 (rnd-sample 40 length)))
 (setf ten-length (length-span 12 (rnd-sample 40 length)))
 (setf bas-length (length-span 12 (rnd-sample 40 length)))
 (setf soprano (make-omn :length sop-length :pitch sop-pitch))
 (setf alto (make-omn :length alt-length :pitch alt-pitch))
 (setf tenor (make-omn :length ten-length :pitch ten-pitch))
 (setf bass (make-omn :length bas-length :pitch bas-pitch))

 (def-score chord3
            (:key-signature 'chromatic
             :time-signature '((1 1 1 1) 4)
             :tempo 52
             :layout (choir-satb-layout 'soprano 'alto 'tenor 'bass))

      (soprano
       :omn (ambitus 'soprano (pitch-transpose 12 soprano))
       :channel 1
       :sound 'gm
       :program 'choir-aahs
       :volume 100 :pan 16)

      (alto
       :omn (ambitus 'alto alto)
       :channel 2 :volume 100 :pan 41)

      (tenor
       :omn (ambitus 'tenor tenor)
       :channel 3 :volume 100 :pan 86)

      (bass
        :omn (ambitus 'bass bass)
        :channel 4 :volume 90 :pan 111)
      )

     (audition-musicxml-last-score)
 )
