Opusmodus                                                                  sort-count-desc    1

sort-count-desc sequence
[Function]

Arguments and Values:
sequence                   a list or lists of items.


Description:

The function SORT-COUNT-DESC will sort a series of lists into descending order of length.
This can be particularly useful in dealing with lists generated from sources such as white-
noise. Note that the internal sorting of each individual list does not take place.

(sort-count-desc '((1 2 3 4 5) (1 2 3) (1 2 3 4) (1 2) (1)))
=> ((1 2 3 4 5) (1 2 3 4) (1 2 3) (1 2) (1))


Examples:

This can be particularly useful in dealing with lists generated from sources such as white-
noise.

(setf white-pitch
      (gen-divide
       (rndn 10 1 7)
       (rnd-sample 30 (vector—to-pitch
                      '(g3 b4) (gen-noise 30)))))

=> ((a3 b3) (a3 g4) (gb4 a3 b4) (eb4 b4 a3)
    (a3 b4 a3 gb4 ab3) (ab3 a3 ab3 g4 eb4)
    (a3 b3 b4 ab3 g3 a3) (gb4 ab3 eb4) (a4))

(setf s-white-noise (sort-count-desc white-pitch))
=> ((a3 b3 b4 ab3 g3 a3) (ab3 a3 ab3 g4 eb4)
    (a3 b4 a3 gb4 ab3) (eb4 b4 a3) (gb4 ab3 eb4)
    (gb4 a3 b4) (a3 b3) (a3 g4) (a4))

To sort the contents of the white-noise list:

(sort-desc s-white-noise)
=> ((b4 b3 a3 a3 ab3 g3) (g4 eb4 a3 ab3 ab3)
    (b4 gb4 a3 a3 ab3) (b4 eb4 a3) (gb4 eb4 ab3)
    (b4 gb4 a3) (b3 a3) (g4 a3) (a4))
