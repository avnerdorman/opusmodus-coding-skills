Opusmodus                                                                            max-envelope      1

max-envelope env &optional cur-max
[Function]

Arguments and Values:
env                     An envelope, which is a list of x/y-value pairs. Each pair represents a point in
                        the envelope where x is the time and y is the amplitude.
cur-max                 An optional parameter that speci es the initial maximum value.
                        This is useful if you want to nd the maximum value between multiple
                        envelopes. It defaults to 0.0.


Description:

The MAX-ENVELOPE function calculates the maximum y-value (amplitude) in an
envelope, which is a list of x/y-values. It's an important function in envelope
processing as it allows you to identify the peak amplitude in the envelope. This function
works by looping through the y-values (amplitudes) in the envelope and keeping track of
the highest value it encounters. This value is then returned.


Examples:
(max-envelope '(7.0 0.5 10.0 0.0))
=> 0.5
                                             fi
                                                  fi
