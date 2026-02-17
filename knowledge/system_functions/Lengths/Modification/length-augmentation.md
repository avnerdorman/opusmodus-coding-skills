Opusmodus                                                                  length-augmentation         1

length-augmentation value lengths &key flat span
                                      section exclude omn

[Function]

Arguments and Values:
value                    a number.
lengths                  lists of lengths or OMN sequence form.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                     NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                     :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-AUGMENTATION will modify a series of lengths by multiplying each length by a
given value.

(length-augmentation
 2 '(1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8))
=> (1/4 1/4 1/4 1/4 -1/4 1/4 1/4 -1/4)

We might also use sublists of lengths:

(length-augmentation
 2 '((1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)
     (1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)))
=> ((1/4 1/4 1/4 1/4 -1/4 1/4 1/4 -1/4)
    (1/4 1/4 1/4 1/4 -1/4 1/4 1/4 -1/4))

Or we could use sublists for both values and lengths:

(length-augmentation
 '(2 3) '((1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)
          (1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)))
=> ((1/4 1/4 1/4 1/4 -1/4 1/4 1/4 -1/4)
    (3/8 3/8 3/8 3/8 -3/8 3/8 3/8 -3/8))
                                                                  fl
Opusmodus                                                           length-augmentation   2

Examples:
(setf len-1 (gen-length-cartesian
             1 1 'm 'n 4 '(2 3) '(2 5 7 2 4) '(1 2 4) :seed 12))
=> ((1/4 1/4)
    (1/4 1/8 1/8 1/8 1/8)
    (1/16 1/16 1/16 1/16 1/4 1/8 1/8)
    (1/4 1/4)
    (1/8 1/8 1/8 1/8))

(length-augmentation '(2 3 1 2 3) len-1)
=> ((1/2 1/2)
    (3/4 3/8 3/8 3/8 3/8)
    (1/16 1/16 1/16 1/16 1/4 1/8 1/8)
    (1/2 1/2)
    (3/8 3/8 3/8 3/8))

Augmentation by different value for each list on section 1 and 3:

(length-augmentation '(2 3) '((q c4 - e4 - g4 - b4 -)
                              (q bb4 - gs4 - eb4 - cs4 -)
                              (q c4 - e4 - g4 - b4 -)
                              (q cs4 - e4 - gs4 - as4 -))
                     :section '(1 3))
=> ((q c4 - e4 - g4 - b4 -)
    (h. bb4 - gs4 - eb4 - cs4 -)
    (q c4 - e4 - g4 - b4 -)
    (h. cs4 - e4 - gs4 - as4 -))
