Opusmodus                                                                mcflatten   1

mcflatten list
[Function]

Arguments and Values:
list                  list of items.


Description:

The function MCFLATTEN is a valuable tool for simplifying (mapcar 'flatten list).
This is one of the essential tools in the handling and processing of lists of data.

(mcflatten '(((c4) (cs4)) ((fs4) (f4)) ((b4) (c4))))
=> ((c4 cs4) (fs4 f4) (b4 c4))


Examples:
(mcflatten '(((d3 eb5d5c5) (g3 cs6d6b5)) (f3 c7a6eb7 e3c3f3)
             ((bb3eb3 fs4g4) (e3 b5))))
=> ((d3 eb5d5c5 g3 cs6d6b5) (f3 c7a6eb7 e3c3f3)
    (bb3eb3 fs4g4 e3 b5))

Note the similarity and difference between MCFLATTEN and ASSEMBLE-SEQ.

(assemble-seq '(((d3 eb5d5c5) (g3 cs6d6b5))
                (f3 c7a6eb7 e3c3f3) ((bb3eb3 fs4g4) (e3 b5))))
=> ((d3 eb5d5c5 g3 cs6d6b5) (f3 c7a6eb7 e3c3f3)
    (bb3eb3 fs4g4) (e3 b5))

(setf mat1 '((c4 db4) (ab4 f4) (g4 bb4) (a4 eb4) (b4 e4) (d4 gb4)))
(setf mat2 '((db4 ab4) (f4 g4) (bb4 a4) (eb4 b4) (e4 d4) (gb4 c4)))

(setf combine (gen-combine mat1 mat2))
=> (((c4 db4) (db4 ab4)) ((ab4 f4) (f4 g4))
    ((g4 bb4) (bb4 a4)) ((a4 eb4) (eb4 b4))
    ((b4 e4) (e4 d4)) ((d4 gb4) (gb4 c4)))

(mcflatten combine)
=> ((c4 db4 db4 ab4) (ab4 f4 f4 g4)
    (g4 bb4 bb4 a4) (a4 eb4 eb4 b4)
    (b4 e4 e4 d4) (d4 gb4 gb4 c4))

(assemble-seq combine)
=> ((c4 db4) (db4 ab4) (ab4 f4) (f4 g4)
    (g4 bb4) (bb4 a4) (a4 eb4) (eb4 b4)
    (b4 e4) (e4 d4) (d4 gb4) (gb4 c4))
