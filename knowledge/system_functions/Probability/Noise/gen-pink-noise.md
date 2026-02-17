Opusmodus                                                                gen-pink-noise   1

gen-pink-noise n &key octave seed
[Function]

Arguments and Values:
n                        an integer (a sample size).
octave                   an integer. The default is 5.
seed                     an integer or NIL. The default is NIL.


Description:

This function generates n samples of pink noise. Pink Noise or 1/f noise is a signal or
process with a frequency spectrum such that the power spectral density (energy or power per
Hz) is inversely proportional to the frequency of the signal. In pink noise, each :octave
(halving/doubling in frequency) carries an equal amount of noise power.

(gen-pink-noise 128 :seed 678)
=> (6 8 4 6 8 4 9 6 6 10 10 7 6 6 10 9 7 8 6 6 8 6 6 6 8 8 8
    9 10 9 10 8 8 8 10 6 6 10 8 7 8 9 6 8 6 9 7 9 9 10 9 6 7
    10 6 8 6 8 6 10 10 6 7 10 9 6 9 7 6 6 8 8 9 10 8 6 9 6 6
    7 6 7 6 7 10 6 6 6 7 7 10 7 6 10 8 10 8 10 8 8 9 6 6 10
    7 6 7 7 7 7 8 9 7 7 10 7 7 10 6 6 6 7 10 10 10 8 8 10)

(list-plot (gen-pink-noise 128 :seed 678)
           :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                   gen-pink-noise   2

Examples:

With octave 3:

(list-plot (gen-pink-noise 128 :octave 3 :seed 876)
            :zero-based t :point-radius 1 :join-points t)




With octave 7:

(list-plot (gen-pink-noise 128 :octave 7 :seed 876)
            :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                            gen-pink-noise     3

Compare the output of the rst example with output from GEN-NOISE. Both outputs create
20-tone tonalities.

(setf white-series
      (vector-to-pitch
       '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4
    bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf pink-series
      (vector-to-pitch
       '(g3 b4) (gen-pink-noise 20 :seed 23)))
=> (g3 b3 b3 b3 e4 d4 g4 fs4 fs4 b4
    a4 g4 fs4 g4 fs4 g4 b4 g4 b4 e4)

Mapping pink result to velocity symbols.

(vector-to-velocity 'ppp 'mf (gen-pink-noise 20 :seed 23))
=> (ppp pp pp pp p p mp mp mp mf mp mp mp mp mp mp mf mp mf p)
                   fi
