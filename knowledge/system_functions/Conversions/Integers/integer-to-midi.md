Opusmodus                                                                    integer-to-midi   1

integer-to-midi values &key quantize remain
[Function]

Arguments and Values:
values                 a list or lists of integers. Chords as sublists in a list.
quantize               NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                       The default is NIL (1/8).
remain                 NIL or T (remaining values in cents). The default is NIL.


Description:

The function INTEGER-TO-MIDI converts a series of integers into midi values.


Examples:
(setf motif (integer-to-midi '(-6 10 -9 2 6 -3 1 -5 2)))
=> (54 70 51 62 66 57 61 55 62)

(midi-to-pitch motif)
=> (fs3 bb4 eb3 d4 fs4 a3 cs4 g3 d4)

(integer-to-midi '(1 6 4 -2 6))
=> (61 66 64 58 66)

(integer-to-midi '(1 (6 4) -2 6))
=> (61 (66 64) 58 66)

(setf values (rndn 12 -12.5 12.5))
=> (38.96537 27.808388 76.06653 77.93306 72.31424 74.88196
    55.596214 25.426361 86.90184 87.19445 45.10756 26.023727)

(integer-to-midi values)
=> (56 52.5 67.75 68.5 66.75 67.5 61.25 51.75 71.25 71.5 58 51.75)

(integer-to-midi values :quantize 1/2)
=> (56 52 68 68 67 67 61 52 71 71 58 52)

(integer-to-midi values :quantize 1/4)
=> (56 52.5 68 68.5 66.5 67.5 61.5 51.5 71.5 71.5 58 52)

(integer-to-midi values :quantize 1/8)
=> (56 52.5 67.75 68.5 66.75 67.5 61.25 51.75 71.25 71.5 58 51.75)
