Opusmodus                                                       normalize-partial   1

normalize-partial partials
[Function]

Arguments and Values:
partials                 a list of partials data.


Description:

The NORMALIZE-PARTIAL function takes the list or oat-vector of partial number and
amplitudes, and returns a oat-vector with the amplitudes normalized so that their
magnitudes add to 1.0.

Opusmodus can work with two types of spectral data. A two point data: frequency and
amplitude and a three point data: duration, frequency and amplitude.

With two point data: frequency and amplitude:

(normalize-partial '(1178.9136 3.57E-4
                     2548.98 5.6E-5
                     1304.0593 3.87E-4
                     1651.8359 0.001961))
=> (1178.9136 0.12930098
    2548.98 0.020282505
    1304.0593 0.1401666
    1651.8359 0.7102499)

With three point data: time, frequency and amplitude:

(normalize-partial '(0.274875 1178.9136 3.57E-4
                     0.137438 2548.98 5.6E-5
                     0.124943 1304.0593 3.87E-4
                     0.649705 1651.8359 0.001961))
=> (0.274875 1178.9136 0.12930098
    0.137438 2548.98 0.020282505
    0.124943 1304.0593 0.1401666
    0.649705 1651.8359 0.7102499)
                   fl
                                                    fl
Opusmodus                                                            normalize-partial      2

Examples:

The partials data in our example is taken from a 'trombone cs3 mf' sample and was
imported from the SPEAR application: partials and frames. The index number of the partial
1 is taken from the frames data.

(setf p1 (library 'tbn-cs3-frames 'partials 'p1))
=> (45.908558 4.58E-4 123.81756 0.001462 172.09534 0.001135 344.95218
6.53E-4 399.65335 5.86E-4 478.26154 0.001062 537.47565 7.72E-4 611.2551
4.51E-4 660.3762 7.45E-4 725.1744 2.85E-4 791.167 6.37E-4 882.8302
0.001411 1023.7408 5.22E-4 1087.0115 2.44E-4 1141.0875 2.1E-4 1211.5409
2.3E-4 1329.8536 1.8E-4 1398.14 1.61E-4 1494.3853 1.69E-4 1586.0662
1.8E-4 1634.0399 1.87E-4 1707.3593 1.31E-4 1847.2482 1.08E-4 1900.5586
7.1E-5 2458.4001 6.5E-5 2556.8076 7.6E-5)

(normalize-partial p1)
=> (45.908558 0.0375687 123.81756 0.11992453 172.09534 0.09310147
344.95218 0.053564105 399.65335 0.048068244 478.26154 0.08711345
537.47565 0.063325405 611.2551 0.036994506 660.3762 0.061110657 725.1744
0.023377901 791.167 0.052251663 882.8302 0.115741126 1023.7408
0.042818476 1087.0115 0.020014765 1141.0875 0.017225822 1211.5409
0.018866377 1329.8536 0.014764991 1398.14 0.013206464 1494.3853
0.013862686 1586.0662 0.014764991 1634.0399 0.015339185 1707.3593
0.0107456315 1847.2482 0.008858995 1900.5586 0.0058239684 2458.4001
0.005331802 2556.8076 0.0062341066)
