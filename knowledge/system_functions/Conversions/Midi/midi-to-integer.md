Opusmodus                                                                        midi-to-integer   1

midi-to-integer values &key quantize remain
[Function]

Arguments and Values:
values                 a list or lists of midi numbers. Chords as sublists in a list.
quantize               NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                       The default is NIL (1/8).
remain                 NIL or T (remaining values in cents). The default is NIL.


Description:

The function MIDI-TO-INTEGER converts a series of midi values into their corresponding
integers.


Examples:
(midi-to-integer '(58 59 60 61 62))
=> (-2 -1 0 1 2)

(midi-to-integer '(58 (59 65) (60 67) 61 62))
=> (-2 (-1 5) (0 7) 1 2)
