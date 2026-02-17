Opusmodus                                                                     make-array   1

make-array dimensions &key element-type initial-element
                                        initial-contents adjustable

[Function]

Arguments and Values:
dimensions               a designator for a list of valid array dimensions.
element-type             a type speci er. The default is T.
initial-element          an object.
initial-contents         an object.
adjustable               a generalised boolean. The default is NIL.


Description:

Constructs and returns an array. Dimensions should be an integer or a list of integers.


Examples:
(make-array '(4 2 3) :initial-contents
                     '(((a b c) (1 2 3))
                      ((d e f) (3 1 2))
                      ((g h i) (2 3 1))
                      ((j k l) (0 0 0))))

=> #3A(((a b c) (1 2 3)) ((d e f) (3 1 2))
       ((g h i) (2 3 1)) ((j k l) (0 0 0)))

One-dimensional array of ve elements.

(make-array 5)
=> #(0 0 0 0 0)

Two-dimensional array, 3 by 4, with four-bit elements.

(make-array '(3 4) :element-type '(mod 16))
=> #2A((0 0 0 0) (0 0 0 0) (0 0 0 0))

Array of single- oats.

(make-array 5 :element-type 'single-float)
=> #(0.0 0.0 0.0 0.0 0.0)
             fl
                   fi
                             fi
