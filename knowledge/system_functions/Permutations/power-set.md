Opusmodus                                                                        power-set   1

power-set set
[Function]

Arguments and Values:
set                      a list of items.


Description:

The function POWER-SET will generate not only all permutations of a set (as in the
permute function), but also all possible sub-permutations.

(power-set '(1 2 3 4))
=> ((1 2 3)
    (1 2)
    (1 2 4)
    (1 3)
    (1)
    (1 4)
    (1 3 4)
    (2 3)
    (2)
    (2 4)
    (3)
    (4)
    (3 4)
    (2 3 4)
    (1 2 3 4))


Examples:

This can be a powerful way of creating mosaic-like structures. For example, here is a solo for
conga drums playing through a POWER-SET permutation.

(setf
 c-1 '(c4 cs4)
 c-2 '(cs4 c4 d4)
 c-3 '(cs4 c4 cs4 d4)
 b-1 '(ds4 e4)
 b-2 '(ds4 e4 ds4)
 b-3 '(e4 e4 ds4 e4)
 )
Opusmodus                                                        power-set   2

(setf perc-pat (power-set '(c-1 c-2 c-3 b-1)))
=> ((c-1 c-2 c-3) (c-1 c-2) (c-1 c-2 b-1)
    (c-1 c-3) (c-1) (c-1 b-1) (c-1 c-3 b-1)
    (c-2 c-3) (c-2) (c-2 b-1) (c-3) (b-1)
    (c-3 b-1) (c-2 c-3 b-1) (c-1 c-2 c-3 b-1))

(setf perc-solo (apply-eval perc-pat))
=> ((c4 cs4 cs4 c4 d4 cs4 c4 cs4 d4) (c4 cs4 cs4 c4 d4)
     (c4 cs4 cs4 c4 d4 ds4 e4) (c4 cs4 cs4 c4 cs4 d4) (c4 cs4)
     (c4 cs4 ds4 e4) (c4 cs4 cs4 c4 cs4 d4 ds4 e4)
     (cs4 c4 d4 cs4 c4 cs4 d4) (cs4 c4 d4) (cs4 c4 d4 ds4 e4)
     (cs4 c4 cs4 d4) (ds4 e4) (cs4 c4 cs4 d4 ds4 e4)
     (cs4 c4 d4 cs4 c4 cs4 d4 ds4 e4)
     (c4 cs4 cs4 c4 d4 cs4 c4 cs4 d4 ds4 e4))

Note that sublists are handled as single items:

(power-set '(c4 (d4 e4) f4))
=> ((c4 (d4 e4))
    (c4)
    (c4 f4)
    ((d4 e4))
    (f4)
    ((d4 e4) f4)
    (c4 (d4 e4) f4))
