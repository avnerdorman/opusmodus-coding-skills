Opusmodus                                                                  scale-numbers     1

scale-numbers n numbers &key round sum
[Function]

Arguments and Values:
n                        a number.
numbers                  a list or lists of numbers.
round                    Boolean. The default is NIL.
sum                      Boolean. The default is NIL.


Description:

This function scales a list of numbers to a given n value. If the keyword :sum is set to T
(true), the function scales a list of numbers so that their sum equals the given sum.

(scale-numbers .3 '(3 4 2 3 4 2 1))
=> (0.90000004 1.2 0.6 0.90000004 1.2 0.6 0.3)

(scale-numbers 25 '(3 4 2 3 4 2 1) :sum t)
=> (3.9473684 5.263158 2.631579 3.9473684 5.263158 2.631579 1.3157895)


Examples:
(setf values '(1 2 3 4 5 6 7 8))
(scale-numbers 0.4 values)
=> (0.4 0.8 1.2 1.6 2.0 2.4 2.8 3.2)

(scale-numbers 0.4 values :round t)
=> (0 1 1 2 2 2 3 3)

(scale-numbers '(0.7 1.3) (list values values))
=> ((0.7 1.4 2.1 2.8 3.5 4.2 4.9 5.6)
    (1.3 2.6 3.8999999 5.2 6.5 7.7999997 9.099999 10.4)))

(scale-numbers '(0.7 1.3) (list values values) :round t)
=> ((1 1 2 3 4 4 5 6) (1 3 4 5 6 8 9 10))

(scale-numbers 25 values :sum t)
=> (0.6944444 1.3888888 2.0833333 2.7777777
    3.472222 4.1666665 4.8611107 5.5555554)

(scale-numbers 25 values :round t :sum t)
=> (1 1 2 3 3 4 5 6)

(scale-numbers '(25 12) (list values values) :round t :sum t)
=> ((1 1 2 3 3 4 5 6) (0 1 1 1 2 2 2 3))
