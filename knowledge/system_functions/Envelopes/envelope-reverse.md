Opusmodus                                                                         envelope-reverse     1

envelope-reverse env
[Function]

Arguments and Values:
env                       A list representing the envelope. The list is composed of pairs of x and y
                          values, where x typically represents time and y represents amplitude.
                          For example, an envelope like (0 1 1 0) means that at time 0 the
                          amplitude is 1, and at time 1 the amplitude is 0.


Description:

This function reverses an envelope's direction in the time domain. It's particularly useful in
digital signal processing, music synthesis, and other applications where manipulating the
temporal structure of an envelope is needed.

If the envelope is of length 0 or 2 (representing a single point or empty), the function simply
returns the envelope itself. For longer envelopes, the function calculates the maximum x-
value xmax (which will be the last x-value in the list), then subtracts each x-value in the
envelope from xmax, effectively reversing their order.


Examples:
(envelope-reverse '(0 1 2 0 4 1))
=> (4 1 2 0 0 1)

(setf env (envelope-concatenate
           '(0.0 0.0 1.0 1.0)
           '(1.0 1.0 4.0 0.5)
           '(40.0 0.5 47.0 0.0)
           '(7.0 0.5 10.0 0.0)
           '(0.0 0.5 13.0 0.0)))
=> (0.0 0.0 1.0 1.0 1.01 1.0 4.01 0.5 4.0200005 0.5
    11.02 0.0 11.030001 0.5 14.030001 0.0 14.040001 0.5 27.04 0.0)

(envelope-reverse env)
=> (0.0 0.0 13.0 0.5 13.01 0.0 16.01 0.5 16.02 0.0
    23.02 0.5 23.03 0.5 26.03 1.0 26.04 1.0 27.04 0.0)
