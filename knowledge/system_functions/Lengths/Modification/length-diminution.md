Opusmodus                                                                      length-diminution       1

length-diminution value lengths &key flat span omn section exclude
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

LENGTH-DIMUNUTION will modify a series of lengths by dividing each length by a
given value.

(length-diminution
 2 '(1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8))
=> (1/16 1/16 1/16 1/16 -1/16 1/16 1/16 -1/16)

We might also use sublists of lengths:

(length-diminution
 2 '((1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)
     (1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)))
=> ((1/16 1/16 1/16 1/16 -1/16 1/16 1/16 -1/16)
    (1/16 1/16 1/16 1/16 -1/16 1/16 1/16 -1/16))

Or we could use sublists for both values and lengths:

(length-diminution
 '(2 3) '((1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)
          (1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)))
=> ((1/16 1/16 1/16 1/16 -1/16 1/16 1/16 -1/16)
    (1/24 1/24 1/24 1/24 -1/24 1/24 1/24 -1/24))
                                                                   fl
Opusmodus                                                         length-diminution   2

Examples:
(setf len-1 (gen-length-cartesian
             1 1 'm 'n 4 '(2 3) '(2 5 7 2 4) '(1 2 4) :seed 12))
=> ((1/4 1/4)
    (1/4 1/8 1/8 1/8 1/8)
    (1/16 1/16 1/16 1/16 1/4 1/8 1/8)
    (1/4 1/4)
    (1/8 1/8 1/8 1/8))

(length-diminution '(2 3 1 2 3) len-1)
=> ((1/8 1/8)
    (1/12 1/24 1/24 1/24 1/24)
    (1/16 1/16 1/16 1/16 1/4 1/8 1/8)
    (1/8 1/8)
    (1/24 1/24 1/24 1/24))

Diminution by different value for each list on section 1 and 3:

(length-diminution '(2 3) '((q c4 - e4 - g4 - b4 -)
                            (q bb4 - gs4 - eb4 - cs4 -)
                            (q c4 - e4 - g4 - b4 -)
                            (q cs4 - e4 - gs4 - as4 -))
                     :section '(1 3))
=> ((q c4 - e4 - g4 - b4 -)
    (3q bb4 - gs4 - eb4 - cs4 -)
    (q c4 - e4 - g4 - b4 -)
    (3q cs4 - e4 - gs4 - as4 -))
