Opusmodus                                                                      gen-ar-time-series   1

gen-ar-time-series sample-size coeffs variance
                                &key scale seed process-variance
                                (result (make-array sample-size))

[Function]

Arguments and Values:
sample-size              length of generated time series.
coeffs                   sequence of length p with AR coef cients.
variance                 process variance or innovations variance.
scale                    a oating-point number. Scaling factor.
seed                     an integer or NIL. The default is NIL.
process-variance         if T, variance is taken to be process variance
                         if NIL, variance is taken to be innovations variance. The default is T.


Description:

GEN-AR-TIME-SERIES can be used to generate realisations of speci ed lengths from
normally distributed AUTOREGRESSIVE PROCESSES (AR), these processes are discussed
in Chapter 2 and 9 of the SAPA book.

The function generates realisation of zero mean normally distributed AR process and returns
result, vector of length sample-size with realisation.

(setf ar-lis (vector-to-pitch '(g3 b4)
              (gen-ar-time-series 20 '(-0.75) 0.5 :seed 23)))
=> (b4 a3 ab4 a4 b3 a4 g3 gb4 e4 e4
    b4 b3 f4 c4 d4 e4 bb4 g4 a4 c4)

(sort-asc (find-unique ar-lis))
=> (g3 a3 b3 c4 d4 e4 f4 gb4 g4 ab4 a4 bb4 b4)



Examples:
(gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
=> (0.35266728592181457D0 -0.12747193394262862D0
    0.2514404216556979D0 0.27028316332448354D0
    -0.07344112072827763D0 0.2878439226712438D0
    -0.20769087653949792D0 0.18563838684801526D0
    0.11857588615254752D0 0.11908225725087593D0)
                    fl
                                                     fi
                                                                        fi
Opusmodus                                                      gen-ar-time-series   2

(list-plot (gen-ar-time-series 100 '(-0.75) 0.5 :seed 23)
 :join-points t :point-radius 2 :zero-based t)




Same as above but with conversion to pitch symbols using the VECTOR-TO-PITCH
function.

(vector-to-pitch
 '(g3 g7) (gen-ar-time-series 100 '(-0.75) 0.5 :seed 23))
=> (ab6 eb4 d6 eb6 g4 e6 b3 bb5 gb5 gb5 g6 ab4 g5 a4 d5 gb5
    g6 b5 f6 a4 d5 ab5 a4 eb7 a4 ab5 e5 eb6 d6 e4 f7 b4 c6
    b5 b4 gb6 f5 eb6 a5 eb6 d4 g7 a3 d6 eb6 bb5 d5 ab6 eb5
    b5 b5 f5 db5 e5 a5 b5 e4 gb5 gb6 d5 db5 ab6 gb4 bb6 c4
    b6 e5 g4 eb7 g3 d6 d5 g5 b5 eb5 ab4 eb6 ab4 g6 c6 eb6
    e5 db5 db5 a6 db5 f5 e5 bb6 e4 gb5 d5 d6 db5 c6 gb5 a4
    gb6 a3 gb7)
