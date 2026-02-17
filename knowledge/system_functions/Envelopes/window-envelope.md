Opusmodus                                                                         window-envelope      1

window-envelope beg end env
[Function]

Arguments and Values:
beg                       The beginning of the range, in terms of the x-values in the envelope,
                          from which the portion should be extracted.
end                       The end of the range, in terms of the x-values in the envelope, till where
                          the portion should be extracted.
env                       This is a variable number of arguments, each one being a list representing
                          an envelope. The lists are composed of pairs of x and y values, where x
                          typically represents time and y represents amplitude. For example, an
                          envelope like (0 1 1 0) means that at time 0 the amplitude is 1,
                          and at time 1 the amplitude is 0.


Description:

The WINDOW-ENVELOPE function is used to extract a speci c portion or window from an
envelope that falls within a given beginning and ending range. The function works
by iterating through the x/y-values in the envelope. When it nds a x-value that is equal
to or greater than beg, it starts recording the x/y-values into a new list. If beg falls between
two points, it also interpolates the y-value at beg. It continues recording until it nds a x-
value that is equal to or greater than end, at which point it stops recording and returns the
new list.


Examples:
(window-envelope 1 3 '(0 1 1 1 2 2 3 4))
=> (1 1 2 2 3 4)
                                                           fi
                                                                fi
                                                                                   fi
