Opusmodus                                                                       hertz-to-pitch   1

hertz-to-pitch values &key quantize remain
[Function]

Arguments and Values:
values                   a list or lists of hertz values.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

The function HERTZ-TO-PITCH converts a series of hertz values into pitch equivalents,
based on 440 = a4.


Examples:
(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520))
=> (a4. a5 e6 a6 c7.. e7 g7+ a7)

(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520) :quantize 1/2)
=> (a4 a5 e6 a6 cs7 e7 g7 a7)

Microtone quantization (quarter tone):

(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520) :quantize 1/4)
=> (a4+ a5 e6 a6 cs7 e7 g7+ a7)

Remain values are in cent:

(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520)
                :quantize 1/4 :remain t)
=> (-19 0 2 0 -14 2 -9 0)

Quantize 1/8 (eight tone):

(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520)
                :quantize 1/8)
=> (a4. a5 e6 a6 c7.. e7 g7+ a7)

(hertz-to-pitch '(448 880 1320 1760 2200 2640 3212 3520)
                 :quantize 1/8 :remain t)
=> (6 0 2 0 11 2 -9 0)
