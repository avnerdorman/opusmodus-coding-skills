Opusmodus                                                             sieve-tree-series    1

sieve-tree-series tree-form
[Function]

Arguments and Values:
tree-form              a sequence.

Tree Form:

root                   a number or list of numbers.
node                   an integer 2 and 3 or a lists of paired values(<number><probability>).
level                  an integer or a lists of paired values(<number><probability>).
rest                   NIL or a lists of paired values(<percentage><probability>)
rnd-order              T to NIL. The default is T.
quantize               NIL or list of numbers. The default is '(1 2 3 4 5 6 7 8).


Description:

SIEVE-TREE-SERIES returns a sequence of lengths symbols derived from a series of tree-
data in a given root, node and level number. This function allows you to control
individual tree-data parameters ie. density results. Please note, every parameter has a
keyword, except the root number.
Opusmodus                                               sieve-tree-series   2

Examples:
(sieve-tree-series '((8 :node 2 :level ((3 0.47) (4 0.56) (5 0.68))
                        :rest ((40 0.43) (80 0.6) (0 0.7))
                        :quantize (1 2 4))
                     (3 :node 2 :level ((3 0.47) (4 0.56) (5 0.68))
                        :quantize (1 2 3 5 6))
                     (2 :node 3 :level ((4 0.46) (5 0.58)) :seed 23)))
Opusmodus                                               sieve-tree-series   3

(sieve-tree-series '((2 :node 2 :level ((4 0.47) (5 0.66))
                        :rest ((40 0.43) (80 0.6) (0 0.7)))
                     (8 :node 2 :level ((3 0.47) (4 0.56))
                        :quantize (1 2 3 5 6))
                     (3 :node 3 :level ((4 0.46) (5 0.58))
                        :rest ((40 0.43) (80 0.6) (0 0.7)))))
