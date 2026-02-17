Opusmodus                                                                    hertz-to-interval   1

hertz-to-interval list &key quantize remain
[Function]

Arguments and Values:
list                     a list or lists of hertz values.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

The function HERTZ-TO-INTERVAL converts a series of hertz values into intervals.


Examples:
(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520))
=> (11.75 7 5 3.75 3.25 3.5 1.5)

(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520)
                    :quantize 1/2)
=> (12 7 5 4 3 3 2)

Microtone quantization (quarter tone):

(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520)
                   :quantize 1/4)
=> (11.5 7 5 4 3 3.5 1.5)

Remain values are in cent:

(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520)
                   :quantize 1/4 :remain t)
=> (-19 0 2 0 -14 2 -9 0)

Quantize 1/8 (eight tone):

(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520)
                   :quantize 1/8)
=> (11.75 7 5 3.75 3.25 3.5 1.5)

(hertz-to-interval '(448 880 1320 1760 2200 2640 3212 3520)
                   :quantize 1/8 :remain t)
=> (6 0 2 0 11 2 -9 0)
