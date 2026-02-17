Opusmodus                                                                   length-retrograde        1

length-retrograde length &key flatten section
                               omn section exclude flat span

[Function]

Arguments and Values:
length                 lists of lengths or OMN sequence form.
flatten                NIL or T. The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
omn                    NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                   NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                   :length, :pitch or :velocity. The default is :length.


Description:

The function LENGTH-RETROGRADE reverses the order of items in a length list. It can be
useful for producing rhythmic variants.

(setf r1 '(s = = =) r2 '(s - = =) r3 '(s = - =) r4 '(s = = -))

(setf ry (assemble—seq r1 r2 r3 r4))
=> ((s = = =) (s - = =) (s = - =) (s = = -))

(setf rx (length-retrograde ry :omn t))
=> ((s = = =) (s = - =) (s - = =) (-s = = =))


Examples:
(length-retrograde '(-1/20 1/20 -1/20 1/10 1/4))
=> (1/4 1/10 -1/20 1/20 -1/20)

(length-retrograde '((-1/20 1/20 -1/20 1/10 1/4) (1/4 -1/4 1/8 -1/8)))
=> ((1/4 1/10 -1/20 1/20 -1/20)
    (-1/8 1/8 -1/4 1/4))

(length-retrograde '((-1/20 1/20 -1/20 1/10 1/4) (1/4 -1/4 1/8 -1/8))
                   :flatten t)
=> ((-1/8 1/8 -1/4 1/4)
    (1/4 1/10 -1/20 1/20 -1/20))
                                                                fl
Opusmodus                                               length-retrograde   2

(length-retrograde '(5q --- = -w 5q== == q) :omn t)
=> (q 5h 5qqq -w 5q -5qqq 5q)

(length-retrograde '((5q --- = -w 5q== == q) (q = e =)) :omn t)
=> ((q 5h 5qqq -w 5q -5qqq 5q)
    (e = q =))
