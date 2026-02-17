Opusmodus                                                                        stretch-envelope       1

stretch-envelope env old-att new-att &optional old-dec new-dec
[Function]

Arguments and Values:
env                      An envelope, which is a list of x/y-value pairs. Each pair represents a point in
                         the envelope where x is the time and y is the amplitude.
old-att                  The old attack time of the envelope.
new-att                  The new attack time for the envelope.
old-dec                  Optional parameter, the old decay time of the envelope.
new-dec                  Optional parameter, the new decay time for the envelope.


Description:

The STRETCH-ENVELOPE function is used to stretch the amplitude (y-values) of an
envelope. The function works by rst checking whether both old and new decay times are
provided. If not, it sets the new decay time to be equal to the old decay time. Then it loops
through the x/y-values in the envelope. During the loop, it calculates new x-values
(times) for the envelope according to the given old and new attack and decay times, and
constructs a new envelope with these adjusted times while maintaining the original y-
values (amplitudes).


Examples:

In this example, the function will return a new envelope where the attack time has
been adjusted from 1.0 to 2.0, effectively 'stretching' the envelope in time.
(stretch-envelope '(0 1 1 1 2 2 3 4) 1.0 2.0)
=> (0 1 2.0 1 2.5 2 3.0 4)
                              fi
