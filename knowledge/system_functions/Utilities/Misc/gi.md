Opusmodus                                                                              gi     1

gi list
[Function]

Arguments and Values:

list                     number or number-series symbol: (<number><..><number>).


Description:

The function GI generates a list of numbers. The input can be a number or a number-
series symbol (two dots between two numbers, for example 1..6 will return a list of
numbers from 1 to 6. This function is useful when a series of numbers is written by hand (a
kind of shorthand).


Examples:
(gi '(1 3 6..9 11))
=> (1 3 6 7 8 9 11)

(gi '0..12)
=> (0 1 2 3 4 5 6 7 8 9 10 11 12)

(gi '0..-12)
=> (0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 -11 -12)

(gi '(1 3 6..9 11))
=> (1 3 6 7 8 9 11)

(gi '(0..12 11..0))
=> (0 1 2 3 4 5 6 7 8 9 10 11 12 11 10 9 8 7 6 5 4 3 2 1 0)
