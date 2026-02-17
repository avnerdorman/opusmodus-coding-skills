Opusmodus                                                                    trim-with-last     1

trim-with-last n sequence &key encode section exclude
[Function]

Arguments and Values:
n                       an integer.
sequence                a list of items.
encode                  T or NIL. With :encode T (the default) the function transforms OMN repeat
                        symbols (=) into its values, while :encode NIL returns selections
                        unchanged.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

This function returns a list of length n, consisting of the elements of the sequence,
followed by repetitions of the last element of the sequence, if the sequence is shorter
than n.


Examples:
(trim-with-last 5 '(1 2 3 4 5 6))
=> (1 2 3 4 5)

(trim-with-last 12 '(1 2 3 4 5 6))
=> (1 2 3 4 5 6 6 6 6 6 6 6)

(trim-with-last 12 '(c4 g4c5 g4e5 c4 g3 a3 b3))
=> (c4 g4c5 g4e5 c4 g3 a3 b3 b3 b3 b3 b3 b3)

OMN:

(trim-with-last 6 '(q c4 mf e d4 e4))
=> (q c4 mf e d4 e4 e4 e4 e4)

(trim-with-last '(4 4) '((e c4 mf d4) (e e4 mf s f4 g4)))
=> ((e c4 mf d4 d4 d4) (e e4 mf s f4 g4 g4))
