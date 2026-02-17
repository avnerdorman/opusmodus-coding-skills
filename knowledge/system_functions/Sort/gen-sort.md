Opusmodus                                                                                gen-sort   1

gen-sort sequence &key type sort step seed omn
[Function]

Arguments and Values:
sequence                 a sequence.
type                     selection, insertion, min-max and NIL. The default is NIL.
sort                     'a (ascending), 'd (descending) or '? (at random) . The default is 'a.
step                     an integer (number of steps).
seed                     an integer or NIL. The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The function GEN-SORT sorts a sequence with a given :type function and returns all
the generation of the sorting process.

(setf seq (rnd-order (gen-integer 11) :seed 49))
=> (5 11 4 1 2 0 7 10 9 8 3 6)

(gen-sort seq)
=> ((5 11 4 1 2 0 7 10 9 8 3 6) (5 4 11 1 2 0 7 10 9 8 3 6)
    (5 4 1 11 2 0 7 10 9 8 3 6) (5 4 1 2 11 0 7 10 9 8 3 6)
    (5 4 1 2 0 11 7 10 9 8 3 6) (5 4 1 2 0 7 11 10 9 8 3 6)
    (5 4 1 2 0 7 10 11 9 8 3 6) (5 4 1 2 0 7 10 9 11 8 3 6)
    (5 4 1 2 0 7 10 9 8 11 3 6) (5 4 1 2 0 7 10 9 8 3 11 6)
    (5 4 1 2 0 7 10 9 8 3 6 11) (4 5 1 2 0 7 10 9 8 3 6 11)
    (4 1 5 2 0 7 10 9 8 3 6 11) (4 1 2 5 0 7 10 9 8 3 6 11)
    (4 1 2 0 5 7 10 9 8 3 6 11) (4 1 2 0 5 7 9 10 8 3 6 11)
    (4 1 2 0 5 7 9 8 10 3 6 11) (4 1 2 0 5 7 9 8 3 10 6 11)
    (4 1 2 0 5 7 9 8 3 6 10 11) (1 4 2 0 5 7 9 8 3 6 10 11)
    (1 2 4 0 5 7 9 8 3 6 10 11) (1 2 0 4 5 7 9 8 3 6 10 11)
    (1 2 0 4 5 7 8 9 3 6 10 11) (1 2 0 4 5 7 8 3 9 6 10 11)
    (1 2 0 4 5 7 8 3 6 9 10 11) (1 0 2 4 5 7 8 3 6 9 10 11)
    (1 0 2 4 5 7 3 8 6 9 10 11) (1 0 2 4 5 7 3 6 8 9 10 11)
    (0 1 2 4 5 7 3 6 8 9 10 11) (0 1 2 4 5 3 7 6 8 9 10 11)
    (0 1 2 4 5 3 6 7 8 9 10 11) (0 1 2 4 3 5 6 7 8 9 10 11)
    (0 1 2 3 4 5 6 7 8 9 10 11))


Examples:

In the rst part of the document we visualise the results of the different types using the
LIST-PLOT function.

(setf values (rndn 20 1 10))
=> (1 5 1 7 9 6 7 4 4 1 8 9 4 10 6 4 3 4 10 9)
fi
        s﻿
Opusmodus                                        gen-sort   2

:type NIL (bubble sort):

(list-plot
 (flatten (gen-sort values))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :sort 'd))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                            gen-sort   3

Each sort generation (ascending or descending) selected at random:

(list-plot
 (flatten (gen-sort values :sort '? :seed 1345))
 :zero-based t :point-radius 1 :join-points t)




Five step process:

(list-plot
 (flatten (gen-sort values :step 5))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                  gen-sort   4

(list-plot
 (flatten (gen-sort values :sort 'd :step 5))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :sort '? :step 5 :seed 1345))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                gen-sort   5

Examples with :type 'selection:

(list-plot
 (flatten (gen-sort values :type 'selection))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type 'selection :sort 'd))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                      gen-sort   6

(list-plot
 (flatten (gen-sort values :type 'selection :sort '? :seed 1345))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type 'selection :step 5))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                        gen-sort   7

(list-plot
 (flatten (gen-sort values :type 'selection :sort 'd :step 5))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type ‘selection
                           :sort '? :step 5 :seed 1345))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                gen-sort   8

Examples with :type 'insertion:

(list-plot
 (flatten (gen-sort values :type 'insertion))
:zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type 'insertion :sort 'd))
:zero-based t :point-radius 1 :join-points t)
Opusmodus                                                      gen-sort   9

(list-plot
 (flatten (gen-sort values :type 'insertion :sort '? :seed 1345))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type 'insertion :step 5))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                        gen-sort   10

(list-plot
 (flatten (gen-sort values :type 'insertion :sort 'd :step 5))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values :type 'insertion
                    :sort '? :step 5 :seed 1345))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                     gen-sort   11

Examples with :type 'min-max:

(setf values2 (rndn 50 1 50))
=> (22 22 13 19 33 20 10 28 28 46 21 29 10 31 4 40 21 34
    5 34 23 16 40 6 3 11 12 17 11 40 46 32 18 4 8 22 24
    13 28 2 36 41 32 30 38 37 37 25 32 25)

(list-plot (flatten (gen-sort values2 :type 'min-max))
 :zero-based t :point-radius 1 :join-points t)




(list-plot (flatten (gen-sort values2 :type 'min-max :sort 'd))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                     gen-sort   12

(list-plot
 (flatten (gen-sort values2 :type 'min-max :sort '? :seed 1345))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values2 :type 'min-max :step 5))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                       gen-sort   13

(list-plot
 (flatten (gen-sort values2 :type 'min-max :sort 'd :step 5))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values2 :type 'min-max :sort '? :step 5 :seed 1345))
  :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                               gen-sort    14

Examples with :type 'divide and division values:

By default there are three division lists '((2 3 4) (5 7 11) (17 11)) but you can
use any number of list devisions.

(list-plot (flatten (gen-sort values2 :type 'divide))
 :zero-based t :point-radius 1 :join-points t)




(list-plot (flatten (gen-sort values2 :type 'divide :sort 'd))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                     gen-sort   15

(list-plot
 (flatten (gen-sort values2 :type 'divide :sort '? :seed 1345))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values2 :type 'divide :step 5))
 :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                     gen-sort   16

(list-plot
 (flatten (gen-sort values2 :type 'divide :sort 'd
                            :division '((2 3 5) (6 13)))
 :zero-based t :point-radius 1 :join-points t)




(list-plot
 (flatten (gen-sort values2 :type 'divide :sort '?
                            :division '((3 6) (6 9) (2 4 6) (11 13))
  :zero-based t :point-radius 1 :join-points t)
Opusmodus                                                                  gen-sort   17

The next few examples are with pitches and lengths values:

(gen-sort (rnd-air :type :pitch) :step 6)
=> ((c4 cs4 bb4 d4 a4 b4 f4 eb4 gs4 e4 g4 fs4)
    (c4 cs4 d4 a4 bb4 f4 eb4 b4 gs4 e4 g4 fs4)
    (c4 cs4 d4 a4 bb4 f4 eb4 gs4 e4 g4 fs4 b4)
    (c4 cs4 d4 a4 f4 eb4 gs4 e4 bb4 g4 fs4 b4)
    (c4 cs4 d4 f4 eb4 a4 gs4 e4 g4 fs4 bb4 b4)
    (c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4))

(gen-sort (rnd-air :type :pitch) :type 'divide)

(gen-sort '(c2 d4 e3 g6 f5 c2 d4 e3 g6 f5)
         :type 'divide :seed 56 :division '((2 3) (1 3 6)))
=> ((c2 d4 e3 g6 f5 c2 d4 e3 g6 f5) (c2 d4 e3 f5 g6 c2 d4 e3 f5 g6)
    (c2 e3 d4 f5 c2 e3 d4 f5 g6 g6) (c2 c2 e3 e3 d4 d4 f5 f5 g6 g6))

(gen-sort '(s e e e s q q. s e e e s q q.)
          :type 'divide :division '((2 3) (4)) :omn t)
=> ((s e = = s q q. s e = = s q q.) (s e s e = q q. s e = s e q q.)
    (s = e = s e q q. s e = = q q.) (s = = = e = = = = = q = q. =))

Making OMN:
(make-omn
 :pitch (setf n (gen-sort
                 (vector-to-pitch '(c4 bb5) (gen-noise 24))
                 :type 'min-max :step 5))
 :length (gen-repeat (length n)
                     (append (gen-repeat 24 '(t)) (list '-e)))
 )

(make-omn
 :pitch (setf n (gen-sort
                 (vector-to-pitch '(c4 bb5) (gen-noise 24))
                 :type 'divide :sort '? :step 5
                 :division '((2 3 4) (3 4))))
 :length (gen-repeat (length n)
                     (append (gen-repeat 24 '(t)) (list '-e)))
 )

To explore the expressions and to see scores using the GEN-SORT function go to How-to/
Sort/Sorting.opmo le which you nd in the Assistant Documents panel.
                   fi
                                 fi
