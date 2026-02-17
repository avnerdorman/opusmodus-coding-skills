Opusmodus                                                        gen-binary-length   1

gen-binary-length sequence
[Function]

Arguments and Values:
sequence               a list or lists if lengths.


Description:

The function GEN-BINARY-LENGTH returns a binary list of 0 and 1. All matching
length rests are 0 the length notes are 1.

(gen-binary-length '(-s = = - = - = =))
=> (0 1 1 0 1 0 1 1)

(gen-binary-length '((-s = = - = - = =) (e = q - e = = s = - =)))
=> ((0 1 1 0 1 0 1 1) (1 1 1 0 1 1 1 1 1 0 1))


Examples:

Creating a map with GEN-BINARY-LENGTH function:

(setf len '((-s = = - = - = =) (e = q - e = = s = - =)))

(setf map (gen-binary-length len))
=> ((0 1 1 0 1 0 1 1) (1 1 1 0 1 1 1 1 1 0 1))

Same result mapping to single length:

(binary-map map 's :omn t)
=> ((-s = = - = - = =) (s = = - = = = = = - =))
