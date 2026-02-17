Opusmodus                                                                                position     1

position item sequence &key from-end start end key test test-not
position-if predicate sequence &key from-end start end count key
position-if-not predicate sequence &key from-end start end
                         count key

[Function]

Arguments and Values:
item                    an object.
sequence                a proper sequence.
predicate               a designator for a function of one argument that returns a generalised boolean.
from-end                a generalised boolean. The default is false.
test                    a designator for a function of two arguments that returns a generalised
                        boolean.
test-not                a designator for a function of two arguments that returns a generalised
                        boolean.
start, end              bounding index designators of sequence.
                        The defaults for start and end are 0 and NIL, respectively.
key                     a designator for a function of one argument, or NIL.


Description:

POSITION, POSITION-IF, and POSITION-IF-NOT each search sequence for an
element that satis es the test. The position returns the index of the rst element of
sequence that match item using the given test function; returns NIL if no element
matches.


Examples:
(position 'd '(a b c d))
=> 3

(position '2 '(1 2 3 4))
=> 1

(position 4 '())
=> nil

(position-if-not #'integerp '(1 2 3 4 5.0))
=> 4
             fi
                                                                fi
