Opusmodus                                                         vector-multiply    1

vector-multiply &rest vectors
[Function]

Arguments and Values:
vectors               inputs of vectors.


Description:

The VECTOR-MULTIPLY function mixes any number of given vectors and returns the sum
of the vectors.

(setf v1 #(1 2 3 4 5 6 7 8 9 10))
(setf v2 #(10 20 30 10 20 30))

(vector-multiply v1 v2)
=> #(10 40 90 40 100 180 70 160 270 100)

(vector-multiply v1 v2 v1)
=> #(10 80 270 160 500 1080 490 1280 2430 1000)


Examples:
(setf vectors
      (vector-multiply
       (gen-sine 120 5 0.9)
       (mod-sawtooth-waves
        4 120 4 0.3 :modulation (gen-sawtooth 120 7 0.4) :variant 2)
       (mod-triangle-waves
        5 120 4 0.3 :modulation (gen-square 120 3 0.4) :variant 2)))
Opusmodus                                                 vector-multiply   2

(list-plot vectors)




(vector-to-pitch '(g2 g5) vectors)
=> (f4 e4 cs4 a3 ds3 as2 g2 a2 c3 e3 a3 cs4 f4 a4 b4 c5
    c5 c5 f5 f5 g5 ds5 b4 gs4 f4 ds4 d4 d4 fs3 fs3 g3
    g3 a3 b3 cs4 f4 f4 a4 b4 cs5 b4 b4 as4 a4 gs4 g4
    fs4 f4 f4 ds4 as3 gs3 as3 c4 ds4 f4 g4 b3 d4 e4
    f4 g4 g4 fs4 d5 c5 as4 gs4 fs4 g4 fs4 f4 f4 d4 c4
    b3 b3 cs4 ds4 fs4 a4 gs3 cs4 e4 f4 f4 gs4 a4 gs4
    fs4 e4 ds4 d4 f4 g4 fs4 f4 fs4 a4 fs4 e4 e4 f4 f4
    f4 f4 f4 f4 f4 f4 f4 f4 f4 f4 f4 fs4 f4 f4 g4 fs4)
Opusmodus                                                 vector-multiply   3

Score Example:
(setf size 120)
(setf vector
      (vector-multiply
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
(setf transp (rnd-sample size '(-13 -11 -6 -1 1 6 11 13)))
(setf transpose (pitch-transpose transp pitches))
(setf variants (pitch-variant transpose :variant '?))
(setf dur1 (flatten (rnd-sample size '(s s s s))))
(setf dur2 (flatten (rnd-sample size '(q - e - q e))))
(setf dur-rh (span pitches dur1))
(setf dur-lh (length-span (get-span dur-rh) dur2))
(setf dynamics '(p mp mf f ff fff))

(def-score vec-multiply
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

(display-midi (compile-score 'vec-multiply))
