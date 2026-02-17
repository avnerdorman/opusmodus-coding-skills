Opusmodus                                                                          length-trim   1

length-trim n lengths &key omn
[Function]

Arguments and Values:
n                       number of length values requested (can be a list of values).
lengths                 list of lengths.
omn                     NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

LENGTH-TRIM can be used to trim a longer list of length values to a speci c number,
which excludes rests. This might be used, for example, to align lengths to a number of
pitches that have been generated elsewhere.

(length-trim 4 '(s = = - e =) :omn t)
=> (s = = - e)


Examples:

If the requested number of values exceed the number of lengths, then the material is
repeated:

(setf pitch (rnd-sample 12 '(c4 cs4 fs4 g4 c5)))
=> (cs4 c5 c5 c5 cs4 c4 cs4 c4 c5 g4 cs4 fs4)

(setf rhythm (length-trim 12 '(s = = - e =) :omn t))
=> (s = = - e = s = = - e = s =)

(span pitch rhythm)
=> (1/16 1/16 1/16 -1/16 1/8 1/8 1/16
      1/16 1/16 -1/16 1/8 1/8 1/16 1/16)

A list can also be used, giving a similar behaviour to LENGTH-SPAN, but working in terms
of length units rather than total durations:

(length-trim '(4 3 2 1) '(s = = - e =) :omn t)
=> ((s = = - e) (e s =) (s - e) (e))

(length-span '1/1 '(s = = - e =) :omn t)
=> (s = = - e = s = = - e =)
                                                                            fi
