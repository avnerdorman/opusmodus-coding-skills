Opusmodus                                                            remove-series   1

remove-series n sequence &key from-end
[Function]

Arguments and Values:
n                      an integer (number of items to remove).
sequence               a sequence.
from-end               T or NIL. The default is NIL.

Description:

The function REMOVE-SERIES removes a number of successive items from a list.

Examples:
(remove-series 3 '(0 1 6 5 11 0))
=> (5 11 0)

(remove-series 3 '(0 1 6 5 11 0) :from-end t)
=> (0 1 6)

(remove-series 3 '(c4 cs4 fs4 f4 b4 c4))
=> (f4 b4 c4)

(remove-series 3 '(c4 cs4 fs4 f4 b4 c4) :from-end t)
=> (c4 cs4 fs4)
