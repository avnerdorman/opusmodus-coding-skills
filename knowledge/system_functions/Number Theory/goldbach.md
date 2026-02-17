Opusmodus                                                                        goldbach   1

goldbach from to by
[Function]

Arguments and Values:
from                     an even number to begin the series from.
to                       an even number to end the series to.
by                       an even number to use as an increment.


Description:

The GOLDBACH function can be used to generate series of prime number pairs beginning
from one value, ending at another and with a user de ned increment.

(goldbach 6 18 2)
=> ((3 3) (3 5) (3 7) (5 7) (3 11) (3 13) (5 13))

Goldbach's conjecture states that every positive even number greater than 2 is the sum of two
prime numbers.


Examples:

For example, to get the GOLDBACH pairs for the numbers 4, 6, 8, 10:

(goldbach 4 10 2)
=> ((2 2) (3 3) (3 5) (3 7))

Another example - from 4 to 100, with increments of 8:

(goldbach 4 100 8)
=> ((2 2) (5 7) (3 17) (5 23) (5 31) (3 41) (5 47)
    (7 53) (7 61) (3 73) (5 79) (3 89) (3 97))
                                                 fi
