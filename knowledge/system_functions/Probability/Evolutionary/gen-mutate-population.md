Opusmodus                                                                  gen-mutate-population   1

gen-mutate-population lists &key prob count seed
[Function]

Arguments and Values:
lists                     a list of oating numbers.
prob                      a oating number (mutation probability). The default is 0.5.
count                     an integer. Number of possible mutation.
seed                      an integer. Ensures the same result each time the code is evaluated.
                          The default is NIL.


Description:

The GEN-MUTATE-POPULATION function will randomly select some of the population to
be mutated. This function takes a population in the form of a list of lists, and is a companion
to the GEN-POPULATION function.

(setf population (gen-population 5 3 7 :seed 56))
=> ((0.9078272 0.05199222 0.95386976 0.5921951 0.93476516)
    (0.19755594 0.18478736 0.18754587 0.2855475 0.4052874)
    (0.6416326 0.86454636 0.3624713 0.95245343 0.33112416 0.49055362)
    (0.76038295 0.25854617 0.27156326 0.36454925)
    (0.17618607 0.38432425 0.37086514 0.33166522))

(gen-mutate-population population :seed 65 :prob 0.7 :count '(1 2))
=> ((0.9078272 0.05199222 0.95386976 0.5921951 0.93476516)
    (0.19755594 0.18478736 0.18754587 0.2855475 0.95762116)
    (0.6416326 0.86454636 0.7794389 0.95245343 0.33112416 0.49055362)
    (0.76038295 0.25854617 0.9568939 0.36454925)
    (0.17618607 0.38432425 0.26542348 0.33166522))
                     fl
                           fl
Opusmodus                                                            gen-mutate-population   2

Examples:

Select the three expressions below and evaluate to see the result of the evaluation:

(setf mutation (gen-mutate-population
                 (gen-population 64 3 7) :prob 0.4 :seed 34))
(setf ambitus
      (gen-ambitus-series
       '(-30 42)
       (add-triangle-waves
        4 64 4 0.6 :modulation (gen-triangle 64 1 0.4 :phase 60))
       (add-triangle-waves
        2 64 4 0.4 :modulation (gen-triangle 64 5 0.1 :phase 45))))

(make-omn :length '(s)
          :pitch (vector-to-pitch ambitus mutation)
          :span :pitch)
