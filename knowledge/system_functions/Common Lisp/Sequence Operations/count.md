Opusmodus                                                                                   count    1

count item sequence &key from-end start end key test test-not
count-if predicate sequence &key from-end start end count key
count-if-not predicate sequence &key from-end start end count key
[Function]

Arguments and Values:
item                   an object.
sequence               a proper sequence.
predicate              a designator for a function of one argument that returns a generalised boolean.
from-end               a generalised boolean. The default is false.
test                   a designator for a function of two arguments that returns a generalised
                       boolean.
test-not               a designator for a function of two arguments that returns a generalised
                       boolean.
start, end             bounding index designators of sequence.
                       The defaults for start and end are 0 and NIL, respectively.
key                    a designator for a function of one argument, or NIL.


Description:

Return the number of elements in sequence satisfying a test with item, which defaults
to EQL.


Examples:
(count 'a '(a b c a b c a))
=> 3

(count 1 '(1 2 1 3))
=> 2

(count-if-not #'oddp '((1) (2) (3) (4)) :key #'car)
=> 2
