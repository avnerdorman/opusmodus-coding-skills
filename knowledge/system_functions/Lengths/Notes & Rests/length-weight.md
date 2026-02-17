Opusmodus                                                                        length-weight   1

length-weight sequence &key weight section exclude seed omn
[Function]

Arguments and Values:
sequence                lists of lengths or OMN sequence form.
weight                  two integer list. The rst value is the weight of the note length,
                        the second value is the weight of the rest lengths.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
seed                    NIL or an integer. The default is NIL.
omn                     NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function enables you to create rest lengths in a list of note lengths. The :weight
keyword allows you to control the weighting between note and rest values in relation
to a sequence lengths.

(setf len1 '(1/4 1/16 1/8 1/16 1/2 1/8 1/8 1/8 1/8))

(length-weight len1)
=> (1/4 1/16 1/8 -1/16 1/2 -1/8 1/8 1/8 1/8)

The count and distribution of rest lengths are controlled by weighting values and random
operation, although the output may be control by :seed. In the example bellow the
weighting is set to have a distribution of 3 lengths to 1 rest length.

(length-weight len1 :weight '(3 1) :seed 54)
=> (-1/4 1/16 1/8 -1/16 1/2 1/8 1/8 1/8 1/8)



Examples:
(setf len2 (gen-length-cartesian
              1 1 'm 'n 4 '(2 3) '(2 5 7 2 4) '(1 2 4) :seed 12))
=> ((1/4 1/4)
    (1/8 1/8 1/4 1/8 1/8)
    (1/4 1/8 1/8 1/16 1/16 1/16 1/16)
    (1/4 1/4)
    (1/8 1/8 1/8 1/8))
                                    fi
Opusmodus                                                  length-weight   2

(length-weight len2 :seed 12)
=> ((-1/4 1/4)
    (-1/8 1/8 1/4 -1/8 1/8)
    (1/4 1/8 -1/8 1/16 -1/16 1/16 1/16)
    (1/4 1/4)
    (-1/8 1/8 1/8 -1/8))

(length-weight len2 :weight '(3 1) :seed 12)
=> ((1/4 1/4)
    (-1/8 1/8 1/4 1/8 1/8)
    (1/4 1/8 -1/8 1/16 1/16 1/16 1/16)
    (-1/4 1/4)
    (1/8 1/8 1/8 1/8))

OMN:

(length-weight '((q c4 d4 e4 f4 g4 a4 b4) (q c4 d4 e4 f4 g4 a4 b4))
               :weight '((3 1) (5 2)) :seed 52)
=> ((-q - e4 f4 - a4 b4)
    (-q - e4 f4 - - b4))
