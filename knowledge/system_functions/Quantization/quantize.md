Opusmodus                                                                       quantize     1

quantize values tuplets &key scale tolerance type
[Function]

Arguments and Values:
values                   a list of oating-point numbers or a list of ratios.
tuplets                  a list of integers (tuplet values: 1 2 3 4 5 6 7 8).
scale                    a oating-point number. The default is 1.0.
tolerance                a oating-point number. The default is 0.05.
type                     :float, :ratio or :symbol. The default is :symbol.

Description:

The function QUANTIZE analyses the duration of each value in the list and returns the best
possible grouping of beats and fractions of beats. This function can process two types of
values floating-point numbers and ratios.

The tuplet division is always 1/4:

1 = 1/4
2 = 1/8
3 = 1/12
4 = 1/16
5 = 1/20
7 = 1/28
8 = 1/32

(setf val1 (gen-noise 19 :seed 56))
=> (0.42731586 0.21048035 0.14944322 0.05199222 0.33933866
    0.8851649 0.93565786 0.93476516 0.3839242 0.03127964 0.39819628
    0.18478736 0.9568939 0.6663358 0.26542348 0.4052874 0.68264747
    0.95090246 0.12790146)

The quantum value below is 1/16, the highest tuplet division.

(quantize val1 '(1 2 4))


                                         2                        3




                                                                                                 Opu
                    fl
                    fl
                         fl
Opusmodus                                                                                          quantize    2

(quantize val1 '(1 2))


                                           2                   3




Quantisation with tuplet 3, 5 and 7:

(quantize val1 '(3 5 7))


                         5                         7                           7               7




                         7             7               7                   7               7
   2        5                                                      3




                                                                                                   Opusmodus




Examples:
(setf val2 (gen-noise 19 :seed 875))
=> (0.2680316 0.62977064 0.8000566 0.07118226 0.48080647 0.91162413
    0.37054113 0.38044393 0.077678494 0.6834224 0.44173545 0.24676743
    0.82285273 0.70530814 0.98304343 0.35411704 0.72126555 0.72865987
    0.6320858)

The keyword :scale will scale the list of values to a given value before the process:

(quantize val2 '(3 4 5 7) :scale 2.2)


                 5                                 7
                                                                       2




   3         5                     7           7           4                       5                5




                     3         7               7                                       3
   5                                                       6




                                                                                                   Opusmodus
Opusmodus                                                                            quantize    3

Same input as above with a scale value 0.7:

(quantize val2 '(3 4 5 7) :scale 0.7)


                      5                      7       5                       7




                                                                                                 Opusmodu

Here we use ratios as input values:

(setf val3 (rnd-sample 19 '(1/8 1/16 1/20 1/24 1/28) :seed 526))
=> (1/28 1/20 1/20 1/28 1/8 1/20 1/24 1/8 1/16 1/28
    1/16 1/28 1/8 1/16 1/24 1/20 1/24 1/28 1/8)

(quantize val3 '(1 2 3 4 5 7))


                                 7       5           7           5       7




                                                                                                      Op
(quantize
 (vector-range -1.0           1.0 (gen-noise 19 :seed 895)) '(3))


              3           3          3           3           3                   3
                                                         2




   3                  3                                              3




                                                                                     Opusmodus
Opusmodus                                                                         quantize    4

(setf values '(0.5 1.0 6.375 -2.125 1.0 3.0 1.125 -0.375 2.5
               2.0 1.125 0.375 5.25 1.75 2.0 2.25 0.75 1.0
               0.5 0.5 1.0 -1.875 0.625 4.5 1.5 1.0 2.0 0.5
               0.5 0.75 0.75 1.0 1.0 0.5 -0.5 0.25 0.25 3.1875
               -1.0625 4.25 0.25 0.25 -0.25 0.25 1.125 0.375
               1.5 0.75 0.75 1.5 -1.125 0.375 0.5 -0.5 1.0 1.0
               2.8125 0.9375 3.75 -0.5 0.5 1.3125 0.4375 1.75))

(quantize values '(1 2 3 4 5 6 7 8))


                                    2                           3




   4                                                        5




   6                      7                             8




   9                      10                       11                    12




   13                                         14




   15           5                        16




   17                          18                                   19




   20       5                       21                                        5




   22



                                                                                  Opusmodus
Opusmodus                                                  quantize   5

Types:

(quantize (gen-noise 19 :seed 56) '(1 2 4) :type :float)
=> (0.5 0.25 0.25 0.25 0.25 1.0 0.75 1.0 0.5 0.25
    0.25 0.25 1.0 0.75 0.25 0.5 0.5 1.0 0.25)

(quantize (gen-noise 19 :seed 56) '(1 2 4) :type :ratio)
=> (1/8 1/16 1/16 1/16 1/16 1/4 3/16 1/4 1/8 1/16
    1/16 1/16 1/4 3/16 1/16 1/8 1/8 1/4 1/16)
