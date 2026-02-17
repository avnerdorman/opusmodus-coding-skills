Opusmodus                                                                           gen-binary-remove   1

gen-binary-remove element sequence &key section exclude
[Function]

Arguments and Values:
element                   an element or list of elements.
sequence                  a list of items.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

The function GEN-BINARY-REMOVE returns a binary list of 0 and 1. All matching items
are 0 the rest is 1. Use this tool to create a pattern of binary integers that show where the
deletion has occurred. This gives a clear visual display of pitch activity over a range of
pitches. It can be used to produce simple (but very effective) length lists suitable for
minimalist, electro and rock music styles.

(gen-binary-remove '(c4) '(c4 d4 e4 c4 g4 c4 g4 c5))
=> (0 1 1 0 1 0 1 1)

(gen-binary-remove '(c4 c5) '(c4 = = d4 e4 c4 = g4 c4 g4 c5))
=> (0 0 0 1 1 0 0 1 0 1 0)

(gen-binary-remove '(c4) '((c4 d4 e4) (c4 g4 c4 g4 c5)))
=> ((0 1 1) (0 1 0 1 1))

(gen-binary-remove
 '(c4 g4)
 '((c4 c4 e4 f4) (c4 e4 f4) (f4 g4 g4) (g4 a4 b4)) :section '(0 3))
=> ((0 0 1 1) (1 1 1) (1 1 1) (0 1 1))


Examples:

Creating a map with GEN-BINARY-REMOVE function:

(setf pitch '(c4 = = d4 e4 c4 = g4 c4 g4 c5))

(setf map (gen-binary-remove '(c4) pitch))
=> (0 0 0 1 1 0 0 1 0 1 1)
Opusmodus                                          gen-binary-remove   2

Mapping the pitches to GEN-BINARY-REMOVE result:

(binary-map map pitch)
=> (d4 e4 g4 g4 c5)

Same result mapping to single length:

(binary-map map 's :omn t)
=> (-s - - = = - - = - = =)
