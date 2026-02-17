Opusmodus                                                                         weight-pick   1

weight-pick list &key seed
[Function]

Arguments and Values:
list                     a sequence of lists of paired values(<element><weight-value>).
seed                     an integer - ensure the same result each time the code is evaluated.
                         The default is NIL.



Description:

This function returns an element selected at random, based on the weight value. The
elements with higher weight values are more likely to be selected.

Here, a weight value 7 is more likely:

(weight-pick '((a 4) (b 3) (c 7)))
=> c


Examples:

With :seed number:

(weight-pick '((a 4) (b 3) (c 7)) :seed 39)
=> a
