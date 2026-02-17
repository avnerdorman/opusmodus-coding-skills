Opusmodus                                                                    length-rest-remove    1

length-rest-remove length &key section exclude omn span omn
[Function]

Arguments and Values:
lengths                   lists of lengths or OMN sequence form.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten.
                          The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-REST-REMOVE will remove any rest length values which are not notes from a
given list. This might be a way of creating a new list which might act as a variant or loop
simultaneously with the original list.

(setf r-len (rnd-sample 20 '(1/4 -1/8 1/8 -1/16 1/16 1/16 -1/4)))
=> (1/16 -1/16 1/8 1/4 -1/4 -1/8 1/16
    1/16 1/8 1/8 1/4 -1/16 -1/16 1/4
    -1/8 -1/16 1/4 -1/16 1/16 -1/16)

(setf new-list (length-rest-remove r-len))
=> (1/16 1/8 1/4 1/16 1/16 1/8 1/8 1/4 1/4 1/4 1/16)


Examples:
(length-rest-remove '(-1/20 1/20 -1/1 1/10 1/4))
=> (1/20 1/10 1/4)

(length-rest-remove '((-1/20 1/20 -1/20 1/10 1/4) (1/4 -1/4 1/8 -1/8)))
=> ((1/20 1/10 1/4) (1/4 1/8))

(length-rest-remove '(5q q -q -5q e q))
=> (1/20 1/4 1/8 1/4)

(length-rest-remove '((5q c4 --- cs5 w q d6 q ds3) (q d4 - e -))
                    :section '(1) :omn t)
=> ((5q c4 -5qqq 5q cs5 w q d6 ds3) (q d4 e))
                                                                   fl
