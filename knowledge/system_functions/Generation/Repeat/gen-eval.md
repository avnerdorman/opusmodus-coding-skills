Opusmodus                                                                                gen-eval   1

gen-eval count form &key seq seed
[Function]

Arguments and Values:
count                     an integer. Number of times to execute a function.
form                      a form to execute.
seq                       T (assemble a sequence from multi-sublists) or NIL. The default is NIL.
seed                      an integer or NIL. The default is NIL.


Description:

GEN-EVAL is a powerful and fundamental function. It can be used to execute a form
multiple times. It's a very elegant and useful function when creating variations from a single
single process that has a randomising element.

(gen-eval 4 '(rnd-sample 4 '(1 2 3 4 5)))
=> ((5 2 3 2) (5 3 3 5) (2 4 4 4) (2 2 2 4))

This generates four random picks, of four items each from the list '(1 2 3 4 5). We could
nest other functions also within our code:

(gen-eval 4 '(rnd-sample 4 (gen-integer 1 5)))
=> ((1 2 4 4) (3 2 5 2) (3 5 4 5) (2 4 3 4))

This gives us the same result, but our list is being created by GEN-INTEGER. We could also
randomise the ranges that GEN-INTEGER generates:

(gen-eval 4 '(rnd-sample 4 (flatten
                            (gen-integer
                             (rndn 1 -5 10)
                             (rndn 1 -5 10)))))
=> ((1 6 4 0) (10 7 9 10) (3 2 1 7) (-2 0 0 0))

A random seed can be used to generate consistent output.

(gen-eval 4 '(rnd-sample 4 (flatten
                            (gen-integer
                             (rndn 1 -5 10)
                             (rndn 1 -5 10))))
          :seed 23)
=> ((2 2 4 4) (0 2 1 0) (2 2 1 0) (9 10 10 10))
Opusmodus                                                                          gen-eval      2

Examples:

Here's an example of GEN-EVAL being used to prepare the material for a short duo for two
wind instruments. The random sample made from 10 selections of the 5-note pattern is
executed 5 times in all and collect together in 5 lists. If you want to gather them all into a
single list, then add the LISP primitive FLATTEN to the expression.

(setf flute-mel (gen-eval 5 '(rnd-sample 10 '(c4 cs4 fs4 g4 c5))))
=> ((cs4 fs4 c5 g4 c5 fs4 fs4 c5 c5 g4)
    (g4 g4 fs4 c4 c5 c5 fs4 c4 fs4 c5)
    (cs4 c4 c4 cs4 c5 c5 c5 cs4 c4 cs4)
    (c5 g4 c5 fs4 fs4 c5 c5 g4 c4 c4)
    (fs4 c4 c5 c5 fs4 c4 fs4 c5 c4 cs4)))

(gen-eval 3 '(binary-rhythm
              (rnd-sample 8 '(8 8 5))
              (rnd-order (fibonacci 8 15))
              (rnd-sample 16 '(q e 5h))
              :type (rnd-sample 16 '(1 2 3)) :variant '?)
          :seq t)
=> ((3/8 1/8 1/4 1/4) (1/4 1/4 1/4 -1/4 1/4 1/4 -1/2)
    (1/10 -1/10 1/10 1/10 1/10) (-1/5 1/10 1/5)
    (1/10 1/10 1/10 1/5) (3/10 1/5) (-3/8 1/4 1/4 1/8)
    (-1/4 1/4 1/4 -1/4 1/4 -3/4) (1/8 1/8 1/8 -1/8 1/8 1/8 -1/4)
    (3/4 1/4 1/4 1/4 1/2) (1/10 1/10 1/5 1/10) (1/10 2/5)
    (-1/10 1/10 3/10) (1/10 1/10 1/10 1/10 -1/10)
    (1/8 -1/4 1/8 -1/8 1/8 1/8 1/8) (1/4 -1/4 1/4 -1/4 1/4 -3/4)
    (1/8 1/8 1/4 1/8 3/8) (1/4 1/4 1 1/2) (-1/10 1/10 3/10)
    (1/10 1/10 1/10 1/10 -1/10) (1/10 1/10 -1/5 1/10)
    (-1/10 1/10 -1/5 1/10) (-1/8 1/2 3/8) (1/4 1/4 1/2 1/2 1/2))
