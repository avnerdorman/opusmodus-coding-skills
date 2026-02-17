Opusmodus                                                               gen-sieve-tree      1

gen-sieve-tree root node level
[Function]

Arguments and Values:
root                    a number.
node                    an integer. 2 or 3.
level                   an integer.


Description:

GEN-SIEVE-TREE returns a tree node degree data from a given root, node and level
number. This function is useful for analysis of the original tree-data used in the SIEVE-
TREE function.


Examples:
(gen-sieve-tree 96 2 1)
=> ((48 48))

(gen-sieve-tree 96 3 1)
=> ((32 32 32))

(gen-sieve-tree 96 2 2)
=> (((24 24) (16 16 16)))

(gen-sieve-tree 96 3 2)
=> (((32) (16 16) (32/3 32/3 32/3)))

(gen-sieve-tree 96 2 3)
=> (((12 12) (8 8 8)) ((16) (8 8) (16/3 16/3 16/3)))

(gen-sieve-tree 96 3 3)
=> (((16 16))
    ((8 8) (16/3 16/3 16/3))
    ((32/3) (16/3 16/3) (32/9 32/9 32/9)))

(gen-sieve-tree 96 2 5)
=> (((3 3) (2 2 2)) ((4) (2 2) (4/3 4/3 4/3))
    ((4 4)) ((2 2) (4/3 4/3 4/3))
    ((8/3) (4/3 4/3) (8/9 8/9 8/9))
    ((4 4) (8/3 8/3 8/3)) ((2 2) (4/3 4/3 4/3))
    ((8/3) (4/3 4/3) (8/9 8/9 8/9)) ((8/3 8/3))
    ((4/3 4/3) (8/9 8/9 8/9))
    ((16/9) (8/9 8/9) (16/27 16/27 16/27)))
Opusmodus                                             gen-sieve-tree   2



SIEVE-TREE example with root 8, node 2 and level 5:

(sieve-tree 8 2 5)




Analysis of the above tree-data:

(gen-sieve-tree 8 2 5)
=> (((1/4 1/4) (1/6 1/6 1/6))
    ((1/3) (1/6 1/6) (1/9 1/9 1/9))
    ((1/3 1/3))
    ((1/6 1/6) (1/9 1/9 1/9))
    ((2/9) (1/9 1/9) (2/27 2/27 2/27))
    ((1/3 1/3) (2/9 2/9 2/9))
    ((1/6 1/6) (1/9 1/9 1/9))
    ((2/9) (1/9 1/9) (2/27 2/27 2/27))
    ((2/9 2/9)) ((1/9 1/9) (2/27 2/27 2/27))
    ((4/27) (2/27 2/27) (4/81 4/81 4/81)))
