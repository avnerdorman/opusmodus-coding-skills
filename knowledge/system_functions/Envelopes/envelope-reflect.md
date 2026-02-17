Opusmodus                                                                        envelope-reflect     1

envelope-reflect env
[Function]

Arguments and Values:
env                      A list representing the envelope. The list is composed of pairs of x and y
                         values, where x typically represents time and y represents amplitude.
                         For example, an envelope like (0 1 1 0) means that at time 0 the
                         amplitude is 1, and at time 1 the amplitude is 0.


Description:

This function re ects an envelope about the x-value that corresponds to its maximum. It's
particularly useful in digital signal processing, music synthesis, and other similar
applications where the manipulation of an envelope's temporal structure is required. The
function returns a new envelope with x-values mirrored around the maximum x-value of the
original envelope, keeping the original y-values (amplitudes) corresponding to the re ected
x-values.


Examples:
(setf env '(1 10 2 20 3 30))


                  30
                  28
                  26
                  24
                  22
                  20
                  18
                  16
                  14
                  12
                  10
                                                  2                                         3
             fl
                                                                                       fl
Opusmodus                                      envelope-reflect   2

(envelope-reflect '(1 10 2 20 3 30))
=> (1 10 2 20 3 30 4 20 5 10)


            30
            28
            26
            24
            22
            20
            18
            16
            14
            12
            10
                       2               3   4           5
