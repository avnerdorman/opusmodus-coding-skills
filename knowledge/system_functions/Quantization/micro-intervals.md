Opusmodus                                                   micro-intervals   1

How to generate micro intervals from various sources

I.
Input: Floating point numbers

(setf values (gen-noise 12))
=> (0.18478736 0.9568939 0.6663358 0.26542348 0.4052874
    0.68264747 0.95090246 0.12790146 0.86454636 0.7837427
    0.45705402 0.7908409)

(vector-to-pitch '(g3 g4) values)
=> (gs3 g4 eb4 a3 b3 eb4 g4 g3 fs4 e4 c4 f4)

(vector-to-pitch '(g3 g4) values :quantize 1/4)
=> (gs3 g4 eb4 a3 cs4 eb4 g4 g3 f4+ e4+ c4 e4+)

(vector-to-pitch '(g3 g4) values :quantize 1/8)
=> (g3.. g4 d4.. a3 cs4 eb4 g4 g3 f4.. e4+ c4. e4+)

Remaning cents:

(vector-to-pitch '(g3 g4) values :quantize 1/4 :remain t)
=> (-18 0 -21 -1 2 3 -9 0 16 -1 -24 10)

(vector-to-pitch '(g3 g4) values :quantize 1/8 :remain t)
=> (7 0 4 -1 2 3 -9 0 -9 -1 1 10)

II.
Input: Intervals

(setf intervals (vector-round -3.0 3.0 (gen-noise 12)))

(interval-to-pitch intervals)
=> (c4 d4. d4 cs4 as3. g3. a3 b3 d4 e4. cs4.. d4. cs4+)

(interval-to-pitch intervals :quantize 1/2)
=> (c4 d4 d4 cs4 bb3 g3 a3 b3 d4 e4 cs4 cs4 c4)

(interval-to-pitch intervals :quantize 1/4)
=> (c4 d4 d4 cs4 bb3 g3 a3 b3 d4 e4+ d4 d4+ eb4)

Remaning cents:

(interval-to-pitch intervals :quantize 1/4 :remain t)
=> (14 -6 0 19 0 -21 -17 0 -5 -9 -8 -17)
Opusmodus                                                   micro-intervals   2

III.
Input: Hertz

(setf hertz '(448 880 1320 1760 2200 2640 3212 3520))

(hertz-to-pitch hertz :quantize 1/2)
=> (a4 a5 e6 a6 cs7 e7 g7 a7)

(hertz-to-pitch hertz :quantize 1/4)
=> (a4+ a5 e6 a6 cs7 e7 g7+ a7)

(hertz-to-pitch hertz :quantize 1/8)
=> (a4. a5 e6 a6 c7.. e7 g7+ a7)

Remaning cents:

(hertz-to-pitch hertz :quantize 1/8 :remain t)
=> (6 0 2 0 11 2 -9 0)

IV.
Input: Partials

(setf p0 (library 'tbn-cs3-frames 'partials 'p0))
=> (46.067707 2.95E-4 115.95821 5.25E-4 178.55338 4.75E-4
    332.64972 2.27E-4 396.078 1.26E-4 473.80814 3.22E-4
    537.6982 3.0E-4 607.743 1.83E-4 664.09143 2.83E-4
    729.9078 7.8E-5 797.03345 2.55E-4 884.3352 5.94E-4
    1024.0735 1.94E-4 1083.0222 9.7E-5 1133.7655 6.7E-5
    1209.4451 1.0E-4 1336.6222 1.0E-4 1403.0239 7.4E-5
    1493.7784 7.4E-5 1588.0186 8.3E-5 1636.0596 9.4E-5
    1700.1648 6.5E-5 1849.3547 4.0E-5 1905.1188 3.6E-5
    2460.5183 3.3E-5 2549.2737 3.3E-5)

(partial :pitch p0 :quantize 1/4)
=> (fs1 bb2 f3+ e4 g4 as4+ c5+ d5+ e5 fs5 g5+ a5 b5+ c6+
    cs6+ d6+ e6 f6 fs6 g6 g6+ gs6+ bb6 as6+ eb7 ds7+)

(partial :pitch p0 :quantize 1/8)
=> (fs1 bb2 f3+ e4. g4. as4. c5+ d5+ e5. f5.. g5. a5 b5+
    c6+ cs6+ d6+ e6. f6 fs6. g6. g6.. gs6+ a6.. as6. d7.. ds7+)

Remaning cents:

(partial :pitch p0 :quantize 1/4 :remain t)
=> (-7 -9 -11 16 18 -22 -3 9 13 -24 -21 9 12 9
    -11 1 24 8 16 22 24 -10 -14 -13 -20 -9)

(partial :pitch p0 :quantize 1/8 :remain t)
=> (-7 -9 -11 -9 -7 3 -3 9 -12 1 4 9 12 9
    -11 1 -1 8 -9 -3 -1 -10 11 12 5 -9)
Opusmodus                                                                                                                      micro-intervals   3

V.
Adding remaining cents into notation:

(setf p0 (library 'tbn-cs3-frames 'partials 'p0))
(setf hertz (rnd-order (partial :freq p0)))
(setf pitches (hertz-to-pitch hertz :quantize 1/4))
(setf cents (hertz-to-pitch hertz :quantize 1/4 :remain t))
(setf lengths (quantize
               (vector-to-length
                1/20 1 10
                (gen-divide
                 6 (partial :amp (sort-partial p0 :sort 'rnd-order))))
               '(1 2 4 5)))

(make-omn
 :length lengths
 :pitch pitches
 :articulation (cent-to-attribute cents))

                                                                                       +8c
                   -7c        +1c                                                                       -9c
                          5                                                        +13c       5
                                                                 -3c                                                       5




                                                           5                   5




                                                                                                                    -13c
                                            -11c           +9c
                                    5                                                 +9c
                    -22c                                                       +18c
            2


                                                   5                                                    5                      5
                                                                           5


                                                                   +24c                                             -20c
                   -14c                                                               +16c
                                                                                                                8
                                   -24c
                                                           +9c
            3


                                                                                 5                          5
                                                       5


                                            -9c
                                    +12c
                                        8                                                    +24c               -10c               +22c
                  -21c        +16c
                                                                          -11c
            4                                                                                       5



                                                                  5                                                                5

                               5
                                                                                                                                   Opusmodus
