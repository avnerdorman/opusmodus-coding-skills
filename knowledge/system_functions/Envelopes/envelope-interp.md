Opusmodus                                                                                envelope-interp    1

envelope-interp x fn &optional base
[Function]

Arguments and Values:
x                         The position at which to interpolate the envelope.
fn                        A list of alternating x and y coordinates de ning the envelope.
base                      (optional): The base for interpolation. A base of 1 gives linear interpolation,
                          while a base of 0 holds the value at the start of each envelope segment until
                          the next one begins. Other values give an exponential curve.
                          Default value is 1.


Description:

This function performs linear interpolation on an envelope, which is typically represented
as a list of pairs (breakpoints) where each pair consists of an x value (time) and a y value
(amplitude). Given an x value, it returns the interpolated y value at that point in the
envelope. If the x value falls exactly on a breakpoint in the envelope, it returns the
corresponding y value. If the x value falls between two breakpoints, it calculates the y value
by linear interpolation.

If the envelope is NIL, it returns 0.0. If x is less than or equal to the rst x-coordinate of the
envelope, or if the envelope has less than four elements, it returns the rst y-coordinate
of the envelope. If x is less than the third element of the envelope (the x-coordinate of
the second point), it interpolates between the rst and second points of the envelope.

If base is 1 (default), it does a linear interpolation. If base is 0, it holds the value at the
start of the envelope segment until the next one begins (no interpolation). If base is not 1 or
0, it does an exponential interpolation. If x is greater than or equal to the third element of the
envelope, the function calls itself recursively with x and the rest of the envelope after the rst
point, using the same base.

Please note that the function expects the envelope to be sorted in increasing x-values, and
it might not work as expected if this condition is not met. Additionally, the function expects
the envelope to contain at least two points (four elements); behaviour is unde ned if fewer
elements are provided.
                                          fi
                                                               fi
                                                                        fi
                                                                               fi
                                                                                    fi
                                                                                                 fi
Opusmodus                                   envelope-interp   2

Examples:
(envelope-interp 2.5 '(0 0 2 2 4 0))
=> 1.5

(envelope-interp 2.5 '(0 0 2 2 4 0) 2)
=> 1.6215859

(envelope-interp 2.5 '(7.0 0.5 10.0 1.0))
=> 0.5
