Opusmodus                                                                               gen-prob   1

gen-prob count prob &key list seed
[Function]

Arguments and Values:
count                    an integer.
prob                     a sequence of lists of paired values(<element><prob-value>).
list                     T to NIL. The default is NIL.
seed                     an integer - ensure the same result each time the code is evaluated.
                         The default is NIL.


Description:

GEN-PROB can be used to generate lists based on a series of probability values.

(gen-prob 10 '((ff 0.456) (mp 0.623)) :seed 863)
=> (mp mp ff mp ff mp ff ff mp ff)

In the example above, the velocity ff has a probability of 0.456, and mp has a probability
of 0.623, so we would expect mp to be more prevalent in the output.


Examples:
(sieve-tree '(4 2)
            '((2 0.43) (3 0.37))
            '((3 0.47) (4 0.56) (5 0.68))
            :rest '((20 0.43) (80 0.6) (0 0.7))
            :quantize '(1 2 3 4 5 8)
            )
Opusmodus                                                      gen-prob   2

(setf mat (gen-prob 100 '((c4 0.34)
                          (d4 0.29)
                          (e4 0.38)
                          (f4 0.19)
                          (g4 0.285)) :seed 45))




(pitch-list-plot mat :style :axis :point-radius 2 :join-points nil)
Opusmodus                                       gen-prob   3

Example with lists:

(gen-prob 10 '(((5e = = = =) .452)
               ((h) .384)
               ((e = s = = =) .2453)
               ((q - q - e =) .394)) :list t)
