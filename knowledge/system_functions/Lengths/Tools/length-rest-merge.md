Opusmodus                                                                     length-rest-merge         1

length-rest-merge lengths &key flat span section exclude omn
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

LENGTH-REST-MERGE will bring together ONLY adjacent rests in a given list of
lengths, whereas the function LENGTH-MERGE brings together note and length values.

(setf motif '(1/4 1/4 -1/8 -1/8 1/4 1/4))

(setf chords-1 (length-merge motif))
=> (1/2 -1/4 1/2)

(setf chords-2 (length-rest-merge motif))
=> (1/4 1/4 -1/4 1/4 1/4)

(setf chords-3 (length-note-merge motif))
=> (1/2 -1/8 -1/8 1/2)


Examples:

Condense simple list:

(length-rest-merge '((1/4 1/4 -1/4 -1/8 1/8)
                       (1/4 -3/8 1/8)))
=> ((1/4 1/4 -3/8 1/8) (1/4 -3/8 1/8))

Force OMN-style output:

(length-rest-merge '(1/4 -1/4 -1/8 1/8) :omn t)
=> (q -q. e)
                                                                   fl
Opusmodus                                               length-rest-merge   2

OMN:

Condense an OMN list:

(length-rest-merge '(q c4 -q -e d4))
=> (q c4 -q. e d4)

(length-rest-merge '(q c4 p d4 f - - e e4g4 tie q. e4g4))
=> (q c4 p d4 f -h e e4g4 tie q.)

(length-rest-merge '(q c4 p d4 f - - q e4g4 tie q e4g4 - -e fermata))
=> (q c4 p d4 f -h q e4g4 tie e4g4 - -e fermata)
