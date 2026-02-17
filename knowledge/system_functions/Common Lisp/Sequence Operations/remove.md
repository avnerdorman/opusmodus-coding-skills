Opusmodus                                                                               remove   1

remove item sequence &key from-end test test-not start end count key
remove-if test sequence &key from-end start end count key
remove-if-not test sequence &key from-end start end count key
[Function]

Arguments and Values:
item                an object.
sequence            a proper sequence.
from-end            a generalised boolean. The default is false.
test                a designator for a function of two arguments that returns a generalised
                    boolean.
test-not            a designator for a function of two arguments that returns a generalised
                    boolean.
start, end          bounding index designators of sequence.
                    The defaults for start and end are 0 and NIL, respectively.
key                 a designator for a function of one argument, or NIL.


Description:

REMOVE, REMOVE-IF, and REMOVE-IF-NOT return a sequence from which the
elements that satisfy the test have been removed.


Examples:
(remove 5 '(2 5 6 7 5))
=> (2 6 7)

(remove 5 '(2 5 6 7 5) :count 1)
=> (2 6 7 5)

(remove 5 '(2 5 6 7 5) :count 2)
=> (2 6 7)

(remove 5 '(2 5 6 7 5) :test #'>)
=> (5 6 7 5)

(remove-if #'oddp '(1 2 4 1 3 4 5))
=> (2 4 4)

(remove-if #'evenp '(1 2 4 1 3 4 5) :count 1 :from-end t)
=> (1 2 4 1 3 5)

(remove-if-not #'evenp '(1 2 3 4 5 6 7 8 9) :count 2 :from-end t)
=> (1 2 3 4 5 6 8)
