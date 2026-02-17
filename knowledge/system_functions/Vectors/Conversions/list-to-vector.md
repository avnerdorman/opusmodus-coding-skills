Opusmodus                                                                    list-to-vector    1

list-to-vector list
[Function]

Arguments and Values:
list                      a list or lists.


Description:

The function LIST-TO-VECTOR will convert a series of lists to a vector array.

(list-to-vector '((1 2 3) (4 5 6) (7 8 9))))
=> #((1 2 3) (4 5 6) (7 8 9))


Examples:
(setf n-vel (rnd-sample 14 (gen-integer 0 24)))
=> (18 7 24 9 13 22 18 20 12 14 24 20 19 4)

(setf n-vel-vec (list-to-vector n-vel))
=> #(18 7 24 9 13 22 18 20 12 14 24 20 19 4)

(list-to-vector '((1 2 3) (4 5 6) (7 8 9))))
=> #((1 2 3) (4 5 6) (7 8 9))

Here's a 2-dimensional array followed by its output via the function LIST-TO-VECTOR to a
vectors.

(spiral-array 5 3)
=> #2A(( 0 1 2)
       (11 12 3)
       (10 13 4)
       ( 9 14 5)
       ( 8 7 6))

Notice that the output of this function is a vector list. As is this array for a 3 x 3 magic
square. The function LIST-TO-ARRAY is equivalent to LIST-TO-VECTOR:

(setf magic-square-3 (build-array '((4 9 2) (3 5 7) (8 1 6))))
=> #2A((4 9 2) (3 5 7) (8 1 6))
