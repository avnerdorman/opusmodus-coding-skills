Opusmodus                                                                                  binary-map   1

binary-map map sequence &key list omn
[Function]

Arguments and Values:
map                      a binary list for deletion (pitch, velocity etc…) and for rest-lengths.
sequence                 a sequence of items or lengths.
list                     NIL or T. The default is NIL.
omn                      NIL or T. If T the result is in OMN format. The default is NIL.


Description:

The function BINARY-MAP working alongside GEN-BINARY-REMOVE can be used to
map pitches, velocities or length to create a template of showing the results of deleting items
from a list. With pitches it's possible to generate a length list showing length rests where
pitches have been deleted. It can be used to produce simple (but very effective) length lists
suitable for minimalist and electro music styles.

(binary-map '(1 1 0 0 1 0 1 1) 1/16)
=> (1/16 1/16 -1/16 -1/16 1/16 -1/16 1/16 1/16)


Examples:

Creating a map with GEN-BINARY-REMOVE function:

(setf pitch '(c4 = = d4 e4 c4 = g4 c4 g4 c5))

(setf map (gen-binary-remove '(c4) pitch))
=> (0 0 0 1 1 0 0 1 0 1 1)

Mapping the pitches to GEN-BINARY-REMOVE result:

(binary-map map pitch)
=> (d4 e4 g4 g4 c5)

(binary-map map 's)
=> (-1/16 -1/16 -1/16 1/16 1/16
    -1/16 -1/16 1/16 -1/16 1/16 1/16)

(setf map2 (gen-binary-remove '(c4 g4) pitch))
=> (0 0 0 1 1 0 0 0 0 0 1)

(binary-map map2 pitch)
=> (d4 e4 c5)
Opusmodus                                                       binary-map   2

(binary-map map2 's)
=> (-1/16 -1/16 -1/16 1/16 1/16
    -1/16 -1/16 -1/16 -1/16 -1/16 1/16)

Mapping with :list T keyword:

(binary-map map pitch :list t)
=> ((d4 e4) (g4) (g4 c5))

This is how it might work with velocities:

(setf vel-lis '(mf p p mp p ff f pp f pp ff p pp ff p mp ff))

(setf vel-del (gen-binary-remove 'ff vel-lis))
=> (0 1 1 1 1 1 0 0 1 0 1 1 1 0 1 1 0 1 1 0)

(binary-map vel-del vel-lis :omn t)
=> (mf p = mp p f pp f pp p pp p mp)

(binary-map vel-del 's :omn t)
=> (s = = = = - = = = = - = = - = = -)
