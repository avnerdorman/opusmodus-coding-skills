Opusmodus                                                           linear-to-db   1

linear-to-db n
[Function]

Arguments and Values:
n                         a number or a list of numbers.


Description:

This function converts linear scale to logarithmic decibel scale.

(linear-to-db 4)
=> 12.0412


Examples:
(linear-to-db '(1 2 3 4 5))
=> (0.0 6.0206 9.542425 12.0412 13.9794)
