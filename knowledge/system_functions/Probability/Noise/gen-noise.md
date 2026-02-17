Opusmodus                                                                  gen-noise   1

gen-noise n &key scale type seed
[Function]

Arguments and Values:
n                       a sample size
scale                    oating number. The default is 1.0.
type                    :normal :binary :cauchy :chi-square-2
                        :double-exponential :exponential :extreme :gaussian
                        :logistic :lognormal :triangular :low-pass :high-pass.
                        The default is :normal.
seed                    NIL or an integer. The default is NIL.


Description:

The function GEN-NOISE generate n samples of white noise speci ed by the
keyword :type.

(gen-noise 20 :seed 23)
=> (0.49874687 0.29297933 0.33319238 0.9810914 0.27639356
    0.49766842 0.017515372 0.06386524 0.55120957 0.44475302
    0.9165399 0.42731586 0.21048035 0.14944322 0.05199222
    0.33933866 0.8851649 0.93565786 0.93476516 0.3839242)

(setf white-series (vector-to-pitch '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 ab3 e4 d4
    bb4 d4 bb3 a3 ab3 c4 a4 bb4 bb4 db4)

(sort-asc (find-unique white-series))
=> (g3 ab3 a3 bb3 b3 c4 db4 d4 eb4 e4 a4 bb4 b4)

White noise is the generalised mean-square derivative of the Wiener process or BROWNIAN
MOTION. Notice how many different types / con gurations of white-noise this function can
produce.

(setf white-series-l (vector-to-pitch
                      '(g3 b4)
                      (gen-noise 20 :type :logistic :seed 23)))

=> (eb4 db4 d4 b4 db4 eb4 g3 bb3 eb4 eb4
    ab4 d4 c4 c4 a3 d4 g4 ab4 ab4 d4)

(sort-asc (find-unique white-series-l))
=> (g3 a3 bb3 c4 db4 d4 eb4 g4 ab4 b4)
                  fl
                                        fi
                                                         fi
Opusmodus                                                              gen-noise   2

Using GEN-NOISE function with VECTOR-MAP.

(vector-map (primes-to 18) (gen-noise 24))
=> (5 3 11 3 13 13 11 13 3 2 3 7
    5 13 13 17 7 13 17 11 7 5 2 17)

(vector-to-pitch '(g3 b4) (gen-noise 10))
=> (gb4 ab4 b4 a4 d4 gb4 g3 g3 c4 c4)

(vector-to-length 16 -5 10 (gen-noise 10))
=> (7/16 5/8 7/16 1/2 1/16 -5/16 -1/16 5/8 -5/16)


Examples:

To demonstrate the different :type of the GEN-NOISE function we use LIST-PLOT with
a :seed number.

(list-plot (gen-noise 100 :type :binary :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                           gen-noise   3

(list-plot (gen-noise 100 :seed 23)
 :join-points t :point-radius 1.5)




(list-plot (gen-noise 100 :type :cauchy :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                                       gen-noise   4

(list-plot (gen-noise 100 :type :chi-square-2 :seed 23)
 :join-points t :point-radius 1.5)




(list-plot (gen-noise 100 :type :double-exponential :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                                gen-noise   5

(list-plot (gen-noise 100 :type :exponential :seed 23)
 :join-points t :point-radius 1.5)




(list-plot (gen-noise 100 :type :extreme :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                             gen-noise   6

(list-plot (gen-noise 100 :type :gaussian :seed 23)
 :join-points t :point-radius 1.5)




(list-plot (gen-noise 100 :type :logistic :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                               gen-noise   7

(list-plot (gen-noise 100 :type :triangular :seed 23)
 :join-points t :point-radius 1.5)




(list-plot (gen-noise 100 :type :low-pass :seed 23)
 :join-points t :point-radius 1.5)
Opusmodus                                              gen-noise   8

(list-plot (gen-noise 100 :type :high-pass :seed 23)
 :join-points t :point-radius 1.5)
