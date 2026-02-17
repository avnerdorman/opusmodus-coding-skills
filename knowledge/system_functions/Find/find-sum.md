Opusmodus                                                                              find-sum   1

find-sum numbers &key start (end (length numbers))
[Function]

Arguments and Values:
numbers                   a list or lists of numbers.
start                     an integer. Index to start summing from. The default is 0.
end                       an integer. Index to stop summing at.


Description:

This function returns a sum of all numbers in a list or lists.


Examples:
(find-sum '(1 2 3 4))
=> 10

The function will also sum multiple lists:

(find-sum '((1 2 3 4) (5 6 7 8)))
=> (10 26)

Portions of a list can be also summed, for example to sum only the middle values of a list:

(find-sum '(1 2 3 4 5 6 7 8) :start 2 :end 4)
=> 7

Summing ratios:

(find-sum '((1/8 1/4 3/5) (1/4 1/4 1/8)))
=> (39/40 5/8)

Summing length symbols:

(find-sum '(q e w 3q))
=> 35/24
Opusmodus                                                                         find-sum   2

With lists of lengths the function can work out a length-value for the whole of a chosen
phrase so that a drone or sustained texture can be created in an additional part.

(setf len-1 (gen-length '(16 32) '((1 2 1 2 1 1) (1 3 1 3 2 2 4))))
=> ((1/16 1/8 1/16 1/8 1/16 1/16) (1/32 3/32 1/32 3/32 1/16 1/16 1/8))

(setf len-2 (find-sum len-1))
=> (1/2 1/2)
