Opusmodus                                                                                 position-insert   1

position-insert position item list &key type section exclude
[Function]

Arguments and Values:
position                      an integer or list of integers, 0-based.
item                          an item or list of items to insert.
list                          a list or lists of items.
type                          NIL or 'list. The default is NIL.
section                       an integer or list of integers. Selected list or lists to process.
                              The default is NIL.
exclude                       an integer or list of integers. Excluded list or lists from process.
                              The default is NIL.


Description:

The function POSITION-INSERT can be used to insert certain items into a list, or series
of lists.

(position-insert 2 'gs4 '(c4 c4 c4 c4 c4))
=> (c4 c4 gs4 c4 c4 c4)

Using this function will increase the length of the target list.


Examples:

The insert position can also be a list of positions:

(position-insert '(0 2) 'gs4 '(c4 c4 c4 c4 c4))
=> (gs4 c4 gs4 c4 g4 c4 c4 c4)

A list of items can also be speci ed:

(position-insert '(0 2) '(gs4 cs5) '(c4 c4 c4 c4 c4))
=> (gs4 c4 cs5 c4 c4 c4 c4)

(position-insert '(0 2) '(gs4 cs5)
                 '((c4 c4 c4 c4 c4) (d4 d4 d4 d4 d4)))
=> ((gs4 c4 c4 c4 c4 c4) (d4 d4 cs5 d4 d4 d4))

(position-insert '(0 2) '((gs4 cs5))
                 '((c4 c4 c4 c4 c4) (d4 d4 d4 d4 d4)))
=> ((gs4 c4 c4 c4 c4 c4) (d4 d4 gs4 d4 d4 d4))
                         fi
Opusmodus                                                            position-insert     2

(position-insert '((0 2) (1 3)) '((gs4 cs5) (eb4 bb4))
                 '((c4 c4 c4 c4 c4) (d4 d4 d4 d4 d4)))
=> ((gs4 c4 cs5 c4 c4 c4 c4) (d4 eb4 d4 bb4 d4 d4 d4))


(position-insert '(0 2) '(((gs4 cs5)) ((eb4 bb4)))
                 '((c4 c4 c4 c4 c4) (d4 d4 d4 d4 d4)))
=> ((gs4 cs5 c4 c4 c4 c4 c4) (d4 d4 eb4 bb4 d4 d4 d4))

(position-insert '(0 2) '(((gs4 cs5)) ((eb4 bb4)))
                 '((c4 c4 c4 c4 c4) (d4 d4 d4 d4 d4)) :type 'list)
=> ((gs4 cs5) (c4 c4 c4 c4 c4) (eb4 bb4) (d4 d4 d4 d4 d4))

If the function is used in conjunction with POSITION-ITEM binary templates may be used
to insert material.

(setf one (position-item 1 '(1 0 0 1 1 0 1 1 1 0)))
=> (0 3 4 6 7 8)

(setf zero (position-item 0 '(1 0 0 1 1 0 1 1 1 0)))
=> (1 2 5 9)

(setf mat (vector-to-pitch '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4 bb4
    d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf chord-1 '(e4bb4))
(setf chord-2 '(c4d5))

(position-insert one chord-1 mat)
=> (e4bb4 eb4 c4 e4bb4 e4bb4 c4 e4bb4 e4bb4 e4bb4 b4 b3
    eb4 g3 gs3 e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(position-insert zero chord-2 mat)
=> (eb4 c4d5 c4d5 c4 c4 c4d5 b4 b3 eb4 c4d5 g3 gs3
    e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)
