     Opusmodus                                                                             gen-envelope-tendency        1

     gen-envelope-tendency data lower-envelope upper-envelope
                                                       &key reflect smooth seed

     [Function]

     Arguments and Values:
     data                               A list of numeric data that you want to process. This list should consist of
                                          oating point numbers or integers, and it can contain both positive
                                        and negative values.
     lower-envelope                     A list representing the lower envelope. This should be a list of alternating
                                        x and y values, where the y-values specify the lower limit at different
                                        x-values.
     upper-envelope                     A list representing the upper envelope. This should be a list of alternating
                                        x and y values, where the y-values specify the upper limit at different
                                        x-values.
     reflect                            An optional keyword argument. When set to true, the function will rst try
                                        to re ect the value within the limit before adjusting it. By default, this is set
                                        to NIL, which means that the function will simply adjust the value without
                                        trying to re ect it rst.
     smooth                             An optional keyword argument. The smoothing factor between 0.0 and 1.0
                                        to be used when smoothing the result. If not provided, no smoothing will be
                                        applied.
     seed                               This is an integer that guarantees consistent results each time the code is
                                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                                        your code is reproducible. The default value for seed is NIL, which means the
                                        seed is not set, resulting in different outputs on each run due to natural
                                        randomness.


     Description:

     This function takes a list of data and adjusts the values to t within the speci ed lower and
     upper envelope limits. If a value is outside the given envelope, the function will adjust
     it to t within the envelope and all subsequent values in the list are also adjusted by the
     same amount, which helps to preserve the original shape of the data.

     reflect set to T:
     This function re ects a number if it falls outside the given lower and upper limits. It rst
     calculates a re ected value based on the difference between the current number and the
     previous number. If the re ected value is still outside the limits, it randomly chooses a value
     between the previous number and the appropriate limit (lower if the re ected value is less
     than the lower limit, upper if it's greater than the upper limit). It then calculates an adjustment
     value based on the difference between the re ected value and the corrected value.
fi
              fl
                   fl
                         fl
                              fl
                                   fl
                                           fl
                                                  fi
                                                       fl
                                                                fi
                                                                         fi
                                                                                      fl
                                                                                               fi
                                                                                                     fi
                                                                                                          fi
Opusmodus                                                              gen-envelope-tendency         2

reflect set to NIL:
This function checks if a number falls outside the given lower and upper limits. If it does, it
randomly chooses a value between the previous number and the appropriate limit (lower if
the number is less than the lower limit, upper if it's greater than the upper limit), and sets the
number to this new value. It calculates an adjustment value based on the difference between
the original and the corrected number.


Examples:
(setf data (list-plot (gen-brownian-motion 128 :seed 43)
                      :zero-based t :point-radius 2 :join-points t))


         1.00
        0.95
        0.90
        0.85
        0.80
         0.75
         0.70
        0.65
        0.60
        0.55
        0.50
        0.45
                       20        40         60        80        100        120       140
Opusmodus                                                       gen-envelope-tendency   3

(setf len (length data))
(setf l-limit (envelope-samples '(0 0 1 -1 2 -1 3 -2 4 3 5 -1 6 0) len))
(setf u-limit (envelope-samples '(0 1 1 4 2 2 3 4 6 4) len))
(xy-plot (list l-limit u-limit) :join-points t)


        4.0

        3.0

        2.0

            1.0

        0.0
                   1.0        2.0        3.0        4.0          5.0        6.0
        -1.0

        -2.0




(setf adj (gen-envelope-tendency data l-limit u-limit :seed 12))
(list-plot adj :zero-based t :point-radius 2 :join-points t)


        3.2

        2.8

        2.4

        2.0

            1.6

            1.2

        0.8

        0.4
                  20     40         60         80         100      120      140
Opusmodus                                            gen-envelope-tendency   4

With optional reflect T:

(setf ref (gen-envelope-tendency data l-limit u-limit
                                 :reflect t :seed 12))

(list-plot ref :zero-based t :point-radius 2 :join-points t)


         3.0

         2.5

         2.0

            1.5

            1.0

         0.5

         0.0
                      20   40   60      80     100       120     140
        -0.5

         -1.0




(setf sm (gen-envelope-tendency data l-limit u-limit
                                :reflect nil :smooth 0.3 :seed 12))

(list-plot sm :zero-based t :point-radius 2 :join-points t)


         2.8

         2.4

         2.0

            1.6

            1.2

         0.8

         0.4
                      20   40   60      80     100       120     140
Opusmodus                                                       gen-envelope-tendency   5

(setf sm-ref (gen-envelope-tendency data l-limit u-limit
                                    :reflect t :smooth 0.3 :seed 12))

(list-plot sm-ref :zero-based t :point-radius 2 :join-points t)


        3.0

        2.5

        2.0

            1.5

            1.0

        0.5

        0.0
                  20     40         60         80         100      120      140
        -0.5

        -1.0




Test:

(setf x-values (vector-range 0.0 6.0 (gen-integer 0 (1- len))))
(setf xy-adj (make-xy x-values adj))

(xy-plot (list xy-adj l-limit u-limit)
         :point-radius 2 :join-points t)


        4.0

        3.0

        2.0

            1.0

        0.0
                   1.0        2.0        3.0        4.0          5.0        6.0
        -1.0

        -2.0
Opusmodus                                          gen-envelope-tendency   6

(setf xy-ref (make-xy x-values ref))

(xy-plot (list xy-ref l-limit u-limit)
         :point-radius 2 :join-points t)


        4.0

        3.0

        2.0

            1.0

        0.0
                  1.0      2.0         3.0   4.0    5.0        6.0
        -1.0

        -2.0
