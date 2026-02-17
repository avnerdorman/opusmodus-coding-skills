Opusmodus                                                                   binary-list-map   1

binary-list-map map sequence
[Function]

Arguments and Values:
map                       a binary list.
sequence                  a list of items.


Description:

The function creates lists using binary numbers to mark divisions in a list of items.

(binary-list-map '(0 1 1 1 0 0 1 1 0 1) '(c4 d4 e4 f4 g4 a4))
=> ((c4 d4 e4) (f4 g4) (a4))

With a long stream of pitches, for example, it's possible to create sequences of sensible
phrase offering alternative approach to GEN-BINARY-CHANGE and GEN-BINARY-
ANACRUSIS. Use GEN-BINARY-RND to create the binary map.


Examples:

The function BINARY-LIST-MAP is a part of the BINARY-MAP function and can be used
with :list T.

(setf stream
      (integer-to-pitch
       (vector-round 0 7 (gen-noise 30 :seed 12))))
=> (cs4 e4 cs4 d4 e4 eb4 eb4 fs4 e4 g4 eb4 d4 cs4 fs4 fs4
    f4 fs4 e4 c4 g4 g4 d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4)

(setf map (gen-binary-anacrusis stream))
=> (1 1 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1)

(binary-map map stream :list t)
=> ((cs4 e4 cs4 d4 e4)
    (eb4 fs4 e4 g4 eb4 d4 cs4)
    (fs4 f4 fs4 e4 c4)
    (g4 d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4))
