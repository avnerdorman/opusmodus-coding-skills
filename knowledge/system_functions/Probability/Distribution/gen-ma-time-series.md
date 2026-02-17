Opusmodus                                                                       gen-ma-time-series   1

gen-ma-time-series sample-size coeffs variance
                                 &key scale seed process-variance
                                 (result (make-array sample-size))

[Function]

Arguments and Values:
sample-size               length of generated time series.
coeffs                    sequence of length q with MA coef cients.
variance                  process variance or innovations variance.
scale                     a oating-point number. Scaling factor.
seed                      an integer or NIL. The default is NIL.
process-variance          if T, variance is taken to be process variance
                          if NIL, variance is taken to be innovations variance. The default is T.


Description:

GEN-MA-TIME-SERIES can be used to generate realisations of speci ed lengths from
normally distributed MOVING AVERAGE (MA), these processes are discussed in Chapter 2
and 9 of the SAPA book. The function generates realisation of zero mean normally
distributed MA process and returns vector of length sample-size with realisation.

(setf ma-series (vector-to-pitch '(g3 b4)
                 (gen-ma-time-series 20 '(1.0) 1.0 :seed 23)))
=> (eb4 c4 g4 bb3 gb4 g3 c4 c4 a4 d4
    db4 d4 b3 a3 b4 d4 g3 b3 gb4 g4)

(sort-asc (find-unique ma-series))
=> (g3 a3 bb3 b3 c4 db4 d4 eb4 gb4 g4 a4 b4)

Note that the output above produces a pitch-series similar to the octatonic scale.


Examples:
(gen-ma-time-series 10 '(1.0) 1.0 :seed 23)
=> (0.0982808514527258D0 -0.09232336231166616D0
    0.3095742252947981D0 -0.23115685147418857D0
    0.2778512005535247D0 -0.36585880493228845D0
    -0.08232415717480843D0 -0.10114328068185119D0
    0.4374828231047304D0 0.01692092444515747D0)
                     fl
                                                      fi
                                                                         fi
Opusmodus                                                      gen-ma-time-series   2

(list-plot (gen-ma-time-series 100 '(1.0) 1.0 :seed 23)
 :join-points t :point-radius 2 :zero-based t)




Same as above but with conversion to pitch symbols using the VECTOR-TO-PITCH
function.

(vector-to-pitch
 '(g3 g7) (gen-ma-time-series 100 '(1.0) 1.0 :seed 23))
=> (bb5 eb5 gb6 a4 f6 e4 eb5 d5 b6 g5 e5 g5 b4 g4 e7 gb5
    eb4 b4 eb6 g6 g3 ab5 gb5 g5 db7 c4 gb6 a4 ab5 a5 d5
    db6 bb4 b6 gb4 ab4 f7 gb4 b4 db6 db5 b6 db4 eb5 eb5
    db6 g5 b5 gb5 f4 db6 e6 bb4 bb6 ab5 gb4 f5 f4 d6 eb5
    g5 c5 bb6 f4 f5 bb6 d5 bb4 gb6 c6 db4 bb6 d6 bb3 d5
    gb5 bb6 d4 e5 f5 b6 e4 ab6 e5 eb6 a3 eb6 db5 c5 g7 a3
    eb5 bb6 e6 d5 f5 g5 a5 db5 f4)
