Opusmodus                                                                        gen-sieve   1

sieve-tree root node level &key rest rnd-order quantizer
[Function]

Arguments and Values:
root                     a number or list of numbers.
node                     an integer 2 and 3 or a lists of paired values(<number><probability>).
level                    an integer or a lists of paired values(<number><probability>).
rest                     NIL or a lists of paired values(<percentage><probability>)
rnd-order                T to NIL. The default is T.
quantize                 NIL or list of numbers. The default is '(1 2 3 4 5 6 7 8).


Description:

This function returns a sequence of lengths symbols derived from tree-data in a given root,
node and level number.


Examples:

Low density output:

(sieve-tree 32 2 3)
Opusmodus                                                                     gen-sieve    2

With a smaller root number and a higher level number we increase the density:

(sieve-tree 8 2 5)




In the following example we add probability values using lists of paired values to node,
level and :rest parameters. The rst value in the :rest lists is a percentage value of
the length-rests in a node-level list.

(sieve-tree '(4 2)
            '((2 0.43) (3 0.37))
            '((3 0.47) (4 0.56) (5 0.68))
            :rest '((20 0.43) (80 0.6) (0 0.7))
            :quantize '(1 2 3 4 5 7))
                             fi
Opusmodus                                                                        gen-sieve   3

Here we are increasing the length-rest probability and set the :quantize to quarter, eight
and quintuplet only:

(sieve-tree '(4 2)
            '((2 0.43) (3 0.37))
            '((3 0.47) (4 0.56) (5 0.68))
            :rest '((20 0.43) (80 0.6) (90 0.7))
            :quantize '(1 2 5))




The expression below will generate 96 bars of gradual increase in the density:

(sieve-tree 96 2 7 :seed 43)
Opusmodus                                                                      gen-sieve      4

Let’s examine the original tree-data from the expression above. To do that we call the GEN-
SIEVE-TREE function with the same tree values:

(gen-sieve-tree 96 2 7)
=> (((3/4 3/4) (1/2 1/2 1/2))
    ((1) (1/2 1/2) (1/3 1/3 1/3))
    ((1 1))
    ((1/2 1/2) (1/3 1/3 1/3))
    ((2/3) (1/3 1/3) (2/9 2/9 2/9))
    ((1 1) (2/3 2/3 2/3))
    ((1/2 1/2) (1/3 1/3 1/3))
    ((2/3) (1/3 1/3) (2/9 2/9 2/9))
    ((2/3 2/3)) ((1/3 1/3) (2/9 2/9 2/9))
    ((4/9) (2/9 2/9) (4/27 4/27 4/27))
    ((1 1) (2/3 2/3 2/3)) ((4/3) (2/3 2/3) (4/9 4/9 4/9))
    ((1/2 1/2) (1/3 1/3 1/3)) ((2/3) (1/3 1/3) (2/9 2/9 2/9))
    ((2/3 2/3)) ((1/3 1/3) (2/9 2/9 2/9)) ((4/9) (2/9 2/9)
     (4/27 4/27 4/27))
    ((2/3 2/3) (4/9 4/9 4/9))
    ((1/3 1/3) (2/9 2/9 2/9))
    ((4/9) (2/9 2/9) (4/27 4/27 4/27))
    ((4/9 4/9)) ((2/9 2/9) (4/27 4/27 4/27))
    ((8/27) (4/27 4/27) (8/81 8/81 8/81))
    ((1 1) (2/3 2/3 2/3)) ((4/3) (2/3 2/3) (4/9 4/9 4/9))
    ((4/3 4/3))
    ((2/3 2/3) (4/9 4/9 4/9))
    ((8/9) (4/9 4/9) (8/27 8/27 8/27))
    ((1/2 1/2) (1/3 1/3 1/3))
    ((2/3) (1/3 1/3) (2/9 2/9 2/9))
    ((2/3 2/3))
    ((1/3 1/3) (2/9 2/9 2/9))
    ((4/9) (2/9 2/9) (4/27 4/27 4/27))
    ((2/3 2/3) (4/9 4/9 4/9))
    ((1/3 1/3) (2/9 2/9 2/9))
    ((4/9) (2/9 2/9) (4/27 4/27 4/27))
    ((4/9 4/9))
    ((2/9 2/9) (4/27 4/27 4/27))
    ((8/27) (4/27 4/27) (8/81 8/81 8/81))
    ((2/3 2/3) (4/9 4/9 4/9))
    ((8/9) (4/9 4/9) (8/27 8/27 8/27))
    ((1/3 1/3) (2/9 2/9 2/9))
    ((4/9) (2/9 2/9) (4/27 4/27 4/27))
    ((4/9 4/9)) ((2/9 2/9) (4/27 4/27 4/27))
    ((8/27) (4/27 4/27) (8/81 8/81 8/81))
    ((4/9 4/9) (8/27 8/27 8/27))
    ((2/9 2/9) (4/27 4/27 4/27))
    ((8/27) (4/27 4/27) (8/81 8/81 8/81))
    ((8/27 8/27))
    ((4/27 4/27) (8/81 8/81 8/81))
    ((16/81) (8/81 8/81) (16/243 16/243 16/243)))
