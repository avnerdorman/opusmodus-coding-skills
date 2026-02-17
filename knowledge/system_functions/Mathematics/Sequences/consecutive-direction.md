Opusmodus                                                                      consecutive-direction   1

consecutive-direction sequence &optional neg
[Function]

Arguments and Values:
sequence                  A list of real numbers. Real numbers can be integers or oating point numbers.
neg                       An optional boolean argument. If it is non-nil, counts of strictly decreasing
                          sequences are returned as negative numbers. If it is NIL or omitted, all counts
                          are returned as positive numbers.


Description:

This function takes a list of numbers and an optional boolean argument. It returns a list of
counts of consecutive numbers that are either strictly increasing or strictly decreasing. If the
optional boolean argument is true, it returns negative counts for strictly decreasing
sequences.


Examples:
(consecutive-direction '(1 2 3 -3 -2 1 2 3))
=> (2 1 4)

(consecutive-direction '(1 2 3 -3 -2 1 2 3) t)
=> (2 -1 4)

(consecutive-direction '(1 2 3 4 3 2 1))
=> (3 3)

(consecutive-direction '(1 2 3 4 3 2 1) t)
=> (3 -3)

(consecutive-direction (gen-brownian-motion 64 :seed 876))
=> (1 4 1 1 1 1 1 4 2 2 3 3 1 1 3 1
    1 1 1 5 1 4 1 3 2 2 1 3 1 3 3 1)

(consecutive-direction (gen-brownian-motion 64 :seed 876) t)
=> (1 -4 1 -1 1 -1 1 -4 2 -2 3 -3 1 -1 3 -1
    1 -1 1 -5 1 -4 1 -3 2 -2 1 -3 1 -3 3 -1)

(consecutive-direction (list
                        (gen-brownian-motion 32)
                        (gen-brownian-motion 32)))
=> ((3 1 4 2 2 2 2 1 2 3 1 1 1 2 4) (1 1 5 1 2 3 2 2 1 3 2 5 3))
                                                                          fl
