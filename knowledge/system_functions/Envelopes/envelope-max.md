Opusmodus                                                                            envelope-max     1

envelope-max &rest envelopes
[Function]

Arguments and Values:
envelopes                This is a variable number of arguments, each one being a list representing
                         an envelope. The lists are composed of pairs of x and y values, where x
                         typically represents time and y represents amplitude. For example, an
                         envelope like (0 1 1 0) means that at time 0 the amplitude is 1,
                         and at time 1 the amplitude is 0.


Description:

This function calculates the maximum amplitude value at each corresponding point in the
provided envelope(s). This is achieved by applying the max function to the y-values
(amplitude) of each envelope, ignoring the x-values (time). In other words, this function
compares the amplitude values at each corresponding point in the set of envelopes, and
returns a new envelope that has the maximum value found at each point. This can be
useful for generating composite envelopes from multiple inputs where you want the
output to re ect the highest amplitude from the input envelopes at any given time.


Examples:
(envelope-max '(0.0 0.0 1.0 1.0) '(1.0 1.0 4.0 0.5))
=> (0.0 1.0 1.0 1.0 4.0 1.0)

(envelope-max
 '(0.0 0.0 1.0 1.0)
 '(1.0 1.0 4.0 0.5)
 '(40.0 0.5 47.0 0.0)
 '(7.0 0.5 10.0 0.0)
 '(0.0 0.5 13.0 0.0))
=> (0.0 2.5 1.0 3.4615386 4.0 2.8461538 7.0 2.7307692
    10.0 2.1153846 13.0 2.0 40.0 2.0 47.0 1.5)
     fl
