Opusmodus                                                                         gen-deviation      1

gen-deviation data lower upper &key prob seed
[Function]

Arguments and Values:
data                    A list of numbers. These serve as the base numbers to which the random
                        number deviations are added.
lower                   This parameter de nes the lower limit of the range within which the random
                        deviations are generated. The actual random number generated can be equal
                        to or greater than this lower limit.
upper                   This parameter de nes the upper limit of the range within which the random
                        deviations are generated. The actual random number generated can be equal
                        to or less than this upper limit.
prob                    Optional parameter with a default value of 0.5. This is a oating-point
                        number ranging between 0.0 and 1.0, which affects the distribution
                        of the generated random number within the speci ed range. A lower value for
                        this parameter increases the likelihood of selecting a lower number within
                        the given range, while a higher value favours the selection of higher numbers.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

The GEN-DEVIATION function will generate random numbers between lower and
upper (inclusive) and add them to the corresponding numbers in the data list. The range
of random numbers is de ned by lower and upper, so the actual value of the random
number added to each element in data can be any number within this range.
                 fi
                                  fi
                                  fi
                                                fi
                                                                 fi
                                                                          fl
Opusmodus                                                    gen-deviation   2

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
                20      40      60      80     100     120       140




(list-plot (gen-deviation data 0.1 0.3 :seed 43)
           :zero-based t :point-radius 2 :join-points t)


        1.30

        1.20

        1.10

        1.00

       0.90

       0.80

       0.70

       0.60
                20      40      60      80     100     120       140
Opusmodus                                                    gen-deviation   3

(list-plot (gen-deviation data 0.1 0.3 :prob 0.1 :seed 43)
           :zero-based t :point-radius 2 :join-points t)


        1.30

        1.20

        1.10

        1.00

       0.90

       0.80

       0.70

       0.60
                20      40      60      80     100     120       140




(list-plot (gen-deviation data 0.1 0.3 :prob 0.9 :seed 43)
           :zero-based t :point-radius 2 :join-points t)


        1.30

        1.20

        1.10

        1.00

       0.90

       0.80

       0.70

       0.60
                20      40      60      80     100     120       140
Opusmodus                                                     gen-deviation   4

(list-plot (gen-deviation data -0.1 0.5 :prob 0.1 :seed 43)
           :zero-based t :point-radius 2 :join-points t)


            1.5
            1.4
            1.3
            1.2
            1.1
            1.0
            0.9
            0.8
            0.7
            0.6
            0.5
            0.4
                       20    40   60    80     100     120        140




(list-plot (gen-deviation data -0.1 0.5 :prob 0.9 :seed 43)
           :zero-based t :point-radius 2 :join-points t)


     1.5
     1.4
     1.3
     1.2
      1.1
     1.0
     0.9
     0.8
     0.7
     0.6
     0.5
     0.4
                  20        40    60    80      100      120            140
