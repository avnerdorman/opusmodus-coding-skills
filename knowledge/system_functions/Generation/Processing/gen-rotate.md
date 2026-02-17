Opusmodus                                                                            gen-rotate   1

gen-rotate n sequence &key type
[Function]

Arguments and Values:
n                        an integer (rotation number, positive or negative), :left or :right.
sequence                 a list of items.
type                     NIL or 'list (generate a sequence). The default is NIL.


Description:

GEN-ROTATE can be used to rotate a list a number of places left or right.


Examples:
(gen-rotate 2 '(c4 d4 e4 g4 a4))
=> (g4 a4 c4 d4 e4)

(gen-rotate -2 '(c4 d4 e4 g4 a4))
=> (e4 g4 a4 c4 d4)

The keywords :left and :right are equivalents of the integer values -1 and 1. We can
also use :type 'list to generate multiple lists for an entire rotation of the items in list:

(gen-rotate :left '(1 2 3 4) :type 'list)
=> ((1 2 3 4) (4 1 2 3) (3 4 1 2) (2 3 4 1))

Generate a sequence based on a rotation of 2 places right:

(gen-rotate 2 '(1 2 3 4 5) :type 'list)
=> ((1 2 3 4 5) (5 1 2 3 4) (4 5 1 2 3))

OMN form rotation:

(setf omn '(q c4 p ten e d4 mp trem s e4 f stacc))

(gen-rotate 1 omn)
=> (s e4 f stacc q c4 p ten e d4 mp trem)

(gen-rotate 2 omn)
=> (e d4 mp trem s e4 f stacc q c4 p ten)
