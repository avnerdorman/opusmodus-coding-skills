Opusmodus                                                                          envelope-length     1

envelope-length env
[Function]

Arguments and Values:
env                       A list representing the envelope. The list is composed of pairs of x and y
                          values, where x typically represents time and y represents amplitude.
                          For example, an envelope like (0 1 1 0) means that at time 0 the
                          amplitude is 1, and at time 1 the amplitude is 0.


Description:

The ENVELOPE-LENGTH function calculates the length of the envelope. It does this by
taking the total number of elements in the envelope list (obtained using the length
function) and dividing by 2.

This division by 2 is necessary because each point on the envelope is represented by a
pair of values: an x-value (usually representing time) and a y-value (representing the
amplitude at that time). Therefore, the actual number of points in the envelope is half the
total number of elements in the list.

For example, if you have an envelope represented as (0.0 1.0 1.0 0.0), which
represents a sound that starts at full amplitude and then drops to silence, the length function
would return 4, but the ENVELOPE-LENGTH function would correctly return 2, since there
are two points (0.0 1.0) and (1.0 0.0) in the envelope.


Examples:
(envelope-length '(0.0 1.0 1.0 0.0))
=> 2

(envelope-length '(0.0 0.0 13.0 0.5 13.01 0.0 16.01 0.5 16.02 0.0
                   23.02 0.5 23.03 0.5 26.03 1.0 26.04 1.0 27.04 0.0))
=> 10
