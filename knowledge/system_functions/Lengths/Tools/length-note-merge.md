Opusmodus                                                                     length-note-merge         1

length-note-merge lengths &key flat span section exclude omn
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

LENGTH-NOTE-MERGE will bring together ONLY adjacent notes in a given list of
lengths, whereas the function LENGTH-MERGE brings together note and length values.

(setf motif '(1/4 1/4 -1/8 -1/8 1/4 1/4))

(setf chords-1 (length-merge motif))
=> (1/2 -1/4 1/2)

(setf chords-3 (length-note-merge motif))
=> (1/2 -1/8 -1/8 1/2)

(setf chords-2 (length-rest-merge motif))
=> (1/4 1/4 -1/4 1/4 1/4)


Examples:
(length-note-merge '(1/4 1/4 -1/2 1/8 1/8))
=> (1/2 -1/2 1/4)

Force OMN-style output:

(length-note-merge '(1/4 1/4 -1/2 1/8 1/8) :omn t)
=> (h - q)
                                                                   fl
Opusmodus                                                              length-note-merge   2

OMN:

Condense an OMN list - note that some pitches are cut to match the original length:

(length-note-merge '(q c4 d4 -h e e4 f4))
=> (h c4 - q d4)

Condense an OMN list and extend resulting phrase to encompass all pitches:

(length-note-merge '(q c4 d4 -h e e4 f4) :span :pitch)
=> (h c4 - q d4 h e4 - q f4)
