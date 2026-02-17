Opusmodus                                                                      position-remove     1

position-remove position sequence &key encode type section exclude
[Function]

Arguments and Values:
position                   an integer or list of integers, 0-based.
sequence                   a sequence of items.
encode                     T or NIL. With :encode T (the default) the function transforms OMN repeat
                           symbols (=) into its values, while :encode NIL returns
                           selections unchanged.
type                       NIL or 'list. The default is NIL.
section                    an integer or list of integers. Selected list or lists to process.
                           The default is NIL.
exclude                    an integer or list of integers. Excluded list or lists from process.
                           The default is NIL.


Description:

The function POSITION-REMOVE can be used to remove either a single item or multiple
items from a list.

(position-remove 3 '(c4 cs4 fs4 g4 c5))
=> (c4 cs4 fs4 c5)

(position-remove '(0 3) '(c4 cs4 fs4 g4 c5))
=> (cs4 fs4 c5)

(position-remove '(0 3) '((c4 cs4 fs4 g4 c5) (c4 cs4 fs4 g4 c5)))
=> ((cs4 fs4 g4 c5) (c4 cs4 fs4 c5))

(position-remove '((0 3)) '((c4 cs4 fs4 g4 c5) (c4 cs4 fs4 g4 c5)))
=> ((cs4 fs4 c5) (cs4 fs4 c5))

The action of this function reduces the length of the items in a list.


Examples:

It is often used in conjunction with the function POSITION-ITEM, as in the example from a
percussion duo shown below.

(setf binary-list '(1 0 0 1 1 0 1 1 1 0))

(setf one (position-item 1 binary-list))
=> (0 3 4 6 7 8)
Opusmodus                                                   position-remove   2

(setf zero (position-item 0 binary-list))
=> (1 2 5 9)

(setf mat (vector-to-pitch '(f3 b4) (gen-noise 20 :seed 23)))
=> (d4 bb3 b3 b4 bb3 d4 f3 fs3 eb4 cs4
    bb4 cs4 a3 g3 fs3 b3 a4 bb4 bb4 c4)

(setf vibes (position-remove one mat))
=> (bb3 b3 d4 cs4 bb4 cs4 a3 g3 fs3 b3 a4 bb4 bb4 c4)

(setf marimba (position-remove zero mat))
=> (d4 b4 bb3 f3 fs3 eb4 bb4 cs4 a3 g3 fs3 b3 a4 bb4 bb4 c4)

(setf v-rhy (binary-map binary-list 'e))
=> (1/8 -1/8 -1/8 1/8 1/8 -1/8 1/8 1/8 1/8 -1/8)

(setf m-rhy (integer-invert (binary-map binary-list 'e)))
=> (-1/8 1/8 1/8 -1/8 -1/8 1/8 -1/8 -1/8 -1/8 1/8)
