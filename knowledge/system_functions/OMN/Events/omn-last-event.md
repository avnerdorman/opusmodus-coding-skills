Opusmodus                                                                          omn-last-event         1

omn-last-event sequence &key group last
[Function]

Arguments and Values:
sequence                 omn-form sequence.
group                    A boolean value, defaulting to NIL. When set to T, it takes into consideration
                         tuplet grouping in the sequence.
last                     A non-negative integer, defaulting to 1. This speci es the number of last
                         events to return from the sequence.


Description:

The function OMN-LAST-EVENT retrieves the last events from a given OMN
sequence. By default, it returns the last event. The count of last events to return can be
customised by specifying the last parameter. If the group parameter is set to T and the
last events in the sequence are tuplets, the function will return these events as a group,
preserving the original tuplet structure.


Examples:
(setf omn '(e g4 f leg gs4 fs4 mf leg a4 s f4 p bb4 e4 b4 eb4 c5 f))

(omn-last-event omn)
=> (s c5 f)

(omn-last-event omn :last 2)
=> (s eb4 p c5 f)
                                                                    fi
