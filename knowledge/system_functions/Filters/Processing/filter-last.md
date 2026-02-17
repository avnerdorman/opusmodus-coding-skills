Opusmodus                                                                                   filter-last   1

filter-last n sequence &key section exclude
[Function]

Arguments and Values:
n                          an integer or list of integers.
sequence                   a sequence.
section                    an integer or list of integers. Selected list or lists to process.
                           The default is NIL.
exclude                    an integer or list of integers. Excluded list or lists from process.
                           The default is NIL.


Description:

This function returns the last n items in a list. It is a very sophisticated version of the LISP
primitive LAST.

(last '(c4 d4 e4 f4 g4 a4))
=> a4

(filter-last 3 '(c4 d4 e4 f4 g4 a4))
=> (f4 g4 a4)


Examples:

Multiple lists can be used, for example - to get the last three values of each list:

(filter-last 3 '((c4 d4 e4 f4 g4 a4) (c3 d3 e3 f3 g3 a3)))
=> ((f4 g4 a4) (f3 g3 a3))

Or to get the last three values of the rst list, and only the last two from the second list:

(filter-last '(3 2) '((c4 d4 e4 f4 g4 a4) (c3 d3 e3 f3 g3 a3)))
=> ((f4 g4 a4) (g3 a3))

Nested sublists will be treated as individual items:

(filter-last '(3 2) '(((a b c) (d e f) (g h i) (j k l))
                      ((1 2 3) (4 5 6) (7 8 9))))
=> (((d e f) (g h i) (j k l)) ((4 5 6) (7 8 9)))

One the most valuable uses for this function is to be able to select the last note or notes from
a list of lists making it an orchestration tool.
                                fi
Opusmodus                                                    filter-last   2

(setf motifs
      (gen-divide
       4 (rnd-sample 16 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 857)))
=> ((g4 c4 fs4 cs4) (d4 c5 cs4 g4)
    (gs4 c4 fs4 c5) (d4 d4 c4 g4))

(setf bass (pitch-transpose -24 (filter-last 1 motifs)))
=> ((cs2) (g2) (c3) (g2))

(setf tenor (pitch-transpose -12 (filter-last '(1 4) motifs)))
=> ((cs3) (d3 c4 cs3 g3) (c4) (d3 d3 c3 g3))
