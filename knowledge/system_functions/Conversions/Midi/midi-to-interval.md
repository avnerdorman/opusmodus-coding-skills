Opusmodus                                                                      midi-to-interval   1

midi-to-interval values key quantize remain
[Function]

Arguments and Values:
values                 a list or lists of midi numbers. Chords as sublists in a list.
quantize               NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                       The default is NIL (1/8).
remain                 NIL or T (remaining values in cents). The default is NIL.


Description:

The function MIDI—TO-INTERVAL converts a series of midi values into their
corresponding intervals.


Examples:
(midi-to-interval '(58 59 60 61 62))
=> (1 1 1 1)

(midi-to-interval '(58 (59 65) (60 67) 61 62))
=> (nil (1 6) (-5 7) -6 1)
