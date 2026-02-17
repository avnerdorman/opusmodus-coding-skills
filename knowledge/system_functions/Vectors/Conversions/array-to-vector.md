Opusmodus                                                             array-to-vector     1

array-to-vector array
[Function]

Arguments and Values:
array                   an array.


Description:

This function converts an array to a vector array. An array is a systematic arrangement
of objects, usually in rows and columns.

(array-to-vector #2A((1 2 3) (4 5 6) (7 8 9)))
=> #((1 2 3) (4 5 6) (7 8 9))

(array-to-vector (spiral-array 5 3))
=> #((0 1 2) (11 12 3) (10 13 4) (9 14 5) (8 7 6))


Examples:

Here's a 2-dimensional array:

(spiral-array 5 3)
=> #2A(( 0 1 2)
       (11 12 3)
       (10 13 4)
       ( 9 14 5)
       ( 8 7 6))

A spiral array is a square arrangement of the rst N2 natural numbers, where the numbers
increase sequentially as you go around the edges of the array spiralling inwards.

(integer-to-pitch (array-to-list (spiral-array 5 3)))
=> ((c4 cs4 d4) (b4 c5 eb4) (bb4 cs5 e4)
    (a4 d5 f4) (gs4 g4 fs4))

In this function the array ag #2A is converted to the vector ag #.
                  fl
                                        fi
                                                     fl
