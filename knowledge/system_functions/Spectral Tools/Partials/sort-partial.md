Opusmodus                                                                           sort-partial

sort-partial partials &key sort type seed
[Function]

Arguments and Values:
partials                a list of partials data.
sort                    'a (ascending), 'd (descending), 'ro (random order) and '? (at random).
type                    :dur (duration), :freq (frequency) and :amp (amplitude).
seed                    NIL or an integer. The default is NIL.


Description:

This function sorts partials of a given type data.

OPUSMODUS can work with two types of spectral data. A two point data: frequency
and amplitude and a three point data: duration, frequency and amplitude.

Example with two point data:

(sort-partial '(1178.9136 3.57E-4
                2548.98 5.6E-5
                1304.0593 3.87E-4
                1651.8359 0.001961))
=> (1178.9136 3.57E-4
    1304.0593 3.87E-4
    1651.8359 0.001961
    2548.98 5.6E-5)

(sort-partial '(1178.9136 3.57E-4
                2548.98 5.6E-5
                1304.0593 3.87E-4
                1651.8359 0.001961)
              :sort 'd)
=> (2548.98 5.6E-5
    1651.8359 0.001961
    1304.0593 3.87E-4
    1178.9136 3.57E-4)
Opusmodus                                       sort-partial

Example with three point data:

(sort-partial '(0.274875 1178.9136 3.57E-4
                0.137438 2548.98 5.6E-5
                0.124943 1304.0593 3.87E-4
                0.649705 1651.8359 0.001961))
=> (0.274875 1178.9136 3.57E-4
    0.124943 1304.0593 3.87E-4
    0.649705 1651.8359 0.001961
    0.137438 2548.98 5.6E-5)

(sort-partial '(0.274875 1178.9136 3.57E-4
                0.137438 2548.98 5.6E-5
                0.124943 1304.0593 3.87E-4
                0.649705 1651.8359 0.001961)
              :sort 'd)
=> (0.137438 2548.98 5.6E-5
    0.649705 1651.8359 0.001961
    0.124943 1304.0593 3.87E-4
    0.274875 1178.9136 3.57E-4)

(sort-partial '(0.274875 1178.9136 3.57E-4
                0.137438 2548.98 5.6E-5
                0.124943 1304.0593 3.87E-4
                0.649705 1651.8359 0.001961)
              :type :dur)
=> (0.124943 1304.0593 3.87E-4
    0.137438 2548.98 5.6E-5
    0.274875 1178.9136 3.57E-4
    0.649705 1651.8359 0.001961)
Opusmodus                                                                  sort-partial

Examples:

The partials data in our example is taken from a 'trombone cs3 mf' sample and
was imported from the SPEAR application: partials and frames. The index number of the
partial 45 is taken from the frames data.

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

(hertz-to-pitch (partial :freq (sort-partial p45 :sort 'd))
                :quantize 1/2)
=> (a8 b7 b7 bb7 a7 a7 gs7 g7 fs7 fs7 f7 e7 eb7 eb7
    d7 d7 cs7 cs7 c7 c7 b6 b6 bb6 a6 a6 gs6 gs6 fs6
    fs6 fs6 f6 e6 e6 eb6 d6 d6 cs6 c6 b5 bb5 a5 gs5
    fs5 f5 d5 d5 cs5 c5 gs4 g4 f4 cs4 bb3 f3 cs3 g2)
Opusmodus                                                                                     sort-partial

Here we are generating lengths from amplitude data with the VECTOR-TO-LENGTH
function:

(quantize
 (flatten
  (vector-to-length
   1/20 1 10
   (gen-divide
    6 (partial :amp (sort-partial p45 :sort 'ro :seed 23)))))
 '(1 2 4 5))



                     5               5                                           5




       2                     5           5       3                   5           5




       4         5                           5           5               5                5




       6     5           5           5               5       7               5                5




       8             5           5       5       9               5       5       10   5




                                                                                      Opusmodus
