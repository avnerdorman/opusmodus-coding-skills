Opusmodus                                                                           length-merge   1

length-merge length &key flat span section exclude omn
[Function]

Arguments and Values:
length                    a list of lengths.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

LENGTH-MERGE will bring together all adjacent length values into groups of rests or
notes. This can be particularly useful when scoring for parts with chords against parts with
melodies.

(setf motif '(1/4 1/4 -1/8 -1/8 1/4 1/4))

(setf chords (length-merge motif))
=> (1/2 -1/4 1/2)


Examples:

Condense simple list:

(length-merge '(1/4 1/4 -1/8 -1/8 1/4 1/4))
=> (1/2 -1/4 1/2)

Force OMN-style output:

(length-merge '(1/4 1/4 -1/8 -1/8 1/4 1/4) :omn t)
=> (h -q h)

Condense an OMN list - note that some pitches are cut to match the original length:

(length-merge '(q c4 d4 -e - q e4 f4))
=> (h c4 -q h d4)

Condense an OMN list and extend resulting phrase to encompass all pitches:

(length-merge '(q c4 d4 -e - q e4 f4) :span :pitch)
=> (h c4 -q h d4 e4 -q h f4)
