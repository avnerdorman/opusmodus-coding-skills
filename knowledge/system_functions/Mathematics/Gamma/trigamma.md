Opusmodus                                                                               trigamma   1

trigamma x &key recursion
[Function]

Arguments and Values:
x                      a sequence of positive numbers.
recursion              if < x < recursion, recursive formula is used. The default in 30.0.


Description:

Returns value of TRIGAMMA function at x.

(trigamma '(1 4 3 7 5 8))
=> (1.644934 0.28382295 0.39493406 0.15354519 0.22132295 0.13313702)
