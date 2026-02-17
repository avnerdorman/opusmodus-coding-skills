Opusmodus                                                              decimal-to-binary     1

decimal-to-binary n
[Function]

Arguments and Values:
n                        a decimal number.


Description:

This function converts a decimal number to a binary list.

A binary number is a number expressed in the binary numeral system or base-2 numeral
system which represents numeric values using two different symbols: typically 0 (zero) and
1 (one). The base-2 system is a positional notation with a radix of 2.

A decimal number, or just decimal, refers to any number written in decimal notation (base 10
positional notation), although it is more commonly used to refer to numbers that have a
fractional part separated from the integer part with a decimal separator (e.g. 11.25).

(decimal-to-binary 6)
=> (1 1 0)


Examples:
(decimal-to-binary 397280)
=> (1 1 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0)

(decimal-to-binary '(9 3 6 1 10 11)
=> ((1 0 0 1) (1 1) (1 1 0) (1) (1 0 1 0) (1 0 1 1))
