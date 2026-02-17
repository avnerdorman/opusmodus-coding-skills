Opusmodus                                                                                    x-norm   1

x-norm env xmax
[Function]

Arguments and Values:
env                      This is a variable number of arguments, each one being a list representing
                         an envelope. The lists are composed of pairs of x and y values, where x
                         typically represents time and y represents amplitude. For example, an
                         envelope like (0 1 1 0) means that at time 0 the amplitude is 1,
                         and at time 1 the amplitude is 0.
xmax                     The new maximum value for the x-values in the envelope.


Description:

The X-NORM function is used to normalize the x-axis values of an envelope so that they
span up to a maximum value xmax. The function works by rst calculating a scale factor,
which is the ratio of xmax to the last x-value in the envelope. Then, it loops through the
x/y-values in the envelope, multiplying each x-value by this scale factor to get the new
normalized x-value. The result is a new envelope with normalized x-values and the
original y-values.


Examples:
(x-norm '(0 1 1 1 2 2 3 4) 5)
=> (0 1 5/3 1 10/3 2 5 4)
                                                         fi
