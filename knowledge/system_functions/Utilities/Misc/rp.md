Opusmodus                                                                                rp   1

rp lists
[Function]

Arguments and Values:
lists                     a list of pair lists (<number> <item>).


Description:

This function result derives from a pair-list (<number> <item>) and returns a number of
repeats on a given item. This function is useful when a series of repeat symbols is written by
hand (a kind of shorthand).


Examples:

Variants:

(rp '((8 p) (8 >) (8 r) (4 i) (4 ?)))
=> (p p p p p p p p > > > > > > > > r r r r r r r r i i i i ? ? ? ?)

Attributes:

(rp '((7 leg) -))
=> (leg leg leg leg leg leg leg -)

(rp '(((7 leg) -) (marc+leg (6 leg) -)))
=> ((leg leg leg leg leg leg leg -)
    (marc+leg leg leg leg leg leg leg -))

Numbers:

(rp '((4 0) (4 -1) (4 -2) (4 3) (4 -5)
      (4 6) (4 -7) (4 8) (4 -9) (4 10)))
=> (0 0 0 0 -1 -1 -1 -1 -2 -2 -2 -2 3 3 3 3 -5 -5 -5 -5
    6 6 6 6 -7 -7 -7 -7 8 8 8 8 -9 -9 -9 -9 10 10 10 10)
