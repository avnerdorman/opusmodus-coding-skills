Opusmodus                                                                        omn-butlast-event        1

omn-butlast-event sequence &key group last
[Function]

Arguments and Values:
sequence                 OMN-form sequence.
group                    A boolean value, defaulting to NIL. When set to T, it takes into consideration
                         tuplet grouping in the sequence.
last                     A non-negative integer, defaulting to 1. This speci es the number of last
                         events to omit from the sequence.


Description:

The function OMN-BUTLAST-EVENT returns a list that contains all the OMN events in the
input sequence, excluding the last events. The count of last events to omit from the
returned list can be customised by specifying the last parameter. This is particularly useful
for musical transformations where the ending of a passage needs to be modi ed or omitted. If
the group parameter is set to T and the last events in the sequence are tuplets, the
function will exclude these events as a group, preserving the original tuplet structure.


Examples:
(setf seq '(q c4 d4 e4 f4))

(omn-butlast-event seq)
=> (q c4 d4 e4)

(setf omn '(e g4 f leg gs4 fs4 mf leg a4 s f4 p bb4 e4 b4 eb4 c5 f))

(omn-butlast-event omn)
=> (e g4 f leg gs4 fs4 mf leg a4 s f4 p bb4 e4 b4 eb4)

(omn-butlast-event omn :last 2)
=> (e g4 f leg gs4 fs4 mf leg a4 s f4 p bb4 e4 b4)
                                                                    fi
                                                                            fi
