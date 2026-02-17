Opusmodus                                                                               nth-event        1

nth-event n sequence &key group
[Function]

Arguments and Values:
n                       A non-negative integer specifying the index of the event to be retrieved.
sequence                OMN-form sequence.
group                   A boolean value, defaulting to NIL. When set to T, it takes into consideration
                        tuplet grouping in the sequence.


Description:

The function NTH-EVENT retrieves the nth event from a given OMN sequence. The index of
the event to return is speci ed by the n parameter. If the group parameter is set to T and
some of the events in the sequence are tuplets, the function will return these events as a
group, preserving the original tuplet structure.


Examples:
(setf omn '(e g4 f leg gs4 fs4 mf leg a4 s f4 p bb4 e4 b4 eb4 c5 f))

In this example, NTH-EVENT retrieves the rst event from the OMN sequence.

(nth-event 0 omn)
=> (e g4 f leg)

Here, NTH-EVENT retrieves the fth event (0-base) from the OMN sequence.

(nth-event 4 omn)
=> (s f4 p)
                   fi
                         fi
                                     fi
