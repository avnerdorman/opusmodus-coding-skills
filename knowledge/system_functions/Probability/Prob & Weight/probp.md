Opusmodus                                                                                        prob?   1

probp n &key seed
[Function]

Arguments and Values:
n                         a oating point value between 0.0 and 1.0.
seed                      an integer - ensure the same result each time the code is evaluated.
                          The default is NIL.



Description:

This function returns T (true) and NIL (false) randomly. The true is more probable with a
higher oating point value.

Here, the return of T with a probability value 0.7 is more likely.

(probp 0.7)
=> t


Examples:

With :seed number:

(probp 0.3 :seed 54)
=> nil

In the next example the probability of getting T is less likely:

(if (probp 0.3)
  (pitch-transpose -12 '(c4 e4 g4)) => T
  (pitch-invert '(c4 e4 g4)))       => NIL
fl
                     fl
