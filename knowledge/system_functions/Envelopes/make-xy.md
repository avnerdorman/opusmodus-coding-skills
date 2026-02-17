Opusmodus                                                                             make-xy     1

make-xy x-coordinates y-coordinates
[Function]

Arguments and Values:
x-coordinates             A list of x-coordinates.
y-coordinates             A list of y-coordinates.


Description:

The MAKE-XY function accepts two input lists representing sets of x-coordinates and
y-coordinates respectively. For each corresponding pair of elements from these two
lists, it generates a new sublist, which can be interpreted as a coordinate pair (x, y). All of
these coordinate pairs are then collated into a single list.

Examples:
(setf val (make-xy (primes-to 20) (fibonacci 0 7)))
=> (2 0 3 1 5 1 7 2 11 3 13 5 17 8 19 13)

(xy-plot val :join-points t :point-radius 2
             :style :axis :point-style :square)


             14

             12

             10

             8

             6

             4

             2

             0
                    4        6        8        10    12     14      16      18      20
