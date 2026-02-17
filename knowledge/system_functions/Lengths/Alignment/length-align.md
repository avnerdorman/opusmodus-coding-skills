Opusmodus                                                                                length-align      1

length-align lengths &key type position seed omn
[Function]

Arguments and Values:
lengths                      lists of length values to align.
type                         'r (rest),'n (note) or '? (at random), if not speci ed random type is used.
position                     position to add notes, 's (start), 'e (end), 'o (outer), or '? (at random),
                             if not speci ed random position is used.
omn                          NIL or T. T to force OMN style output.
seed                         NIL or an integer. The default is NIL.


Description

LENGTH-ALIGN can be used to align a series of length lists with one another, by adding
note lengths or rests to lists as required. The function searches for the longest list of
lengths and then makes up the difference in rest length values in other parts. For example,
we may have a section of a string quartet:

(setf v1 '(q h e. s q h e. s))
(setf v2 '(q h e. q h))
(setf va '(-e -s e s = = -e -s e s = = -e -s e s = =))
(setf vc '(h q e. s q. e))

We can align all these lists by adding rests 'r to the end 'l of them, using the following
convention:

(length-align (list v1 v2 va vc) :type 'r :position 'e)
=> ((1/4 1/2 3/16 1/16 1/4 1/2 3/16 1/16)
    (1/4 1/2 3/16 1/4 1/2 -5/16)
    (-1/8 -1/16 1/8 1/16 1/16 1/16 -1/8 -1/16 1/8 1/16 1/16 1/16
     -1/8 -1/16 1/8 1/16 1/16 1/16 -1/2)
    (1/2 1/4 3/16 1/16 3/8 1/8 -1/2))

Note, that this is somewhat dif cult to read and might be preferred in OMN-style output:

(length-align (list v1 v2 va vc) :type 'r :position 'e :omn t)
=> ((q h e. s q h e. s) (q h e. q h -q_s)
    (-e -s e s = = -e -s e s = = -e -s e s = = -h) (h q e. s q. e -h))
                        fi
                                fi
                                                                       fi
Opusmodus                                                   length-align   2

Examples:

Add rests to the start of each phrase

(length-align (list v1 v2 va vc) :type 'r :position 's :omn t)
=> ((q h e. s q h e. s) (-q_s q h e. q h)
    (-h -e -s e s = = -e -s e s = = -e -s e s = =)
    (-h = q e. s q. e))

Add rests to the end of each phrase:

(length-align (list v1 v2 va vc) :type 'r :position 'e :omn t)
=> ((q h e. s q h e. s) (q h e. q h -q_s)
    (-h -e -s e s = = -e -s e s = = -e -s e s = =)
    (h q e. s q. e -h))

Add rests to either side of the phrase:

(length-align (list v1 v2 va vc) :type 'r :position 'o :omn t)
=> ((q h e. s q h e. s) (-e_t q h e. q h -e_t)
    (-q -e -s e s = = -e -s e s = = -e -s e s = = -q)
    (-q h q e. s q. e -q))

Add rests in random :positions ('s 'e 'o):

(length-align (list v1 v2 va vc) :type 'r :omn t)
=> ((q h e. s q h e. s) (q h e. q h -q_s)
    (-e -s e s = = -e -s e s = = -e -s e s = = -h)
    (h q e. s q. e -h))

Add new note lengths at the start:

(length-align (list v1 v2 va vc) :type 'n :position 's :omn t)
=> ((q h e. s q h e. s) (q_s q h e. q h)
    (h -e -s e s = = -e -s e s = = -e -s e s = =)
    (h = q e. s q. e))

Add new note lengths randomly, and use a :seed.

(length-align (list v1 v2 va vc) :type 'n :position '? :omn t :seed 12)
=> ((q h e. s q h e. s) (q h e. q h q_s)
    (-e -s e s = = -e -s e s = = -e -s e s = = h)
    (h q e. s q. e h))
