Opusmodus                                                                   segment-interpolation          1

segment-interpolation time values exponent &optional n
[Function]

Arguments and Values:
time                      a list of time points.
values                    a list of values corresponding to each time point.
exponent                  an exponent to be used in interpolation, applied to each segment.
                          If the exponent is 0, the function rounds the value to the nearest integer.
                          If the exponent is cos, it applies cosine interpolation. For any other value,
                          it applies a power function with the exponent as the base.
n                         an optional parameter. If provided, it determines the number of points
                          to generate. If omitted, the number of generated points is equal to the length
                          of the time list.


Description:

This function interpolates over segments de ned by time, value, and an exponent
using either linear or cosine interpolation. It creates a segment for each time point with the
corresponding value and exponent. It then generates a sequence of points, for each of
which it determines the appropriate segment. For a point, it nds the two segments it falls
between and applies the appropriate interpolation based on the exponent of the rst segment.
If there is no subsequent segment, the function simply returns the value of the rst segment.
If the point falls exactly on the time of a segment, no interpolation is necessary and the
function directly returns the corresponding value.


Examples:
(segment-interpolation '(1 2 3 4) '(10 20 30 40) '(1 1 1 1))
=> (0 10 20 30 40)

(segment-interpolation '(0 4 7 9) '(0 10 5 8) '(0.5 0 -0.5 0.5))
=> (0.0 5.0 7.071068 8.660254 10.0)

(segment-interpolation '(0 4 7 9) '(0 10 5 8) '(0.5 0 -0.5 0.5) 3)
=> (0.0 5.0 7.071068 8.660254)
                                       fi
                                                           fi
                                                                                 fi
                                                                                      fi
Opusmodus                                                        segment-interpolation   2

In the following example, we randomly generate time, values, and exponent parameters, and
utilize them to visualize the output of the SEGMENT-INTERPOLATION function:

(setf time (rndn 24 0.0 32.0))


            32.

         28.

         24.

         20.

            16.

            12.

             8.

             4.
                       4          8          12         16         20         24




(setf values (rndn 24 0 12))


            12

            10

             8

             6

             4

             2

             0
                       4          8          12         16         20         24
Opusmodus                                           segment-interpolation   3

(setf exponent (rndn 24 0.0 1.0))


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
                  4        8        12         16     20         24



The result:

(segment-interpolation time values exponent)


        16.

        14.

        12.

        10.

         8.

         6.

         4.

         2.

         0.
                  4        8        12         16     20         24
