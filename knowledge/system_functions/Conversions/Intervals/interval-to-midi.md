Opusmodus                                                                    interval-to-midi   1

interval-to-midi list &key ambitus start quantize remain
[Function]

Arguments and Values:
list                   a list or lists of intervals. Chords as sublists in a list.
ambitus                a pitch symbol (low high), integers (low high) or instrument name.
                       The default is 'piano.
start                  an integer or pitch symbol. The default is 0 (c4).
quantize               NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                       The default is NIL (1/8).
remain                 NIL or T (remaining values in cents). The default is NIL.


Description:

The function INTERVAL-TO-MIDI converts a series of intervals into their corresponding
midi vales. By default it is assumed that the intervals :start from 0 (c4 in terms of
integer-pitch relations).


Examples:
(interval-to-midi '(1 1 1 1))
=> (60 61 62 63 64)

(interval-to-midi '(nil (1 6) (-5 7) -6 1) :start 0)
=> (60 (61 67) (62 69) 63 64)
