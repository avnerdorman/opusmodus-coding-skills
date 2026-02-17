Opusmodus                                                                           gen-transform   1

gen-transform sequence &key interval prob section exclude seed omn
[Function]

Arguments and Values:
sequence                 a list or lists.
interval                 a list of integers (minus or plus).
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     an integer. Ensure the same result each time the code is evaluated.
                         The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function returns a new list by adding an interval value (selected at random) to a
number of elements of the sequence. The number of the selected elements (count) is
depending on a probability value.

(gen-transform '(0 0 0 0 0 0 0 0 0 0)
               :interval '(4 12 7) :prob 0.5)
=> (4 0 0 12 7 -7 -12 0 0 -4)


Examples:
(gen-transform '(0 1 2 3 4 5 6 7 8 9 10 11)
               :interval '(1 -1 2 -2 3 -3) :prob 0.5)
=> (0 0 -1 3 4 5 6 7 8 12 11 11)

(gen-transform '(1/4 1/4 1/4 1/4 1/4)
               :interval '(-1/32 1/32) :prob 0.7)
=> (9/32 9/32 1/4 7/32 7/32)

(gen-transform '(c1 c2 c3 c4 c5 c6)
               :interval '(1 -1) :prob 0.7)
=> (b0 c2 b2 cs4 c5 cs6)
Expressions with sublists:

(setf pitches '((c1 c2 c3 c4 c5 c6) (c1 c2 c3 c4 c5 c6)))

(gen-transform pitches :interval '(1 -1) :prob 0.7)
=> ((c1 cs2 cs3 b3 b4 c6) (cs1 b1 c3 c4 cs5 b5))
                    fl
Opusmodus                                                  gen-transform   2

(gen-transform pitches
               :interval '((1 -1) (-13 13))
               :prob '(0.3 0.9))
=> ((cs1 c2 c3 c4 c5 b5) (b0 cs3 c3 c4 b3 cs7))

(gen-transform pitches :interval '(1 -1) :prob 0.7 :section 1)
=> ((c1 c2 c3 c4 c5 c6) (c1 cs2 c3 c4 b4 c6))

(gen-transform pitches :interval '(1 -1) :prob 0.7 :exclude 1)
=> ((cs1 c2 cs3 b3 c5 b5) (c1 c2 c3 c4 c5 c6))
