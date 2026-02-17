Opusmodus                                                                                               gen-fourier   1

gen-fourier number freq amp count &key coeff
[Function]

Arguments and Values:
number                              (integer): The number of terms in the Fourier series.
freq                                ( oat): The fundamental frequency of the Fourier series.
amp                                 ( oat): The amplitude used for the sine and cosine terms in the series.
count                               (integer): The number of points to calculate in the range from 0 to 2π.
coeff                               (optional): A list of pairs (lists), where each pair represents the coef cients
                                    (a_n, b_n) for the nth term. If not provided, the function uses (amp, amp)
                                    for all pairs. The default is NIL.


Description:

Generates a list of classical Fourier series values. This function calculates the Fourier series
over a speci ed range and number of points, using a given number of terms, frequency,
amplitude, and optional coef cients for sine and cosine components.


Examples:

Using default coef cients:
(gen-fourier 5 1.0 0.5 1000)


     4.0


     3.0


     2.0


     1.0


     0.0
                  100             200    300       400       500      600       700       800           900   1000

    -1.0


    -2.0


    -3.0
      fi
             fi
                        fl
                        fl
                             fi
                                                                                                   fi
Opusmodus                                                        gen-fourier   2

Using custom coef cients:

(defparameter *coefficients* '((0.5 0.4) (0.3 0.2) (0.1 0.1)
                               (0.05 0.05) (0.02 0.02)))

(gen-fourier 5 1.0 0.5 1000 :coeff *coefficients*)


    1.2

    1.0

    0.8

    0.6

    0.4

    0.2

    0.0
                 100   200   300   400   500   600   700   800   900   1000
   -0.2

   -0.4

   -0.6
            fi
