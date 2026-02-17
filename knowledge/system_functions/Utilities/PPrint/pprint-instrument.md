Opusmodus                                                                   pprint-instrument   1

pprint-instrument score-name instrument-name
[Function]

Arguments and Values:
score-name             name of an existing score (a score must be evaluated rst).
instrument-name        instrument name.


Description:

The function PPRINT-INSTRUMENT prints instrument values of a given score with the bar
numbers in the Listener.


Score Example:
(setf size 200)
(setf vector
      (add-triangle-waves
       4 size 1 0.6 :modulation
       (gen-triangle size 1 '(0.5 0.4 0.3 0.6) :modulation
                     (gen-triangle size 1 0.3 :phase 180))))
(setf pitches (gen-divide 4 (vector-to-pitch '(g1 g6) vector)))
(setf transpose (pitch-transpose -12 pitches))
(setf variants (pitch-variant transpose :variant '?))
(setf length (rnd-sample 120 '(s e s s)))
(setf time (span pitches length))
(setf dynamics '(p mf ff))

(def-score add-triangle
    (:key-signature 'chromatic
     :time-signature (get-time-signature time)
     :tempo 120
     :octave-shift '(c2 c6)
     :layout (piano-solo-layout 'rh 'lh :ignore-velocity t))

    (rh :length time
        :pitch pitches
        :velocity (rnd-sample size dynamics)
        :sound 'gm
        :channel 1
        :program 'acoustic-grand-piano)

    (lh :length time
        :pitch variants
        :velocity (rnd-sample size dynamics))
)
                                                                    fi
Opusmodus                                         pprint-instrument   2

(pprint-instrument 'add-triangle 'rh)

The rh instrument output in the Listener:

(setf rh
      '(#|1|# (s g1 p gs1 ff a1 p b1 ff)
         #|2|# (s c2 ff cs2 p d2 mf e2 p)
         #|3|# (s f2 p fs2 mf g2 ff e a2 mf)
         #|4|# (s b2 c3 cs3 eb3 ff)
         #|5|# (s e3 mf f3 p e fs3 a3 ff)
         #|6|# (e bb3 mf s b3 ff c4 e4)
         #|7|# (s e4 mf e f4 s p b4)
         #|8|# (e b4 ff s p mf fs5 ff)
         #|9|# (e fs5 p f5 ff s e cs6)
         #|10|# (s cs6 p c6 ff b5 g6)
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
Opusmodus                                               pprint-instrument   3

            #|47|# (s cs5 ff e eb5 mf s e5 ff eb5 mf)
            #|48|# (s e5 ff fs5 e g5 mf s fs5 ff)
            #|49|# (e g5 p s gs5 ff e a5 mf a5)
            #|50|# (s bb5 p b5 mf e c6 ff s mf)))
