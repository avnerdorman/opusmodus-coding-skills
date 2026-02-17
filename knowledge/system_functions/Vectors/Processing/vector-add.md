Opusmodus                                                                vector-add    1

vector-add &rest vectors
[Function]

Arguments and Values:
vectors                inputs of vectors.


Description:

The VECTOR-ADD function mixes any number of given vectors and returns the sum of the
vectors.

(setf v1 #(1 2 3 4 5 6 7 8 9 10))
(setf v2 #(10 20 30 10 20 30))

(vector-add v1 v2)
=> #(11 22 33 14 25 36 17 28 39 20)

(vector-add v1 v2 v1)
=> #(12 24 36 18 30 42 24 36 48 30)


Examples:
(setf vectors
      (vector-add
       (gen-square
        120 3 '(0.5 0.2 0.1)
        :modulation (gen-square 120 3 0.3 :phase 90))
       (gen-sine
         120 5 '(0.5 0.2 0.1)
         :modulation (gen-sine 120 3 0.3 :phase 90))
       (mod-triangle-waves
        50 120 4 0.3
        :modulation (gen-triangle 120 3 0.4) :variant 2)))
Opusmodus                                                vector-add   2

(list-plot vectors)




(vector-to-pitch '(g2 g5) vectors)
=> (d4 c4 c4 cs5 fs4 f4 g5 as4 g4 e5 g4 f4 c5 fs4 f4
    a4 f4 e4 fs4 ds4 ds4 d4 d4 d4 ds4 a3 b3 g3 c4 cs4
    cs4 d4 d4 b4 f4 e4 e4 f4 fs4 cs5 gs4 f4 ds5 g4 ds4
    d5 f4 d4 ds5 e4 b4 g5 c5 as4 ds5 as4 gs4 cs5 a4 g4
    ds5 a4 g4 g5 as4 fs4 cs5 e4 d4 cs4 d4 f4 g5 b4 gs4
    gs4 f4 f4 b4 a4 f4 ds5 ds4 ds4 cs4 cs4 cs4 fs3 as3
    b3 as2 gs3 b3 e3 as3 b3 a3 as3 as3 cs5 as4 c5 fs5
    a4 ds4 b3 as3 b3 c5 d4 a3 gs3 d4 b4 as4 gs4 ds4
    g2 e3 fs3)
Opusmodus                                                    vector-add   3

Score Example:
(setf size 120)
(setf vector
      (vector-add
       (gen-sine
        120 3 '(0.5 0.2 0.1)
        :modulation (gen-square 120 3 0.3 :phase 90))
       (gen-square
        120 5 '(0.5 0.2 0.1)
        :modulation (gen-sine 120 3 0.3 :phase 90))
       (mod-triangle-waves
        3 120 4 0.3
        :modulation (gen-triangle 120 3 0.4) :variant 2)))

(setf pitches (gen-divide 5 (vector-to-pitch '(g1 g6) vector)))
(setf transp (rnd-sample size '(-13 -11 -6)))
(setf transpose (pitch-transpose transp pitches))
(setf variants (pitch-variant transpose :variant '?))
(setf dur1 (flatten (rnd-sample size '(s s s s))))
(setf dur2 (flatten (rnd-sample size '(q - e - q e))))
(setf dur-rh (span pitches dur1))
(setf dur-lh (length-span (get-span dur-rh) dur2))
(setf dynamics '(p mp mf f ff fff))

(def-score vec-add
           (:key-signature 'chromatic
            :time-signature (get-time-signature dur-rh)
            :tempo 100)

 (right-hand
  :length dur-rh
  :pitch pitches
  :velocity (rnd-sample size dynamics)
  :sound 'gm
  :channel 1
  :program 'acoustic-grand-piano)

 (left-hand
  :length dur-lh
  :pitch variants
  :velocity (rnd-sample size dynamics)))

(display-midi (compile-score 'vec-add))
