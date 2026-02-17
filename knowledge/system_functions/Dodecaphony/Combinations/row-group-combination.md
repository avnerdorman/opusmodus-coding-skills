Opusmodus                                                             row-group-combination        1

row-group-combination n model1 model2 set &key type chord flatten
[Function]

Arguments and Values:
n                         an integer.
model1                    integer lists
model2                    integer lists
set                       list of integers (twelve-tone row).
type                      :integer or :pitch. The default is :integer.
chord                     NIL or T. The default is NIL.
flatten                   NIL or T. The default is NIL.


Description:

This function has similarities with ROSETTE, but the template models work slightly
differently. The idea is still to group the integers into hexachords. This is a fundamental part
of the klangreihen process, but can be subverted here, as in this example:

(row-group-combination
 2 '(9 2 1) '(6 5 1) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((8 7 6 5 4 3 2 1 0) (10 9) (11))


Examples:
(rosette 4 '(12) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((3 4 5 0 1 2) (9 10 11 6 7 8))

(row-group-combination
 4 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((5 4 3 2 1 0) (11 10 9 8 7 6))

This example shows clearly the close relationship with the function ROSETTE.

(row-group-combination
 4 '(3 3 3 3) '(4 2 4 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 0 5) (4 3 2) (7 6 11) (10 9 8))

(row-group-combination
 2 '(6 2 2 2) '(2 6 2 2) '(0 1 2 3 4 5 6 7 8 9 11) :type :pitch)
=> ((f4 e4 eb4 d4 db4 c4) (g4 gb4) (a4 ab4) (b4 bb4))
