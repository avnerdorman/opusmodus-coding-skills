Opusmodus                                                                sum-to-size   1

sum-to-size total size
[Function]

Arguments and Values:
total                   an integer.
size                    an integer.


Description:

This function returns a list of numbers in a given size of equal numbers (plus/minus 1)
which add up to a total.


Examples:
(sum-to-size 45 8)
=> (5 5 5 6 6 6 6 6)

(sum-to-size 25 7)
=> (3 3 3 4 4 4 4)

(sum-to-size 25 3)
=> (8 8 9)

(sum-to-size 25 11)
=> (2 2 2 2 2 2 2 2 3 3 3)

(sum-to-size 103 8)
=> (12 13 13 13 13 13 13 13)

(sum-to-size 104 8)
=> (13 13 13 13 13 13 13 13)
