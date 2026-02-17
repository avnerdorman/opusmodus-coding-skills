Opusmodus                                                                         length-to-rest        1

length-to-rest value sequence &key type swallow
                          section exclude omn flat span

[Function]

Arguments and Values:
value                     length symbol or ratio.
sequence                  list of lengths.
type                      'under or 'over.
swallow                   swallow omn-form items that align with rest-length. The default is T.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

This function allows the composer to set a length value to be changed to a rest-length value.

(length-to-rest 1/4 '(1/4 1/1 1/2 1/8 1/8 1/8 1/2 1/4 1/4))
=> (-1/4 1 1/2 1/8 1/8 1/8 1/2 -1/4 -1/4)

The ability of use the set value as a marker to control change in list values under or over that
value makes interesting rhythmic variations possible.


Examples:
(length-to-rest 1/16 '(1/16 1/8 1/4 1/32 1/32) :type 'under)
=> (1/16 1/8 1/4 -1/32 -1/32)

(length-to-rest 1/16 '(1/16 1/8 1/4 1/32 1/32) :type 'over)
=> (1/16 -1/8 -1/4 1/32 1/32)

(length-to-rest 'q '((q s e e q..) (e h q e)) :type 'over :omn t)
=> ((q s e = -q..) (e -h q e))
                                                                   fl
Opusmodus                                                 length-to-rest   2

OMN:

(length-to-rest 'e '(q c4 e cs4 e d4 s e4 f4 fs4 g4 q gs4 e a4 s bb4 b4)
                :type 'under)
=> (q c4 e cs4 d4 -s - - - q gs4 e a4 -s -)

With :swallow NIL

(length-to-rest 'e '(q c4 e cs4 e d4 s e4 f4 fs4 g4 q gs4 e a4 s bb4 b4)
                :swallow nil
                :type 'under)
=> (q c4 -e - -s - - - q cs4 -e -s -)
