Opusmodus                                                              binary-to-decimal     1

binary-to-decimal n
[Function]

Arguments and Values:
n                        a binary number.


Description:

This function converts a binary list to a decimal number.

A binary number is a number expressed in the binary numeral system or base-2 numeral
system which represents numeric values using two different symbols: typically 0 (zero) and
1 (one). The base-2 system is a positional notation with a radix of 2.

A decimal number, or just decimal, refers to any number written in decimal notation (base 10
positional notation), although it is more commonly used to refer to numbers that have a
fractional part separated from the integer part with a decimal separator (e.g. 11.25).

(binary-to-decimal '(1 1 0))
=> 6


Examples:
(binary-to-decimal '(1 1 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0))
=> 397280

(binary-to-decimal '((1 0 0 1) (1 1) (1 1 0) (1) (1 0 1 0) (1 0 1 1)))
=> (9 3 6 1 10 11)
