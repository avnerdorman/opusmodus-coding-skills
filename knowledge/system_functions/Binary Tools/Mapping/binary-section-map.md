Opusmodus                                                             binary-section-map     1

binary-section-map map lists
[Function]

Arguments and Values:
map                     a binary lists.
lists                   lists of items.


Description:

The function BINARY-SECTION-MAP creates a new sequence from any number of
sequences mapped to section lists. The number of section lists and the number of sequences
must be the same.

(setf seq1 '((c4) (d4) (e4) (f4) (g4) (a4) (b4)))
(setf seq2 '((cs5) (ds5) (es5) (fs5) (gs5) (as5) (c6)))
(setf seq3 '((cb3) (db3) (eb3) (fb3) (gb3) (ab3) (bb3)))

(setf sec (gen-binary 3 7 :seed 65))
=> ((0 1 1 0 0 0 0)
    (1 0 0 1 0 1 0)
    (0 0 0 0 1 0 1))

(binary-section-map sec (list seq1 seq2 seq3))
=> ((cs5) (d4) (e4) (fs5) (gb3) (as5) (bb3))


Examples:

To see the function in action please have a look at score 'Air.opmo' which you will nd in
the 'ScoreExamples/Piano section.
                                                                            fi
