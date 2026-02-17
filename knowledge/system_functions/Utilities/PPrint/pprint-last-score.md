Opusmodus                                                          pprint-last-score   1

pprint-last-score ()
[Function]

Arguments and Values:
none


Description:

The function PPRINT-LAST-SCORE prints a def-score-form of the *last-
score* with the bar numbers in the Listener.

(pprint-last-score)


Examples:

To see the result of the PPRINT-LAST-SCORE function in the Listener, we need to
evaluate a score rst:

(progn
  (setf size 200)
  (setf vector
        (add-triangle-waves
         4 size 1 0.6
         :modulation
         (gen-triangle size 1 '(0.5 0.4 0.3 0.6)
                       :modulation
                       (gen-triangle size 1 0.3 :phase 180))))
  (setf pitches (gen-divide 4 (vector-to-pitch '(g1 g6) vector)))
  (setf transpose (pitch-transpose -12 pitches))
  (setf variants (pitch-variant transpose :variant '?))
  (setf length (rnd-sample 120 '(s e s s)))
  (setf time (span pitches length))
  (setf dynamics '(p mf ff))

  (def-score add-triangle
             (:title "Waves Add-Triangle"
              :composer "OPMO"
              :copyright "© 2014 Opusmodus"
              :key-signature 'chromatic
              :time-signature (get-time-signature time)
              :tempo 120
              :flexible-clef t
              :octave-shift '(c2 c6)
              :layout (piano-solo-layout 'rh 'lh
                                          :ignore-velocity t))
             fi
Opusmodus                                               pprint-last-score   2


      (rh
       :length time
       :pitch pitches
       :velocity (rnd-sample size dynamics)
       :sound 'gm
       :channel 1
       :program 'acoustic-grand-piano)

      (lh
       :length time
       :pitch variants
       :velocity (rnd-sample size dynamics)))
  )

Now evaluate the expression below:

(pprint-last-score)

The output is in the Listener:

(def-score add-triangle
    (:title "Waves Add-Triangle"
      :composer "OPMO"
      :copyright "© 2014 Opusmodus"
      :key-signature 'chromatic
      :layout '(:brace (:flexible-treble rh) (:flexible-bass lh)
                :name "" :abbr "" :ignore-velocity t)
      :octave-shift '(c2 c6)
      :flexible-clef t
      :rewrite-lengths 't
      :time-signature '((1 4 2) (5 16 1) (1 4 1) (3 8 1) (5 16 3)
                        (7 16 1) (1 4 1) (3 8 1) (5 16 2) (1 4 2)
                        (3 8 1) (5 16 2) (7 16 1) (5 16 2) (1 4 2)
                        (5 16 1) (3 8 1) (1 4 1) (7 16 1) (5 16 1)
                        (1 4 1) (5 16 1) (1 4 2) (5 16 1) (1 4 1)
                        (3 8 1) (5 16 3) (7 16 1) (1 4 1) (3 8 1)
                        (5 16 2) (1 4 2) (3 8 1) (5 16 2) (7 16 1)
                        (5 16 1))
      :tempo '120)
  (rh
   :omn '(#|1|# (s g1 p gs1 ff a1 p b1 ff)
           #|2|# (s c2 ff cs2 p d2 mf e2 p)
           #|3|# (s f2 p fs2 mf g2 ff e a2 mf)
           #|4|# (s b2 c3 cs3 eb3 ff)
           #|5|# (s e3 mf f3 p e fs3 a3 ff)
           #|6|# (e bb3 mf s b3 ff c4 e4)
           #|7|# (s e4 mf e f4 s p b4)
           #|8|# (e b4 ff s p mf fs5 ff)
           #|9|# (e fs5 p f5 ff s e cs6)
           #|10|# (s cs6 p c6 ff b5 g6)
Opusmodus                                             pprint-last-score   3

          #|11|# (e g6 mf s p f6 ff e g6 mf)
          #|12|# (s g6 g6 p ff e fs6 p)
          #|13|# (s g6 p mf e p s fs6)
          #|14|# (s fs6 mf fs6 fs6 fs6)
          #|15|# (s fs6 p ff p ff)
          #|16|# (e fs6 p s ff p e f6 ff)
          #|17|# (s fs6 ff e p s ff f6 p)
          #|18|# (s f6 p fs6 ff e s f6 p)
          #|19|# (e f6 ff s fs6 e p f6)
          #|20|# (s f6 ff p e fs6 mf s f6 p)
          #|21|# (s f6 p f6 f6 mf e ff)
          #|22|# (s f6 p ff p f6)
          #|23|# (s f6 mf f6 f6 p mf)
          #|24|# (s f6 p e s mf ff)
          #|25|# (s f6 p e e s)
          #|26|# (s f6 p mf ff mf)
          #|27|# (e f6 f6 e6 s f6)
          #|28|# (s f6 ff e e6 p s eb6 f6 ff)
          #|29|# (s f6 mf e6 p d6 mf f6)
          #|30|# (s f6 ff e e6 p s d6 f6 mf)
          #|31|# (s f6 e6 p cs6 mf f6)
          #|32|# (s f6 f6 cs6 p f6)
          #|33|# (s f6 mf f6 cs6 p e fs6 mf)
          #|34|# (s f6 e6 bb5 f6)
          #|35|# (s e6 b5 e f5 p eb6 ff)
          #|36|# (e bb5 ff s fs5 mf cs5 p a5 mf)
          #|37|# (s e5 p e c5 s gs4 mf d5 ff)
          #|38|# (e bb4 mf s fs4 p d4 mf g4)
          #|39|# (e e4 ff d4 s b3 mf e eb4 ff)
          #|40|# (s cs4 mf bb3 p gs3 ff c4 p)
          #|41|# (e a3 p s ff b3 mf e gs3 ff)
          #|42|# (s bb3 mf c4 ff d4 p e b3)
          #|43|# (s cs4 mf eb4 e f4 ff s eb4)
          #|44|# (s e4 p fs4 ff gs4 p fs4)
          #|45|# (s g4 ff a4 p bb4 a4)
          #|46|# (e bb4 mf s c5 p cs5 ff e c5)
          #|47|# (s cs5 ff e eb5 mf s e5 ff eb5 mf)
          #|48|# (s e5 ff fs5 e g5 mf s fs5 ff)
          #|49|# (e g5 p s gs5 ff e a5 mf a5)
          #|50|# (s bb5 p b5 mf e c6 ff s mf))
   :channel 1
   :sound 'gm
   :program 'acoustic-grand-piano
   :volume 90
   :pan 64)
  (lh
   :omn '(#|1|# (s b0 ff cs1 p c2 ff b1 p)
          #|2|# (s c1 mf b0 p bb0 c1 mf)
          #|3|# (s a1 g1 fs1 e f1)
          #|4|# (s eb2 cs2 p c2 mf b1)
          #|5|# (s e2 f2 e fs2 p a2 ff)
Opusmodus                                          pprint-last-score   4

          #|6|# (e e3 ff s gs3 p a3 bb3 mf)
          #|7|# (s e3 ff e f3 s mf b3 p)
          #|8|# (e fs4 mf s b3 p ff b3)
          #|9|# (e cs5 ff a5 p s ff e gs5)
          #|10|# (s b4 mf c5 ff cs5 g5 p)
          #|11|# (e g5 mf s f5 p g5 ff e mf)
          #|12|# (s g5 g5 ff mf e gs5 ff)
          #|13|# (s fs5 mf g5 p e ff s mf)
          #|14|# (s fs5 ff p mf ff)
          #|15|# (s fs5 p mf ff fs5)
          #|16|# (e f5 ff s fs5 p mf e ff)
          #|17|# (s fs5 p e mf s p f5 ff)
          #|18|# (s f5 mf ff e fs5 p s ff)
          #|19|# (e f5 ff s e5 p e ff f5)
          #|20|# (s f5 mf ff e mf s fs5 p)
          #|21|# (s f5 ff p mf e ff)
          #|22|# (s f5 ff f5 f5 p f5)
          #|23|# (s f5 ff p f5 f5)
          #|24|# (s f5 p e mf s p ff)
          #|25|# (s f5 ff e e mf s ff)
          #|26|# (s f5 ff p ff p)
          #|27|# (e e5 mf f5 p ff s)
          #|28|# (s f5 mf e eb5 s e5 ff f5 p)
          #|29|# (s f5 mf fs5 gs5 ff f5 p)
          #|30|# (s f5 p e e5 mf s d5 p f5 mf)
          #|31|# (s f5 p e5 mf cs5 ff f5)
          #|32|# (s f5 ff f5 f5 cs5)
          #|33|# (s fs5 ff f5 p ff e cs5 mf)
          #|34|# (s f5 p c6 ff fs5 mf f5 ff)
          #|35|# (s eb5 p cs6 mf e g5 d5)
          #|36|# (e cs4 ff s fs4 p a4 mf bb4)
          #|37|# (s d4 p e gs3 s c4 mf e4 ff)
          #|38|# (e g3 p s d3 mf fs3 ff bb3)
          #|39|# (e b2 p d3 s eb3 e e3 mf)
          #|40|# (s cs3 ff e3 fs3 mf d3)
          #|41|# (e a2 ff s p b2 mf e gs2 ff)
          #|42|# (s bb2 mf gs2 fs2 e a2)
          #|43|# (s eb3 f3 p e eb3 mf s cs3 p)
          #|44|# (s e3 mf fs3 p mf gs3 ff)
          #|45|# (s a3 ff bb3 a3 mf g3)
          #|46|# (e c4 s b3 p c4 mf e d4 p)
          #|47|# (s cs4 p e b3 ff s bb3 b3 p)
          #|48|# (s fs4 mf g4 p e fs4 ff s e4 p)
          #|49|# (e g4 mf s gs4 p e a4 mf ff)
          #|50|# (s c5 ff p e b4 s bb4))
   :channel 1
   :sound 'gm
   :program 'acoustic-grand-piano
   :volume 90
   :pan 64))
Opusmodus                                                          pprint-last-score   5

The Snippet is also a part of the *last-score* variable and can be displayed in a
DEF-SCORE form. Place the mouse cursor at the end of the expression and press Cmd-1 for
audition and notation:

'((-e eb4 stacc s gb3 d3 -e)
  (e eb4 stacc s gb3 e. d3 stacc -e)
  (-s e eb4 stacc s gb3 d3 -e s eb4 tie+stacc)
  (t eb4 -t s gb3 d3 stacc gb3 eb4 a3 -e)
  (-e eb4 stacc s gb3 d3 -e)
  (e eb4 stacc s gb3 q d3 stacc -s)
  (-s -e eb4 stacc s gb3 d3 -)
  (-s e eb4 stacc s gb3 d3 stacc gb3 eb4 a3)))

Now evaluate the expression below:

(pprint-last-score)

The Snippet of the above is in the Listener:

(def-score snippet
    (:title "SNIPPET"
     :composer nil
     :copyright nil
     :key-signature 'chromatic
     :layout '(:flexible-treble instrument :accidentals :cautionary
               :ignore-tempo t)
     :octave-shift 't
     :rewrite-lengths 't
     :time-signature '((2 4 8))
     :tempo '108)
  (instrument
   :omn '(#|1|# (-e eb4 stacc s gb3 d3 -e)
          #|2|# (e eb4 stacc s gb3 e. d3 stacc -e)
          #|3|# (-s e eb4 stacc s gb3 d3 -e s eb4 tie+stacc)
          #|4|# (t eb4 - s gb3 d3 stacc gb3 eb4 a3 -e)
          #|5|# (-e eb4 stacc s gb3 d3 -e)
          #|6|# (e eb4 stacc s gb3 q d3 stacc -s)
          #|7|# (-s -e eb4 stacc s gb3 d3 -)
          #|8|# (-s e eb4 stacc s gb3 d3 stacc gb3 eb4 a3))
   :channel 1
   :sound 'gm
   :program 0
   :volume 92
   :pan 64))
