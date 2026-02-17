Opusmodus                                                                             min-envelope      1

min-envelope env &optional cur-min
[Function]

Arguments and Values:
env                      An envelope, which is a list of x/y-value pairs. Each pair represents a point in
                         the envelope where x is the time and y is the amplitude.
cur-min                  An optional parameter that speci es the initial minimum value.
                         This is useful if you want to nd the minimum value between multiple
                         envelopes. It defaults to 0.0.


Description:

The MIN-ENVELOPE function calculates the minimum y-value (amplitude) in an
envelope, which is a list of x/y-values. It's an important function in envelope
processing as it allows you to identify the lowest amplitude in the envelope. This function
works by looping through the y-values (amplitudes) in the envelope and keeping track of
the lowest value it encounters. This value is then returned.


Examples:
(min-envelope '(7.0 0.5 10.0 0.0))
=> 0.0
                                              fi
                                                   fi
