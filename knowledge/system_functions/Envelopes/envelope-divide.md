Opusmodus                                                                        envelope-divide      1

envelope-divide &rest envelopes
[Function]

Arguments and Values:
envelopes                This is a variable number of arguments, each one being a list representing
                         an envelope. The lists are composed of pairs of x and y values, where x
                         typically represents time and y represents amplitude. For example, an
                         envelope like (0 1 1 0) means that at time 0 the amplitude is 1,
                         and at time 1 the amplitude is 0.


Description:

This function divides the amplitude of the envelope(s) by dividing the corresponding
amplitude values of one or more envelopes. This lambda function ignores the x-values
and applies division (/) to the y-values (amplitude). This operation is done across all the
envelopes passed in envelopes.


Examples:
(envelope-divide '(0 1 2 0) '(0 2 2 1))
=> (0 1/2 2 0)

(envelope-divide
 '(0.0 0.0 1.0 1.0)
 '(1.0 1.0 4.0 0.5)
 '(40.0 0.5 47.0 1.0)
 '(7.0 0.5 10.0 2.0)
 '(0.0 0.5 13.0 1.0))
=> (0.0 0.0 1.0 7.428571 4.0 12.235294 7.0 10.4
    10.0 2.2608695 13.0 2.0 40.0 2.0 47.0 1.0)
