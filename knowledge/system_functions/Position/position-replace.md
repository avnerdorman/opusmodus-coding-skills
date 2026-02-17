Opusmodus                                                                                position-replace   1

position-replace position item sequence &key type section exclude
[Function]

Arguments and Values:
position                      an integer or list of integers, 0-based.
item                          an item or list of items.
sequence                      a sequence.
type                          NIL or 'list. The default is NIL.
section                       an integer or list of integers. Selected list or lists to process.
                              The default is NIL.
exclude                       an integer or list of integers. Excluded list or lists from process.
                              The default is NIL.


Description:

The function POSITION-REPLACE can be used to replace certain items in a list, or lists,
with another item.

(position-replace 2 'gs4 '(c4 c4 c4 c4 c4))
=> (c4 c4 gs4 c4 c4)

The position to replace can also be a list:

(position-replace '(0 2 4) 'gs4 '(c4 c4 c4 c4 c4))
=> (gs4 c4 gs4 c4 gs4)


Examples:

A list of items can also be speci ed:

(position-replace '(0) '((gs4)) '((c4 c4 c4 c4 c4) (e4 e4 e4 e4 e4))
                  :type 'list)
=> ((gs4) (e4 e4 e4 e4 e4))

It is often used in conjunction with POSITION-ITEM, as shown in the preliminary example
below.

(setf one (position-item 1 '(1 0 0 1 1 0 1 1 1 0)))
=> (0 3 4 6 7 8)

(setf zero (position-item 0 '(1 0 0 1 1 0 1 1 1 0)))
=> (1 2 5 9)
                         fi
Opusmodus                                                             position-replace   2

(setf mat (vector-to-pitch '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4 bb4
    d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf chord-1 '(e4bb4))
(setf chord-2 '(c3d4))

(setf vibes-1 (position-insert one chord-1 mat))
=> (e4bb4 eb4 c4 e4bb4 e4bb4 c4 e4bb4 e4bb4 e4bb4 b4 b3
    eb4 g3 gs3 e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf marimba-2 (position-insert zero chord-2 mat))
=> (eb4 c3d4 c3d4 c4 c4 c3d4 b4 b3 eb4 c3d4 g3
    gs3 e4 d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

Now let's replace the chords 1 & 2 with two different chords 3 & 4:

(setf chord-3 '(c5b5))
(setf chord-4 '(f3ab3))

(setf vibes-3 (position-replace one chord-3 mat))
=> (c5b5 c4 c4 c5b5 c5b5 eb4 c5b5 c5b5 c5b5
    d4 bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

(setf marimba-4 (position-replace zero chord-4 mat))
=> (eb4 f3ab3 f3ab3 b4 b3 f3ab3 g3 gs3 e4 f3ab3
    bb4 d4 bb3 a3 gs3 c4 a4 bb4 bb4 cs4)

Replace items in multiple lists:

(position-replace
 '(0 2) 'x '((a a a a a) (b b b b b) (c c c c c)))
=> ((x a a a a) (b b x b b) (x c c c c))

(position-replace
 '(0 2) 'x '((a a a a a) (b b b b b) (c c c c c)) :section '(2))
=> ((a a a a a) (b b b b b) (x c c c c))
