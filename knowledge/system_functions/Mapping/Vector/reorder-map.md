Opusmodus                                                                                 reorder-map   1

reorder-map sequence map &key section exclude
[Function]

Arguments and Values:
sequence                 a sequence.
map                      a sequence.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function lets you sort the sequence according to a map, it is a good function if you
want to keep the material intact but reshape it.


Examples:
(reorder-map '(c4 c4 d4 d5 d4 eb4 eb4 d4 d4 eb4) (gen-integer 9))
=> (c4 c4 d4 d4 d4 d4 eb4 eb4 eb4 d5)

(reorder-map '(c4 c4 d4 d5 d4 eb4 eb4 d4 d4 eb4)
             (gen-gaussian-noise 10 :seed 23))
=> (d4 eb4 c4 d5 d4 d4 eb4 c4 eb4 d4)

(reorder-map '(1/1 1/4 1/2 7/8 3/8 5/16 9/8 5/4 3/32)
             (gen-integer 0 9))
=> (3/32 1/4 5/16 3/8 1/2 7/8 1 9/8 5/4)

(reorder-map
 (vector-round 1 34 (gen-gaussian-noise 21 :seed 23))
 (infinity-series 21 '(c4 d4)))
=> (15 18 12 26 18 14 7 28 11 23 14 17 19 9 1 34 17 14 5 27 13)
