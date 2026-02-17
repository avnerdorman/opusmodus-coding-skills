     Opusmodus                                                                                       fftw      1

     fftw data &key window normalize coeff scale-factor phase
     [Function]

     Arguments and Values:
     data                     This is the input data for which the FFT will be calculated. It can be either
                              a list or a vector of real numbers.
     window                   This is an optional parameter, where you can specify a window function
                              that will be applied to the input data before performing the FFT.
                              If provided, this should be a function that accepts the length of the data
                              and returns a sequence of the same length.
     normalize                This is a boolean parameter. If set to true (which is the default), the output
                              of the FFT will be normalized by dividing each term by the length
                              of the input data.
     phase                    This is another boolean parameter. If set to true, the function will calculate
                              and return the phase of each output complex number. If not speci ed or
                              set to false, it will return the magnitudes of the complex numbers.
     coeff                    This boolean parameter, if set to true, will trigger the extraction
                              of the coef cients of the output complex numbers. The default is NIL.
     scale-factor             This optional parameter can be used to provide a scaling factor for the input
                              data before the transformation. The scaling factor should be a real number.
                              This can be useful to adjust the amplitude of the input signal.
                              The default is 1.0.


     Description:

     The FFTW function computes the Fast Fourier Transform (FFT) of a given sequence of real
     numbers. The FFT is a widely-used algorithm for computing the Discrete Fourier Transform,
     which decomposes a sequence of numbers into components of different frequencies.

     If a windowing function is provided via the window keyword parameter, this function is
     used to create a "window" that is applied to the input data before performing the FFT.
     Windowing can help to reduce "leakage" and "picket fence" effects (artifacts caused by the
       nite length of the input data).

     The coef cient parameter in the FFTW function serves to modify the amplitude of the output
     data. Each output value of the FFT is multiplied by this coef cient, effectively scaling the
     amplitude of the frequency components.

     The implementation of this FFT function is recursive, meaning it repeatedly breaks down the
     problem into smaller parts until it reaches a base case where the FFT can be computed
     directly. This makes it ef cient for large datasets.
fi
       fi
                       fi
                                 fi
                                                               fi
                                                                                        fi
Opusmodus                                                                                fftw   2

Note that this function requires the length of the input data to be a power of 2. If the length
of the input data is not a power of 2, it is padded with zeros up to the next power of 2. This is
because the FFT algorithm is most ef cient when the length of the input data is a power of 2.

If you only care about the magnitudes of the frequency components, you can take the
absolute value of each number in the result:

(setf data '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))

(fftw data)

                8.0

                7.0

                6.0

                5.0

                4.0

                3.0

                2.0

                1.0

                0.0
                          2         4    6      8       10     12      14     16




If you also care about the phase information, you can use the phase option to extract the
phase of each number:

(fftw data :phase t)

                4.0

                3.0

                2.0

                1.0

                0.0
                          2         4    6      8       10     12      14     16
               -1.0

               -2.0

               -3.0
                               fi
Opusmodus                                                                      fftw   3

Examples:

In this example, a Blackman-Harris window is applied to the input data:

(fftw data :window 'blackman-harris-window)

              0.70

             0.60

              0.50

             0.40

              0.30

              0.20

              0.10

              0.00
                        2        4    6      8     10     12     14       16




No normalization is performed:

(fftw data :window 'blackman-harris-window :normalize nil)

               11.
               10.
                9.
                8.
                7.
                6.
                5.
                4.
                3.
                2.
                1.
                0.
                        2        4    6      8     10     12     14       16
     Opusmodus                                                         fftw   4

     Compute FFT with Gaussian window:

     (fftw data :window 'gaussian-window)

926279000000000000000000.

926278800000000000000000.

926278600000000000000000.

926278400000000000000000.

926278200000000000000000.

926278000000000000000000.

926277800000000000000000.

926277600000000000000000.

926277400000000000000000.
                            2     4      6     8   10   12   14   16




     Compute FFT with Ultraspherical window:

     (fftw data :window 'ultraspherical-window)

                     1.20
                     1.15
                     1.10
                     1.05
                     1.00
                     0.95
                     0.90
                     0.85
                     0.80
                     0.75
                     0.70
                     0.65
                            2     4      6     8   10   12   14   16
Opusmodus                                                               fftw   5

Examples with all available window functions:

(bartlett-hann-window 16)


             0.30

              0.20

              0.10

             0.00
                        2      4      6         8   10   12   14   16
             -0.10

             -0.20

             -0.30

             -0.40




(bartlett-window 16)


                 1




                0
                        2      4      6         8   10   12   14   16



                -1




                -2




(blackman-harris-window 16)


              0.15

              0.10

              0.05

             0.00
                        2      4      6         8   10   12   14   16
             -0.05

             -0.10

             -0.15

             -0.20

             -0.25
Opusmodus                                                  fftw   6

(blackman-nuttall-window 16)


            0.25

            0.20

             0.15

             0.10

            0.05

            0.00
                     2   4     6   8   10   12   14   16
            -0.05

            -0.10

            -0.15




(blackman-window 16)


            0.25
            0.20
             0.15
             0.10
            0.05
            0.00
                     2   4     6   8   10   12   14   16
            -0.05
            -0.10
            -0.15
            -0.20




(bohman-window 16)


              1.0
              0.9
              0.8
              0.7
              0.6
              0.5
              0.4
              0.3
              0.2
              0.1
              0.0
                     2   4     6   8   10   12   14   16
Opusmodus                                                fftw   7

(cauchy-window 16)


            1.00
            0.98
            0.96
            0.94
            0.92
            0.90
            0.88
            0.86
            0.84
            0.82
            0.80
                     2   4   6   8   10   12   14   16



(connes-window 16)


             1.0
             0.9
             0.8
             0.7
             0.6
             0.5
             0.4
             0.3
             0.2
             0.1
             0.0
                     2   4   6   8   10   12   14   16




(cosine-window 16)


             1.0
             0.9
             0.8
             0.7
             0.6
             0.5
             0.4
             0.3
             0.2
             0.1
             0.0
                     2   4   6   8   10   12   14   16
      Opusmodus                                                  fftw   8

      (exponential-window 16)


                       1.0
                       0.9
                       0.8
                       0.7
                       0.6
                       0.5
                       0.4
                       0.3
                       0.2
                       0.1
                             2   4   6   8   10   12   14   16




      (flat-top-window 16)


                       3.0
                       2.5
                       2.0
                       1.5
                       1.0
                       0.5
                       0.0
                             2   4   6   8   10   12   14   16
                      -0.5
                      -1.0
                      -1.5
                      -2.0




      (gaussian-window 16)


1000000000000000000000000.
900000000000000000000000.
800000000000000000000000.
700000000000000000000000.
600000000000000000000000.
500000000000000000000000.
400000000000000000000000.
300000000000000000000000.
200000000000000000000000.
 100000000000000000000000.
                        0.
                             2   4   6   8   10   12   14   16
Opusmodus                                                  fftw   9

(hamming-window 16)


            1.1
            1.0
            0.9
            0.8
            0.7
            0.6
            0.5
            0.4
            0.3
            0.2
            0.1
            0.0
                      2    4   6   8   10   12   14   16



(hann-poisson-window 16)


            0.8

            0.7

            0.6

            0.5

            0.4

            0.3

            0.2

            0.1

            0.0
                      2    4   6   8   10   12   14   16




(hanning-window 16)


            1.0
            0.9
            0.8
            0.7
            0.6
            0.5
            0.4
            0.3
            0.2
            0.1
            0.0
                      2    4   6   8   10   12   14   16
Opusmodus                                                 fftw   10

(kaiser-window 16)


            1.000

            0.995

            0.990

            0.985

            0.980

            0.975

            0.970

            0.965
                      2   4   6   8   10   12   14   16




(nuttall-window 16)


             0.25

             0.20

             0.15

             0.10

             0.05

             0.00
                      2   4   6   8   10   12   14   16
            -0.05

            -0.10

            -0.15




(parzen-window 16)


                1




               0
                      2   4   6   8   10   12   14   16
Opusmodus                                                      fftw   11

(planck-taper-window 16)


              1




             0
                      2    4   6    8      10   12   14   16




(rectangular-window 16) ; (FFTW default)


            1.1
            1.0
            0.9
            0.8
            0.7
            0.6
            0.5
            0.4
            0.3
            0.2
            0.1
            0.0
                      2    4   6    8      10   12   14   16




(riemann-window 16)


            1.0
            0.9
            0.8
            0.7
            0.6
            0.5
            0.4
            0.3
            0.2
            0.1
            0.0
                      2    4   6    8      10   12   14   16
Opusmodus                                                fftw   12

(triangular-window 16)


               1




              0
                    2    4   6   8   10   12   14   16




(tukey-window 16)


            1.00

            0.98

            0.96

            0.94

            0.92

            0.90

            0.88

            0.86

            0.84
                    2    4   6   8   10   12   14   16




(ultraspherical-window 16)


             1.0

             0.8

             0.6

             0.4

             0.2

             0.0
                    2    4   6   8   10   12   14   16
            -0.2
Opusmodus                                               fftw   13

(welch-window 16)


             1




             0
                    2   4   6   8   10   12   14   16
