Opusmodus                                                                          partial   1

partial partials &key type quantize remain
[Function]

Arguments and Values:
partilas                 a list of partials.
type                     :dur (duration), :freq (frequency) :amp (amplitude) and :pitch.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/2).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

The PARTIAL function returns partials of a given type data.

Opusmodus can work with two types of spectral data. A two point data: frequency and
amplitude and a three point data: duration, frequency and amplitude.

Example with two point data:

(partial :freq '(1178.9136 3.57E-4
                 2548.98 5.6E-5
                 1304.0593 3.87E-4
                 1651.8359 0.001961))
=> (1178.9136 2548.98 1304.0593 1651.8359)

(partial :amp '(1178.9136 3.57E-4
                2548.98 5.6E-5
                1304.0593 3.87E-4
                1651.8359 0.001961))
=> (3.57E-4 5.6E-5 3.87E-4 0.001961)


Example with three point data:

(partial :dur '(0.274875 1178.9136 3.57E-4
                0.137438 2548.98 5.6E-5
                0.124943 1304.0593 3.87E-4
                0.649705 1651.8359 0.001961))
=> (0.274875 0.137438 0.124943 0.649705)

(partial :freq '(0.274875 1178.9136 3.57E-4
                 0.137438 2548.98 5.6E-5
                 0.124943 1304.0593 3.87E-4
                 0.649705 1651.8359 0.001961))
=> (1178.9136 2548.98 1304.0593 1651.8359)
Opusmodus                                          partial   2

(partial :amp '(0.274875 1178.9136 3.57E-4
                0.137438 2548.98 5.6E-5
                0.124943 1304.0593 3.87E-4
                0.649705 1651.8359 0.001961))
=> (3.57E-4 5.6E-5 3.87E-4 0.001961)

(partial :pitch '(0.274875 1178.9136 3.57E-4
                   0.137438 2548.98 5.6E-5
                   0.124943 1304.0593 3.87E-4
                   0.649705 1651.8359 0.001961))
=> (d6 eb7 e6 gs6)

(partial :pitch '(0.274875 1178.9136 3.57E-4
                  0.137438 2548.98 5.6E-5
                  0.124943 1304.0593 3.87E-4
                  0.649705 1651.8359 0.001961)
         :quantize 1/4)
=> (d6 ds7+ e6 gs6)

(partial :pitch '(0.274875 1178.9136 3.57E-4
                  0.137438 2548.98 5.6E-5
                  0.124943 1304.0593 3.87E-4
                  0.649705 1651.8359 0.001961)
         :quantize 1/8)
=> (d6 ds7+ ds6.. gs6)
Opusmodus                                                        partial   3

Examples:

The graph below displays the entire partials data.

(list-plot
 (partial :freq
           (library 'tbn-cs3-partials 'partials nil :collect :all))
            :zero-based t :join-points t :point-radius 0)
Opusmodus                                                       partial   4

The following three graphs display a single partial.

(list-plot (partial :freq (library 'tbn-cs3-partials 'partials 'p0))
 :zero-based t :point-radius 2 :join-points t)




(list-plot (partial :freq (library 'tbn-cs3-partials 'partials 'p100))
           :zero-based t :point-radius 2 :join-points t)
Opusmodus                                                                       partial     5

(list-plot (partial :freq (library 'tbn-cs3-partials 'partials 'p200))
 :zero-based t :point-radius 2 :join-points t)




The partials data in our example is taken from a 'trombone cs3 mf' sample and was
imported from the SPEAR application: partials and frames. The index number of the partial
45 is taken from the frames data.

(setf p45 (library 'tbn-cs3-frames 'partials 'p45))
=> (95.271935 3.6E-5 138.08191 0.021617 172.93279 1.85E-4 230.43208
5.0E-5 276.258 0.022722 354.73016 3.7E-5 383.97556 2.3E-4 414.31592
0.022069 520.9055 6.79E-4 552.47125 0.051376 589.74567 7.33E-4 600.79034
6.93E-4 690.5632 0.026389 742.5119 3.74E-4 828.6215 0.02233 891.4862
3.93E-4 928.1881 7.86E-4 966.6297 0.028543 1019.62286 5.51E-4 1104.7264
0.008067 1163.4446 2.12E-4 1199.6445 6.56E-4 1243.0503 0.015087
1292.7169 4.43E-4 1335.8265 1.24E-4 1380.9473 0.004737 1447.9363 2.14E-4
1492.7141 1.66E-4 1519.538 0.003886 1617.3132 2.15E-4 1656.931 0.002984
1759.3162 1.02E-4 1795.5571 0.001464 1894.2975 9.2E-5 1933.7977 0.001791
2019.8506 4.6E-5 2070.7932 0.001046 2108.9717 1.41E-4 2209.0205 7.06E-4
2276.7856 4.1E-5 2347.4177 5.45E-4 2397.3323 4.7E-5 2484.204 2.43E-4
2547.6665 4.7E-5 2623.5063 2.16E-4 2762.4954 2.62E-4 2946.9617 3.8E-5
3038.4763 3.29E-4 3173.8875 6.6E-5 3313.7449 7.7E-5 3452.5198 1.08E-4
3587.0288 4.5E-5 3729.171 9.9E-5 3866.149 5.2E-5 4004.2124 7.3E-5
7181.6416 5.6E-5)

(partial :pitch p45)
=> (g2 cs3 f3 bb3 cs4 f4 g4 gs4 c5 cs5 d5 d5 f5 fs5 gs5 a5
    bb5 b5 c6 cs6 d6 d6 eb6 e6 e6 f6 fs6 fs6 fs6 gs6 gs6
    a6 a6 bb6 b6 b6 c7 c7 cs7 cs7 d7 d7 eb7 eb7 e7 f7 fs7
    fs7 g7 gs7 a7 a7 bb7 b7 b7 a8)
Opusmodus                                                                     partial   6

(partial :pitch p45 :quantize 1/4)
=> (fs2+ cs3 f3 bb3 cs4 f4+ fs4+ gs4 c5 cs5 d5 d5+ f5 fs5 gs5
    a5 bb5 as5+ b5+ cs6 d6 d6+ eb6 ds6+ e6 f6 f6+ fs6 fs6+ g6+
    gs6 a6 a6+ as6+ as6+ b6+ c7 c7 cs7 cs7+ d7 d7+ eb7 ds7+ e7
    f7 fs7 fs7+ g7 gs7 gs7+ a7+ bb7 as7+ b7 a8+)

To get the root pitches of the partials data we use the PITCH-ROW function:

(pitch-row (partial :pitch p45))
=> (g2 cs3 f3 bb3 gs4 c5 d5 fs5 a5 b5 eb6 e6)

(pitch-row (partial :pitch p45 :quantize 1/4))
=> (fs2+ cs3 f3 bb3 f4+ gs4 c5 d5 d5+ fs5 a5 as5+
    b5+ eb6 ds6+ e6 g6+ a6+ cs7+ g7 gs7+ b7)

Let’s make an omn list with all the partial types.

(make-omn
 :length (vector-to-length 1/16 1 5 (partial :amp p45))
 :pitch (sort-series '? (ambitus'(c2 c5)
          (gen-divide 6 (partial :pitch p45))))
 :velocity (vector-to-velocity 'p 'f (partial :amp p45)))

=> (s f4 p e. cs4 mp s bb3 p f3 e. cs3 mp s g2 p
    cs4 e. d4 mp s p q_s g4 f s gs4 p c5 e. f4 mp
    s fs4 p e. gs4 mp s a4 p bb4 e. b4 mf s c5 p
    e e4 s eb4 d4 e mp s cs4 p e4 f4 fs4 fs4 fs4
    gs4 b4 b4 bb4 a4 a4 gs4 cs4 cs4 d4 d4 c5 c5
    eb4 eb4 e4 f4 fs4 fs4 g4 gs4 a4 a4 bb4 b4 a4 b4)
