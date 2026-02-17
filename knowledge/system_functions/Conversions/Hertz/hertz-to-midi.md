Opusmodus                                                                         hertz-to-midi   1

hertz-to-midi list &key quantize remain
[Function]

Arguments and Values:
values                   a list or lists of hertz values.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

The function HERTZ-TO-MIDI converts a series of hertz values into midi numbers.


Examples:
(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520))
=> (69.25 81 88 93 96.75 100 103.5 105)

(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520)
               :quantize 1/2)
=> (69 81 88 93 97 100 103 105)

Microtone quantization (quarter tone):

(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520)
               :quantize 1/4)
=> (69.5 81 88 93 97 100 103.5 105)

Remain values are in cent:

(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520)
               :quantize 1/4 :remain t)
=> (-19 0 2 0 -14 2 -9 0)

Quantize 1/8 (eight tone):

(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520)
               :quantize 1/8)
=> (69.25 81 88 93 96.75 100 103.5 105)

(hertz-to-midi '(448 880 1320 1760 2200 2640 3212 3520)
               :quantize 1/8 :remain t)
=> (6 0 2 0 11 2 -9 0)
