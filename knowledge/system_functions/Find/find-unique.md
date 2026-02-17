Opusmodus                                                                      find-unique      1

find-unique items &key from-end
[Function]

Arguments and Values:
items                    a list of items.
from-end                 T or NIL. The default is T.


Description:

This function returns all unique items from a list.

(find-unique '(c4 g4 f4 c4 bb3 c5))
=> (c4 g4 f4 bb3 c5)


Examples:
(find-unique '(a b (a b) (c d) c d (a b) a b (c d)))
=> (a b (a b) (c d) c d)

(find-unique '(a b (a b) (c d) c d (a b) a b (c d)) :from-end nil)
=> (c d (a b) a b (c d))

Sublists are handled as though they are single items so use FLATTEN or MAPCAR.

(mapcar 'find-unique '((c4 g4 f4 c4 bb3 c5) (c5 c4 cs4 c5 cs5)))
=> ((c4 g4 f4 bb3 c5) (c5 c4 cs4 cs5))

See below how novel tonalities might be extracted from the generation of lists of integers or
pitches.

(setf five-pentatonic
      (sort-asc
       (gen-divide
        5
        (find-unique
          (integer-to-pitch
           (vector-round 1 24 (gen-noise 50)))))))
=> ((d4 b4 gb5 g5 b5) (e4 ab4 eb5 e5 a5)
    (db4 gb4 db5 bb5 c6) (eb4 f4 g4 c5 ab5)
    (a4 d5 f5))

(create-tonality penta-1nm '(d4 b4 gb5 g5 b5))
