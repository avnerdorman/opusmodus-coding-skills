Opusmodus                                                               array-to-list     1


array-to-list array
[Function]

Arguments and Values:
array                   an array.


Description:

The function ARRAY-TO-LIST convert an array to lists. An array is a systematic
arrangement of objects, usually in rows and columns.

(array-to-list #2A((1 2 3) (4 5 6) (7 8 9)))
=> ((1 2 3) (4 5 6) (7 8 9))


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

Magic Squares are common tools in contemporary composition. Here's how one is made and
accessed using functions LIST-TO-ARRAY and GET-ARRAY.

(setf magic-square-3
      (list-to-array
       '((4 9 2)
         (3 5 7)
         (8 1 6))))

(get-array 0 1 3 magic-square-3 :direction 'down)
=> (9 5 1)
                                      fi
