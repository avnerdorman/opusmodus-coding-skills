Opusmodus                                                                      gen-length-cartesian        1

gen-length-cartesian low high divide rest measure
                                         size count tuplet &key prob seed

[Function]

Arguments and Values:
low                          The lower bound for the generated lengths.
high                         The upper bound for the generated lengths.
divide                       The division type for the generated lengths: 'n (none), 'd (divide)
                             or '? (at random).
rest                         Speci es the rest type in the generated lengths. Rest type position: s (start),
                             'e (end), 'c (centre), 'o (outer), '? (at random) or 'n (none) symbol.
measure                      tuplet span.
size                         The number of groups lengths to generate.
count                        The number of lengths to generate.
tuplet                       A list specifying the tuplet values.
prob                          Optional parameter with a default value of 0.5. This is a oating-point
                              number ranging between 0.0 and 1.0, which affects the distribution
                              of the generated random number within the speci ed range. A lower value for
                              this parameter increases the likelihood of selecting a lower number within
                              the given range, while a higher value favours the selection of higher numbers.
seed                          This is an integer that guarantees consistent results each time the code is
                              evaluated. By providing a speci c seed, you can ensure that the randomness in
                              your code is reproducible. The default value for seed is NIL, which means the
                              seed is not set, resulting in different outputs on each run due to natural
                              randomness.


Description:

In mathematics, a Cartesian product is a mathematical operation which returns a set (or
product set) from multiple sets. That is, for sets A and B, the Cartesian product A × B is the
set of all ordered pairs (a,b) where a ∈ A and b ∈ B.

The GEN-LENGTH-CARTESIAN function is a complex function designed for generating
length material with a speculative edge. It takes a variety of parameters to control the
generation process, including lower and upper bounds, division types, rest types,
and measure types. The function also allows for optional randomization through a
probability parameter and a seed for random number generation. The term ‘Cartesian'
in the function name likely refers to the concept of the Cartesian product. In the context of
this function, the Cartesian product is used to generate all possible combinations of lengths
based on the given parameters.

In simpler terms, the function takes a list of tuplet values (e.g., (1 2 3 4 5 6)) and
generates all possible combinations of these values that meet certain conditions, such as a
                        fi
                                                     fi
                                                                       fi
                                                                               fl
     Opusmodus                                                            gen-length-cartesian       2

     speci c count and size. The Cartesian product allows the function to explore a wide
     range of possibilities, making it versatile for generating complex rhythms or sequences in
     music composition.

     (gen-length-cartesian
       1            ; lower multiplier 1
       1            ; upper multiplier 1
      'n            ; no division
      'n            ; no rests
      'q            ; tuplet span 1/4
       2            ; group count 2
       7            ; length values count 7
      '(1 2 3 4 5)) ; tuplet size

     => ((s s s s 3q 3q 3q))
     or ((3q 3q 3q s s s s))
     or ((5q 5q 5q 5q 5q e e))
     or ((e e 5q 5q 5q 5q 5q))


     Examples:
     (gen-length-cartesian 1 1 'n 'n 'q '(2 3) '(13 4)
                           '(1 2 3 4 5 6) :seed 24)

                                            3   3    5    2




                                                                                                         Opusm

     In the following example the rest is set to '? (random position):

     (gen-length-cartesian 1 1 'n '? 'q '(2 3) '(13 4)
                           '(1 2 3 4 5 6) :seed 24)


                                     3     3         5
                                                              2




                                                                                         Opusmodus

     Cartesian mathematics has been used to create a function that can produce ordered phrases of
     note-lengths. It's strength is its ability to match lengths of pitch phrases. For example:

     (setf pitch (gen-divide '(2 5 7) (rnd-sample 20 '(c4 cs4 fs4 g4 c5))))
     => ((g4 fs4) (cs4 cs4 g4 cs4 c5)
         (cs4 fs4 c5 g4 c5 fs4 fs4)
         (c5 c5) (g4 c4 c4 cs4))
fi
     Opusmodus                                                                            gen-length-cartesian     3

     Note the use of MCLENGTH enable the division of list lengths to be automated rather than
     physically counted. The little routine lies at the very heart of ef cient composing with
     OPUSMODUS.

     (setf group (mclength pitch))
     => (2 5 7 2 4)

     (gen-length-cartesian
      1 1 'n 'n 'q '(2 3) group '(1 2 3 4) :seed 12)

                                    2            3       3            4           5




                                                                                                             Opusmodus
     (gen-length-cartesian
      1 1 '? '? 'q '(2 3) group '(1 2 3 4) :seed 12)

                                                     3                                        3
                                2                3                            4       5




                                                                                        Opusmodus
     Above the change has been been made to the rest-value. This populates phrases with rest-
     lengths.

     Let's now make a few changes to this code to produce changes to these note-length phrases.

     (gen-length-cartesian 1 2 '? '? 'e '(2 3) group '(1 2 3 4) :seed 12)

                     2                  3            4                5                   6




                                                                                                      Opusmodus


     (gen-length-cartesian 1 1 'n 's 'q '(2 3) group '(1 4 5) :seed 12)

                                                             5
                         2                   3                            4               5




                                                                                                       Opusmodus

     Notice that the last argument is a group of tuplet sizes '(1 4 5), and that this is now
     re ected in the output.
fl
                                                                 fi
