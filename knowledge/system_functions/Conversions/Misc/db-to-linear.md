Opusmodus                                                           db-to-linear   1

db-to-linear n
[Function]

Arguments and Values:
n                         a number or a list of numbers.


Description:

This function converts logarithmic decibel scale to linear scale.

(db-to-linear 70)
=> 3162.2778


Examples:
(db-to-linear '(1 2 3 4 5))
=> (1.122018 1.258925 1.412538 1.584893 1.778279)
