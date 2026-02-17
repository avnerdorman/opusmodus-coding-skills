Opusmodus                                                                               substitute-map     1

substitute-map new old sequence &key section exclude
[Function]

Arguments and Values:
new                        an item or a list of items.
old                        an item or a list of items.
sequence                   a sequence.
section                    an integer or list of integers. Selected list or lists to process.
exclude                    an integer or list of integers. Selected list or lists excluded form process.


Description:

SUBSTITUTE-MAP can be used to create a list of substitutions in an existing list.

(substitute-map -1 1 '(1 2 3 3 2 1))
=> (-1 2 3 3 2 -1)

(substitute-map -1 1 '((1 2 3) (3 2 1)))
=> ((-1 2 3) (3 2 -1))

(substitute-map -1 1 '((1 2 3) (3 2 1)) :section 0)
=> ((-1 2 3) (3 2 1))


Examples:
(substitute-map '(a b c d) '(1 2 3 4) '(1 4 3 2 3 4 3 2))
=> (a d c b c d c b)

Not all items in a given list have to be substituted:

(substitute-map '(a c) '(1 3) '(1 4 3 2 3 4 3 2))
=> (a 4 c 2 c 4 c 2)

Creating a melody with SUBSTITUTE-MAP:

(substitute-map '(c4 e4 g4 c5) '(0 1 2 3) '(0 3 1 2 3 1 0 2))
=> (c4 c5 e4 g4 c5 e4 c4 g4)

Interval substitute:

(substitute-map 6 7 '((2 -2 2 24 31 -25 (-19 6))
                      ((13 -9) -1 2 -1 -25 0 13 6 -16 7 11)))
=> ((2 -2 2 24 31 -25 (-19 6))
    ((13 -9) -1 2 -1 -25 0 13 6 -16 6 11))
