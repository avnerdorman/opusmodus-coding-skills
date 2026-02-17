Opusmodus                                                                       gen-trim-sum       1

gen-trim-sum n sequence
[Function]

Arguments and Values:
n                         an integer (sum).
sequence                  a list of integers.


Description:

GEN-TRIM-SUM will either trim or span a sequence of integers to match a given n sum.

(gen-trim-sum 64 '(4 5 7 3))
=> (4 5 7 3 4 5 7 3 4 5 7 3 4 3)

(gen-trim-sum 8 '(1 2 3 1 2 3 1 2 3 1 2 3))
=> (1 2 3 1 1)

If the sum cannot be successfully made, a nal 'make-up' value will be added:

(gen-trim-sum 17 '(5 2))
=> (5 2 5 2 3)


Examples:

This enables the trim function to be used creatively on integer lists as a division tool. Here's
an example of how GEN-TRIM-SUM can be used in the context of organising data from a
stream of GEN-NOISE samples.

(setf stream-data
      (vector-to-list (vector-round 0 12 (gen-noise 64 :seed 87))))
=> (1 2 2 2 11 3 8 4 5 6 4 8 4 12 6 2 12 6 3 ... )

This shows how the trim function can display the number of lists of particular sizes possible
within 64 samples.

(setf div-lis (gen-trim-sum 64 '(4 5 7 3)))
=> (4 5 7 3 4 5 7 3 4 5 7 3 4 3)

(gen-divide div-lis stream-data)
=> ((1 2 2 2) (11 3 8 4 5) (6 4 8 4 12 6 2) (12 6 3) (6 4 12 4)
    (3 1 4 4 6) (7 0 4 8 4 11 12) (6 6 0) (3 2 3 0) (7 1 0 7 5)
    (2 7 9 1 8 12 3) (1 1 9) (1 0 0 8) (1 8 7))
                                       fi
