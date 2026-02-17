Opusmodus                                                                       gen-crossover     1

gen-crossover list1 list2 &key encode seed
[Function]

Arguments and Values:
list1                     a list.
list2                     a list.
encode                    T or NIL. With :encode T (the default) the function transforms OMN repeat
                          symbols (=) into its values, while :encode NIL returns
                          selections unchanged.
seed                      NIL or an integer. The default is NIL.


Description:

This function returns two child lists from the parent lists, at random.

(gen-crossover
 '(c4 d4 e4 f4 g4 a4) '(cs4 ds4 fs4 gs5 as4))
=> ((gs5 as4) (cs4 ds4 fs4 c4 d4 e4 f4 g4 a4))


Examples:
(setf mat1 '((c4 d4 e4 f4 g4 a4) (cs4 ds4 fs4 gs5 as4)))

(setf mat2 (pitch-invert mat1))
=> ((c4 bb3 gs3 g3 f3 eb3) (cs4 b3 gs3 fs2 e3))

(gen-crossover mat1 mat2 :seed 65)
=> ((c4 gs3 g3 f3 eb3) (c4 bb3 d4 e4 f4 g4 a4)
    (cs4 ds4 e3) (cs4 b3 gs3 fs2 fs4 gs5 as4))

Lengths and dynamics can also be processed this way:

(gen-crossover
 '(f f f mf ff) '(p p p mp pp p) :seed 21)
=> ((f p p mp pp p) (p f f mf ff))

(gen-crossover
 '(e = = = q =) '(s = = = e s = h) :seed 34)
=> ((e = = h) (s = = = e s = e q =))
Opusmodus                                                  gen-crossover   2

Crossover of sine and triangle wave:

(list-plot
 (gen-crossover (gen-loop 4 (gen-sine 120 1 0.5))
                (gen-loop 4 (gen-triangle 120 1 0.5)) :seed 56))




OMN:

(gen-crossover
 '((s bb3 p a3 mp g3) (s a3 f c4 f4 a4 pp))
 '((-q s bb4 c5 p b4 c5 mf) (s d5 eb5 fff f5 eb5 d5)) :seed 45)
=> ((s bb3 p a3 mp c5 p b4 c5 mf) (-q s bb4 mf g3 mp)
    (s eb5 fff f5 eb5 d5) (s d5 mf a3 f c4 f4 a4 pp))
