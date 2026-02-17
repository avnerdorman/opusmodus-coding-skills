Opusmodus                                                                     length-note-remove    1

length-note-remove lengths &key section exclude omn span omn
[Function]

Arguments and Values:
lengths               lists of lengths or OMN sequence form.
section               an integer or list of integers. Selected list or lists to process.
                      The default is NIL.
exclude               an integer or list of integers. Excluded list or lists from process.
                      The default is NIL.

OMN:
flat                  NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                  :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-NOTE-REMOVE will remove any length values which are not rests from a given
list. This might be a way of creating a new list using LENGTH-INVERT.

(setf r-len (rnd-sample 20 '(1/4 -1/8 1/8 -1/16 1/16 1/16 -1/4)))
=> (1/16 -1/16 1/8 1/4 -1/4 -1/8 1/16
    1/16 1/8 1/8 1/4 -1/16 -1/16 1/4
    -1/8 -1/16 1/4 -1/16 1/16 -1/16)

(setf f-len (length-note-remove r-len))
=> (-1/8 -1/16 -1/8 -1/8 -1/16 -1/4 -1/16 -1/16 -1/16 -1/4 -1/4)

(setf new-list (length-invert f-len)
=> (e s e = s q s = = q =)


Examples:
(length-note-remove '(-1/20 1/20 -1/1 1/10 1/4))
=> (-1/20 -1)

(length-note-remove '((-1/20 1/20 -1/20 1/10 1/4) (1/4 -1/4 1/8 -1/8)))
=> ((-1/20 -1/20) (-1/4 -1/8))

(length-note-remove '(5q q -q -5q e q))
=> (-1/4 -1/20)

(length-note-remove '((5q c4 --- cs5 w q d6 q ds3) (q d4 -q e -))
                    :section '(1) :omn t)
=> ((5q c4 -5qqq 5q cs5 w q d6 ds3) (-q -e))
                                                                   fl
