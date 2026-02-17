Opusmodus                                                                       micro-quantize   1

micro-quantize values &key quantize remain
[Function]

Arguments and Values:
values                  a list of numbers, pitches and omn-from type sequence.
quantize                NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                        The default is NIL (1/2).
remain                  NIL or T (remaining values in cents). The default is NIL.


Description:

The function MICRO-QUANTIZE analyses each value in the list and returns the closest
possible value to the given quantize value. With the keyword :remain set to T the
function will return the remaining cent values - the difference between the given and
quantized value. This function can be used for analysis and processing purposes.


Examples:

Numbers:

(micro-quantize -1.1)
=> -1

(micro-quantize -1.1 :remain t)
=> -10

(micro-quantize 1.1)
=> 1

(micro-quantize 1.1 :remain t)
=> 10

(micro-quantize 1.48 :quantize 1/4)
=> 1.5

(micro-quantize 1.48 :quantize 1/4 :remain t)
=> -2

(micro-quantize -1.21)
=> -1

(micro-quantize -1.21 :remain t)
=> -21
Opusmodus                                                   micro-quantize   2

(setf numbers (rndn 12 -24.0 24.0))
=> (-7.713619 -14.579453 15.1178665 16.266499 12.808762 14.388897
    2.5207481 -16.045317 21.785748 21.965816 -3.9338093 -15.677707)

(micro-quantize numbers)
=> (-8 -15 15 16 13 14 3 -16 22 22 -4 -16)

(micro-quantize numbers :remain t)
=> (29 42 12 27 -19 39 -48 -5 -21 -3 7 32)

(micro-quantize numbers :quantize 1/4)
=> (-7.5 -14.5 15 16.5 13 14.5 2.5 -16 22 22 -4 -15.5)

(micro-quantize numbers :remain t :quantize 1/4)
=> (-21 -8 12 -23 -19 -11 2 -5 -21 -3 7 -18)

(micro-quantize numbers :quantize 1/8)
=> (-7.75 -14.5 15 16.25 12.75 14.5 2.5 -16 21.75 22 -4 -15.75)

(micro-quantize numbers :remain t :quantize 1/8)
=> (4 -8 12 2 6 -11 2 -5 4 -3 7 7)

Pitches:

(micro-quantize '(a4. a5 e6 a6 c7.. e7 g7+ a7))
=> (a4 a5 e6 a6 cs7 e7 gs7 a7)

(micro-quantize '(a4. a5 e6 a6 c7.. e7 g7+ a7) :quantize 1/4)
=> (a4 a5 e6 a6 c7+ e7 g7+ a7)

(micro-quantize '(a4. a5 e6 a6 c7.. e7 g7+ a7) :remain t)
=> (25 0 0 0 -25 0 50 0)

(micro-quantize '(a4. a5 e6 a6 c7.. e7 g7+ a7) :quantize 1/4 :remain t)
=> (-25 0 0 0 25 0 0 0)

OMN:

(micro-quantize '(e c4 c4+ fs3 as2+ b3+ b3 e3+ c3))
=> (e c4 c4 fs3 bb2 c4 b3 e3 c3)

(micro-quantize '(e c4 c4+ fs3 as2+ b3+ b3 e3+ c3) :remain t)
=> (0 50 0 50 -50 0 50 0)
