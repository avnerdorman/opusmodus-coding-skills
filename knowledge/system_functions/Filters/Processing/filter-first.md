Opusmodus                                                                                 filter-first   1

filter-first n sequence &key section exclude
[Function]

Arguments and Values:
n                         an integer or list of integers.
sequence                  a list of items.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

This function returns the rst n items in a list. It is a very sophisticated version of the LISP
primitive CAR or FIRST.

(car '(c4 d4 e4 f4 g4 a4))
=> c4

(filter-first 3 '(c4 d4 e4 f4 g4 a4))
=> (c4 d4 e4)


Examples:

Multiple lists can be used, for example - to get the rst three values of each list:

(filter-first 3 '((c4 d4 e4 f4 g4 a4) (c3 d3 e3 f3 g3 a3)))
=> ((c4 d4 e4) (c3 d3 e3))

Or to get the rst three values of the rst list, and only the rst two from the second list:

(filter-first '(3 2) '((c4 d4 e4 f4 g4 a4) (c3 d3 e3 f3 g3 a3)))
=> ((c4 d4 e4) (c3 d3))

Nested sublists will be treated as individual items:

(filter-first '(3 2) '(((a b c) (d e f) (g h i) (j k l))
                       ((1 2 3) (4 5 6) (7 8 9))))
=> (((a b c) (d e f) (g h i)) ((1 2 3) (4 5 6)))

One the most valuable uses for this function is to be able to select the rst note or notes from
a list of lists making it an orchestration tool.
       fi
                   fi
                               fi
                                                 fi
                                                           fi
                                                                         fi
Opusmodus                                                   filter-first   2

(setf motifs
      (gen-divide
       4 (rnd-sample 16 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 46)))
=> ((gs4 d4 c5 d4) (fs4 c5 gs4 gs4)
    (fs4 g4 c5 gs4) (gs4 cs4 cs4 d4))

(setf bass (pitch-transpose -24 (filter-first 1 motifs)))
=> ((gs2) (fs2) (fs2) (gs2))

(setf tenor (pitch-transpose -12 (filter-first '(1 4) motifs)))
=> ((gs3) (fs3 c4 gs3 gs3) (fs3) (gs3 cs3 cs3 d3))
