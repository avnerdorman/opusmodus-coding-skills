Opusmodus                                                                        position-item     1

position-item item sequence &key encode
[Function]

Arguments and Values:
item                       an item.
sequence                   a sequence.
encode                     T or NIL. With :encode T (the default) the function transforms OMN repeat
                           symbols (=) into its values, while :encode NIL returns
                           selections unchanged.



Description:

The function POSITION-ITEM will return the position (0-based), or positions, of an
item in a sequence.

(position-item 'cs4 '(c4 cs4 fs4 g4 b4 c5 fs4 b4))
=> (1)

(position-item 'fs4 '(c4 cs4 fs4 g4 b4 c5 fs4 b4))
=> (2 6)

Sublists will be treated as items:

(position-item '(2/16) '((1/16) (2/16) (2/16)))
=> (1 2)


Examples:

It is often used in conjunction with the function POSITION-INSERT as here below, in this
example from a percussion duo.

(setf one (position-item 1 '(1 0 0 1 1 0 1 1 1 0)))
=> (0 3 4 6 7 8)

(setf zero (position-item 0 '(1 0 0 1 1 0 1 1 1 0)))
=> (1 2 5 9)

(setf mat (vector-to-pitch '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4 bb4
    d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)
Opusmodus                                                   position-item   2

(setf chord-1 '(e4bb4))
(setf chord-2 '(c3d4))

(setf vibes (position-insert one chord-1 mat))
=> (e4bb4 eb4 c4 e4bb4 e4bb4 c4 e4bb4 e4bb4 e4bb4 b4 b3
    eb4 g3 gs3 e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf marimba (position-insert zero chord-2 mat))
=> (eb4 c3d4 c3d4 c4 c4 c3d4 b4 b3 eb4 c3d4 g3 gs3
    e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)
