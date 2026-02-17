Opusmodus                                                                               gen-loop   1

gen-loop count form &key seq seed
[Macro]

Arguments and Values:
count                   The number of times the form should be evaluated.
form                    The form (expression) to be evaluated each time.
seq                     (optional keyword argument): If non-nil, the results will be processed
                        using the assemble-seq function. The default is NIL.
seed                    (optional keyword argument): An initial seed value for random number
                        generation. The default is NIL.


Description:

The GEN-LOOP macro is designed to generate a list of values by repeatedly evaluating a
given form a speci ed number of times. Additionally, it provides options to initialise a
random sequence and to process the results through a speci ed sequence assembly function.

(gen-loop 4 (rnd-sample 4 '(1 2 3 4 5)))
=> ((5 2 3 2) (5 3 3 5) (2 4 4 4) (2 2 2 4))

This generates four random picks, of four items each from the list '(1 2 3 4 5). We could
nest other functions also within our code:

(gen-loop 4 (rnd-sample 4 (gen-integer 1 5)))
=> ((1 2 4 4) (3 2 5 2) (3 5 4 5) (2 4 3 4))

This gives us the same result, but our list is being created by GEN-INTEGER. We could also
randomise the ranges that GEN-INTEGER generates:

(gen-loop 4 (rnd-sample 4 (flatten
                           (gen-integer
                            (rndn 1 -5 10)
                            (rndn 1 -5 10)))))
=> ((2 -1 3 4) (2 2 2 2) (-3 -2 -1 -5) (-2 -1 -4 -4))

A random seed can be used to generate consistent output.

(gen-loop 4 (rnd-sample 4 (flatten
                           (gen-integer
                            (rndn 1 -5 10)
                            (rndn 1 -5 10))))
          :seed 23)
=> ((2 2 4 4) (0 2 1 0) (2 2 1 0) (9 10 10 10))
            fi
                                                       fi
Opusmodus                                                                        gen-loop    2

Examples:
(gen-loop 5 (rnd-sample 10 '(c4 cs4 fs4 g4 c5)))
=> ((c5 fs4 cs4 c4 c4 cs4 c5 c5 c5 cs4)
    (c5 g4 g4 fs4 c4 c5 c5 fs4 c4 fs4)
    (cs4 fs4 c5 g4 c5 fs4 fs4 c5 c5 g4)
    (fs4 cs4 c4 c4 cs4 c5 c5 c5 cs4 c4)
    (g4 g4 fs4 c4 c5 c5 fs4 c4 fs4 c5))

(gen-loop 5 (gen-length-cartesian
             1 2 'd '? 'q '(2 3) '(13 4) '(1 2 3 4 5 6))
         :seq t :seed 46)


            5   3   5                               3       5   5
                            2               3                            4




                3       3                                            3           3
  5                             6                       7                    3




                                    3           3
  8                 9       3                                   10




                                                                                 Opusmodus




(setf hexachord '(d4 eb4 fs4 g4 a4 bb4))

(setf chords (gen-chord-series
              hexachord hexachord
              :type '?
              :width '(30 24 36 12)
              :segment t))

(gen-loop 4 (polygon-rhythm 5 16 '? :pitch chords :velocity '(f)))




                                                2




  3                                     4




                                                                                 Opusmodus
Opusmodus                                                                         gen-loop    3

You might see a ‘Compiler Warning’ message in the Listener panel similar to one below, it is
not an error just a warning about undeclared free variable - you can ignore that message.

(setf sin
      (list-plot
       (gen-loop
        4 (gen-sine
           16 (rndn 1 1 3) '(0.5 0.2 0.1)
           :modulation (gen-sine 32 1 (rndn 1 .1 .8) :phase 90)))
       :join-points t))


      0.50.5

      0.40.4

      0.30.3

      0.20.2

      0.10.1

      0.00.0
                 22       44        66        88        10
                                                         10       12
                                                                   12       14
                                                                             14       16
                                                                                       16
   -0.1-0.1

   -0.2-0.2

   -0.3-0.3

   -0.4-0.4

   -0.5-0.5




(vector-to-pitch '(c3 c6) sin)




  2




  3




  4




                                                                                  Opusmodus
