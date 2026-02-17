Opusmodus                                                                           gen-population   1

gen-population n low high &key prob seed
[Function]

Arguments and Values:
n                         an integer.
low                       an integer.
high                      an integer.
prob                      a oating number between 0.1 and 1.0. The default is 0.5.
seed                      an integer. Ensures the same result each time the code is evaluated.
                          The default is NIL.


Description:

This function returns a random population with n members. Each list will contain a number
of elements between low and high. This function is a good companion to the GEN-
MUTATE-POPULATION function.

(gen-population 5 3 7)
=> ((0.90582407 0.7367482 0.124813005 0.33027437)
    (0.8325021 0.6972312 0.26670563 0.4965252
     0.4826759 0.47620994 0.39025214)
    (0.22892939 0.8372109 0.48169407)
    (0.36612493 0.0064324867 0.060197182 0.02891716 0.9765084)
    (0.80423903 0.92174375 0.92487365 0.4228484 0.50835586 0.8373221))



Examples:

Select the three expressions below and evaluate to see the result of the evaluation:

(setf mutation (gen-mutate-population
                 (gen-population 64 3 7) :prob 0.3 :seed 34))
(setf ambitus
      (gen-ambitus-series
       '(-30 42)
       (add-triangle-waves
        4 64 4 0.6 :modulation (gen-triangle 64 1 0.4 :phase 60))
       (add-triangle-waves
        2 64 4 0.4 :modulation (gen-triangle 64 5 0.1 :phase 45))))

(make-omn :length '(s)
          :pitch (vector-to-pitch ambitus mutation)
          :velocity (gen-dynamic '(12 12 12 12) '(p f ff mf) :end 'mp)
          :span :pitch)
                     fl
