Opusmodus                                                                    length-rest-invert         1

length-rest-invert lengths &key flat span omn section exclude
[Function]

Arguments and Values:
lengths                   lists of lengths or OMN sequence form.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-REST-INVERT will convert all and only the rests in a given series of lengths
into sounding notes. The function can be a valuable orchestration tool. For example:

(length-rest-invert '(1/4 1/4 -1/8 -1/8 1/4 1/4))
=> (1/4 1/4 1/8 1/8 1/4 1/4)


Examples:
(length-rest-invert '(1/4 1/4 -1/8 -1/8 1/4 1/4))
=> (1/4 1/4 1/8 1/8 1/4 1/4)

Force OMN-style output:

(length-rest-invert '(1/4 1/4 -1/8 -1/8 1/4 1/4) :omn t)
=> (q = e = q =)

OMN:

Invert rests in an OMN list - note that some pitches are repeated to match the original length:

(length-rest-invert '(q c4 d4 -e - q e4 f4))
=> (q c4 d4 e e4 f4 q c4 d4)

Invert rests in an OMN list but keep the original number of pitches:

(length-rest-invert '(q c4 d4 -e - q e4 f4) :span :pitch)
=> (q c4 d4 e e4 f4)
                                                                   fl
