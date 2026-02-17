Opusmodus                                                                               prob-pick   1

prob-pick list &key seed
[Function]

Arguments and Values:
list                     a sequence of lists of paired values (<element><probability-value>).
seed                     an integer - ensure the same result each time the code is evaluated.
                         The default is NIL.


Description:

This function returns an element selected at random, based on the probability value. The
elements with higher probability values are more likely to be selected.

Here, a probability value 0.55631 is more likely:

(prob-pick '((2 0.2564) (3 0.4564) (5 0.55631)))
=> 5


Examples:

With :seed number:

(prob-pick '((2 0.2564) (3 0.4564) (5 0.55631)) :seed 43)
=> 3
