Opusmodus                                                                    normalize-envelope       1

normalize-envelope env &optional new-max
[Function]

Arguments and Values:
env                      This is a variable number of arguments, each one being a list representing
                         an envelope. The lists are composed of pairs of x and y values, where x
                         typically represents time and y represents amplitude. For example, an
                         envelope like (0 1 1 0) means that at time 0 the amplitude is 1,
                         and at time 1 the amplitude is 0.
new-max                  Optional parameter specifying the new maximum value for the envelope.
                         Defaults to 1.0 if not provided.


Description:

This function operates by rst determining the current maximum value in envelope using
the MAX-ENVELOPE function. It then calculates a scaling factor by dividing new-max by
this current maximum. This scaling factor is used to multiply every y-value (amplitude) in
envelope using the SCALE-ENVELOPE function, effectively scaling the entire
envelope.

For example, if you have an envelope (0.0 2.0 1.0 4.0), which represents a sound
that starts at twice the maximum amplitude and ends at four times the maximum amplitude,
and you want to normalize it so that the maximum value is 1.0, you could call
(normalize-envelope '(0.0 2.0 1.0 4.0)). This would result in (0.0 0.5
1.0 1.0), a sound that now starts at half the maximum amplitude and ends at the
maximum amplitude.


Examples:
(normalize-envelope '(0.0 2.0 1.0 4.0))
=> (0.0 0.5 1.0 1.0)
                   fi
