Opusmodus                                                                             substitute     1

substitute new old sequence &key from-end test test-not start end
                count key
substitute-if new predicate sequence &key from-end start end
                     count key
substitute-if-not new predicate sequence &key from-end start end
                             count key

[Function]

Arguments and Values:
new                    an object.
old                    an object.
sequence               a proper sequence.
predicate              a designator for a function of one argument that returns a generalised boolean.
from-end               a generalised boolean. The default is false.
test                   a designator for a function of two arguments that returns a generalised
                       boolean.
test-not               a designator for a function of two arguments that returns a generalised
                       boolean.
start, end             bounding index designators of sequence.
                       The defaults for start and end are 0 and NIL, respectively.


Description:

SUBSTITUTE, SUBSTITUTE-IF, and SUBSTITUTE-IF-NOT return a copy of
sequence in which each element that satis es the test has been replaced with new item.


Examples:
(substitute 0 4 '(1 2 3 4 5 4 3 2 1))
=> (1 2 3 0 5 0 3 2 1)

(substitute 0 4 '(1 2 3 4 5 4 3 2 1) :count 1)
=> (1 2 3 0 5 4 3 2 1)

(substitute 0 4 '(1 2 3 4 5 4 3 2 1) :test #'>)
=> (0 0 0 4 5 4 0 0 0)

(substitute-if 9 #'oddp '(1 2 4 1 3 4 5))
=> (9 2 4 9 9 4 9)

(substitute-if 9 #'evenp '(1 2 4 1 3 4 5) :count 1 :from-end t)
=> (1 2 4 1 3 9 5)
                                     fi
