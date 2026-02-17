Opusmodus                                                                        find-max      1

find-max numbers &key count
[Function]

Arguments and Values:
numbers                  a list of numbers.
count                    an integer. The default is 1.


Description:

This function returns the largest value or largest count values in a list of numbers. Use it
as an orchestration tool or in processing an existing part.

(find-max '(8 2 3 1 5))
=> 8

(find-max '(8 2 3 1 5) :count 3)
=> (8 3 5)

(find-max '(q e w 3q))
=> 1


Examples:

In the example below 9 of the maximum values in a pitch list are selected to form a
variation.

(setf orig (rnd-sample 16 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 651))
=> (cs4 fs4 c5 gs4 c5 d4 c4 cs4 c4 cs4 gs4 c4 c5 g4 cs4 gs4)

(setf motif (pitch-to-integer orig))
=> (1 6 12 8 12 2 0 1 0 1 8 0 12 7 1 8)

(find-max motif :count 9)
=> (6 12 8 12 2 8 12 7 8)

(setf motif-h (integer-to-pitch (find-max motif :count 9)))
=> (fs4 c5 gs4 c5 d4 gs4 c5 g4 gs4)

(setf map (gen-binary-remove motif-h orig))
=> (1 0 0 0 0 0 1 1 1 1 0 1 0 0 1 0)
Opusmodus                                          find-max   2

(binary-map map orig))
=> (cs4 c4 cs4 c4 cs4 c4 cs4)

(binary-map map 's))
=> (1/16 -1/16 -1/16 -1/16 -1/16 -1/16 1/16 1/16
    1/16 1/16 -1/16 1/16 -1/16 -1/16 1/16 -1/16)
