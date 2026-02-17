          Opusmodus                                                                                      ffth   1

          ffth num-of-harmonics step-resolution points &key type
                    quantize coeff crf ambitus

          [Function]

          Arguments and Values:
          num-of-harmonics            The number of harmonics to compute in the FFT.
          step-resolution             The step size between points in the FFT.
          points                      A list of input data points for the FFT.
          type                        (optional, default NIL): The type of data in the points list.
                                      If not provided, the function will return
                                      the raw FFT data. Types: 'integer, 'pitch of NIL.
          quantize                    (optional, default 1/2): When type is 'pitch, this parameter speci es
                                      the quantization step size.
          coeff                       (optional, default 1.0): Coef cient to scale the FFT result.
          crf                         An integer. Speci es the maximum allowable consecutive
                                      repetitions for any given value in the sequence. The default is NIL.
          ambitus                     (optional, default *default-ambitus-limit*): When type
                                      is 'pitch, this parameter speci es the ambitus or range of the pitches.


          Description:

          The function FFTH calculates the Fast Fourier Transform (FFT) of a given list of points. The
          FFT is a mathematical algorithm that transforms a function of time (a signal) into a function
          of frequency. In the context of digital signal processing, the FFT algorithm is used to identify
          the frequencies present in a discrete signal.

          The computation involves the following steps:
          Initialization: Arrays for amplitude, phase, harmonics-matrix, and fftx are initialized.

          Coef cient calculation: The function then calculates coef cients for the FFT, looping over
          the input data points. This is done using a complex number, where amplitude corresponds to
          the real part and phase to the imaginary part.

          FFT curve computation: After the coef cients have been calculated, the function uses them
          to calculate the FFT curve by looping over a set of x-values and summing up the
          contributions from each coef cient.

          Transformation of the results based on the type of output speci ed: If type is 'integer,
          the function rounds the FFT output to the nearest integer. If it's 'pitch, it converts the FFT
          output to pitches, quantizes them, and limits them to the speci ed ambitus. If no type is
          speci ed, the raw data points of the FFT curve are returned.
fi
     fi
                                 fi
                                             fi
                                                  fi
                                                          fi
                                                               fi
                                                                    fi
                                                                         fi
                                                                              fi
                                                                                            fi
Opusmodus                                                                                                                                ffth   2




Examples:
(ffth 8 0.05 '(44 52 22 68 6 22 9 73 28 68))

             80.

             60.

             40.

              20.

               0.
                             20         40             60                  80    100           120                     140
             -20.

             -40.

             -60.




(ffth 8 0.05 '(44 52 22 68 6 22 9 73 28 68)
      :type 'pitch :ambitus '(c3 c5))


                              2                    3                  4               5                  6




        7           8                          9             10                 11                  12




        13               14                   15                          16              17                      18




        19              20               21                       22                 23                      24




        25                    26                            27                                 28




        29
                                   30                            31                                  32




                                                                                                                             Opusmodus
Opusmodus                                                                                                                                                                          ffth   3




(ffth 3 0.05 '(44 52 22 68 6 22 9 73 28 68)
      :type 'pitch :coeff 1.0 :ambitus '(c3 c5))

                              2                         3                                 4                                          5                        6




        7           8                               9                            10                     11                               12                       13




        14     15                          16                     17                               18                               19              20




        21                    22                                 23                           24                               25                        26




        27
                        28                                   29                                    30                                     31                  32




                                                                                                                                                                       Opusmodus




(ffth 8 0.05 '(44 52 22 68 6 22 9 73 28 68)
      :type 'pitch :ambitus '(c3 c5) :quantize 1/4)

                                                2                                     3                                4                            5




        6                              7                                    8                                              9                        10




        11              12                                   13                                    14                               15                  16




        17                   18                             19                                20                               21                             22




        23                        24                                        25                               26                                27




        28                        29                                   30                                         31                                     32



                                                                                                                                                                       Opusmodus
Opusmodus                                                                                                                                    ffth   4




(ffth 12 0.05 '(1 6 33 2 4 1))


                 140.
                 120.
                 100.
                 80.
                 60.
                 40.
                  20.
                     0.
                                      20            40               60   80   100                   120           140
                 -20.
                 -40.




(quantize
 (scale-round 0.1 2.0 (ffth 12 0.05 '(1 6 33 2 4 1)))
'(1 2 3 4 5 8))

                 5                         3                 2   5         3                 3                                   5




        4    5                    3    5        5            5                                   6         5                 3




        7            3                              5            8    5




        9                 5                             10                5         11   3                     5




        12   3                                 13                              14




        15                    5                         16                               17                              3




                                                                                                                                 Opusmodus
