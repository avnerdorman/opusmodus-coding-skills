Opusmodus                                                                           mclength      1

mclength list
[Function]

Arguments and Values:
list                      list of items.


Description:

The function MCLENGTH is a valuable tool for simplifying (mapcar 'length lists).
One of the essential tools in handling and processing list of data, it is one of the few a LISP
primitives that every composer using OPUSMODUS needs to know! It returns a list of
integers that are the length of sublists.

(mclength '((g4 fs4) (cs4 cs4 g4 cs4 c5)
            (cs4 fs4 c5 g4 c5 fs4 fs4)
            (c5 c5) (g4 c4 c4 cs4)))
=> (2 5 7 2 4)


Examples:
(setf pitch (gen-divide '(2 5 7) (rnd-sample 24 '(c4 cs4 fs4 g4 c5))))
=> ((cs4 fs4) (cs4 fs4 c4 g4 g4) (c4 fs4 fs4 c5 c4 g4 fs4)
    (g4 g4) (c5 c4 cs4 g4 g4) (fs4 cs4 c5))

(setf group (mclength pitch))
=> (2 5 7 2 5 3)

(gen-length-cartesian 1 1 'n 'n 'q '(2 3) group '(1 2 3 4) :seed 12)
=> ((q q) (e e q e e) (3q 3q 3q s s s s) (q q) (e e 3q 3q 3q) (q q q))
