Opusmodus                                                                         midi-to-pitch   1

midi-to-pitch values &key quantize remain
[Function]

Arguments and Values:
values                a list or lists of midi numbers. Chords as sublists in a list.
quantize              NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                      The default is NIL (1/8).
remain                NIL or T (remaining values in cents). The default is NIL.


Description:

The function INTERVAL-TO-PITCH converts a series of midi values into their
corresponding pitches.


Examples:
(midi-to-pitch '(58 59 60 61 62))
=> (bb3 b3 c4 cs4 d4)

(midi-to-pitch '(58 (59 65) (60 67) 61 62))
=> (bb3 b3f4 c4g4 cs4 d4)

(setf values (rndn 12 12.5 90.5))
=> (38.96537 27.808388 76.06653 77.93306 72.31424 74.88196
    55.596214 25.426361 86.90184 87.19445 45.10756 26.023727)

(midi-to-pitch values)
=> (eb2 ds1.. e5 fs5 c5. eb5 g3+ cs1+ eb6 ds6. a2 d1)

(midi-to-pitch values :quantize 1/2)
=> (eb2 e1 e5 fs5 c5 eb5 gs3 cs1 eb6 eb6 a2 d1)

(midi-to-pitch values :quantize 1/4)
=> (eb2 e1 e5 fs5 c5+ eb5 g3+ cs1+ eb6 eb6 a2 d1)

Remaining cents:

(midi-to-pitch values :quantize 1/4 :remain t)
=> (-3 -19 7 -7 -19 -12 10 -7 -10 19 11 2)

(midi-to-pitch values :quantize 1/8 :remain t)
=> (-3 6 7 -7 6 -12 10 -7 -10 -6 11 2)
