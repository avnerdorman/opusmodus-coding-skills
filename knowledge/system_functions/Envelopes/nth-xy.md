Opusmodus                                                                                     nth-xy    1

nth-xy n env
[Function]

Arguments and Values:
n                          An integer. The index of the pair you're looking for.
env                        A at list of x-y values arranged like (x1 y1 x2 y2 x3 y3 …) The list is
                           composed of pairs of x and y values, where x typically represents time
                           and y represents amplitude. For example, an envelope like (0 1 1 0)
                           means that at time 0 the amplitude is 1, and at time 1 the amplitude is 0.


Description:

This function treats the list as pairs of x-y coordinates, and it returns the n-th pair (0-
indexed) as a list of two elements. If the n-th pair does not exist (e.g., if n is negative or if
n is greater than or equal to half the length of the list), the function signals an error.


Examples:
(nth-xy 1 '(0 1 1 1 2 2 3 4))
=> (1 1)

(nth-xy 3 '(0 1 1 1 2 2 3 4))
=> (3 4)
                      fl
