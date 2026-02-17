Opusmodus                                                                      envelope-concatenate   1

envelope-concatenate &rest envs
[Function]

Arguments and Values:
envs                         One or more envelopes, each represented as a list of alternating
                             x and y coordinates.


Description:

This function takes any number of envelope arguments envs and concatenates them into a
single envelope. If only one envelope is given, it returns a copy of this envelope. If more than
one envelope is given, it loops over each envelope, and for each envelope, it loops over the x
and y values. For each x and y pair, it subtracts the rst x-value of the current envelope from
x, adds an offset ‘xoff’ (initially 0) to the result, and then pushes this value and the
corresponding y-value onto a new envelope list ‘ne’. After processing each envelope, it
updates ‘xoff’ to be 0.01 plus the second element of ‘ne’ (which is the last x-value that was
added). The function nally reverses ‘ne’ and returns the result. This results in a new
envelope where the x-values of each input envelope are adjusted such that they follow on
from the end of the previous envelope, with a small gap of 0.01 added between each one.


Examples:
(envelope-concatenate
 '(0.0 0.0 1.0 1.0) '(1.0 1.0 4.0 0.5) '(40.0 0.5 47.0 0.0)
 '(7.0 0.5 10.0 0.0) '(0.0 0.5 13.0 0.0))
=> (0.0 0.0 1.0 1.0 1.01 1.0 4.01 0.5 4.0200005 0.5 11.02 0.0
    11.030001 0.5 14.030001 0.0 14.040001 0.5 27.04 0.0)


             1.0
             0.9
             0.8
             0.7
             0.6
             0.5
             0.4
             0.3
             0.2
             0.1
             0.0
                        4.          8.         12.         16.         20.        24.           28.
                   fi
                                                     fi
