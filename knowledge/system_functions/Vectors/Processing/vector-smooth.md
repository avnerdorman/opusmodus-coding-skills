Opusmodus                                                                                 vector-smooth   1

vector-smooth alfa sequence
[Function]

Arguments and Values:
alfa                          parameter controlling the degree of exponential smoothing
                              (usually 0 < alpha < 1).
sequence                      a sequence of numbers.


Description:

This function returns vectors with smoothed values. Sometimes preparing and processing
material in a vector-state can be more effective than in an integer state. Smoothing operations
are one such instance. Notice the improved de nition of a white-noise vector stream through
using VECTOR-SMOOTH.

Note: see Section 7.3 of "Time Series: A Biostatistical Introduction'" by Diggle, 1990"

(vector-smooth 0.2 (gen-noise 12))
=> (0.7884441229980439D0 0.7884441229980439D0
      0.8041497467097733D0 0.8193790591179403D0
      0.7184865407398721D0 0.7602130087431593D0
      0.7696135593201361D0 0.638562809136525D0
      0.6687698546517321D0 0.5717017755404891D0
      0.5366965292414861D0 0.43417587275937913D0)
                                              fi
Opusmodus                                                    vector-smooth   2

Examples:
(setf vector (gen-noise 200 :seed 345))
=> (0.33498837519437075D0 0.723328965017572D0 . . .)

(list-plot vector)




Now the same vector with VECTOR-SMOOTH with alfa value 0.1

(list-plot (vector-smooth 0.1 vector))
Opusmodus                                vector-smooth   3

Same vector with alfa value 0.2

(list-plot (vector-smooth 0.2 vector))




Same vector with alfa value 0.3

(list-plot (vector-smooth 0.3 vector))
Opusmodus                                 vector-smooth   4

Same vector with alfa value 0.05

(list-plot (vector-smooth 0.05 vector))
