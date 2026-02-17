Opusmodus                                                                     remove-duplicates   1

remove-duplicates sequence &key from-end test test-not
                              start end key

[Function]

Arguments and Values:
sequence                a proper sequence.
from-end                a generalised boolean. The default is false.
test                    a designator for a function of two arguments that returns a generalised
                        boolean.
test-not                a designator for a function of two arguments that returns a generalised
                        boolean.
start, end              bounding index designators of sequence.
                        The defaults for start and end are 0 and NIL, respectively.
key                     a designator for a function of one argument, or NIL.


Description:

The elements of sequence are compared pairwise, and if any two match, the one occurring
earlier is discarded, unless from-end is true, in which case the one later in the
sequence is discarded. The resulting sequence is returned.


Examples:
(remove-duplicates '(a b c b d d e))
=> (a c b d e)

(remove-duplicates '(a b c b d d e) :from-end t)
=> (a b c d e)
