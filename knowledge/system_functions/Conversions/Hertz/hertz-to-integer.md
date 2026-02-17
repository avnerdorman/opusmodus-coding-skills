Opusmodus                                                                     hertz-to-integer   1

hertz-to-integer list &key quantize remain
[Function]

Arguments and Values:
values                   a list or lists of hertz values.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

The function HERTZ-TO-INTEGER converts a series of hertz values into integers.


Examples:
(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520))
=> (9.25 21 28 33 36.75 40 43.5 45)

(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520)
                  :quantize 1/2)
=> (9 21 28 33 37 40 43 45)

Microtone quantization (quarter tone):

(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520)
                  :quantize 1/4)
=> (9.5 21 28 33 37 40 43.5 45)

Remain values are in cents:

(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520)
                  :quantize 1/4 :remain t)
=> (-19 0 2 0 -14 2 -9 0)

Quantize 1/8 (eight tone):

(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520)
                  :quantize 1/8)
=> (9.25 21 28 33 36.75 40 43.5 45)

(hertz-to-integer '(448 880 1320 1760 2200 2640 3212 3520)
                  :quantize 1/8 :remain t)
=> (6 0 2 0 11 2 -9 0)
