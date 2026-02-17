     Opusmodus                                                                         envelope-samples       1

     envelope-samples env samples &optional pair
     [Function]

     Arguments and Values:
     env                       An envelope of x/y-values, either in the form of a list of xy-value pairs or
                               a list containing a list of x-values and a list of y-values.
     samples                   The number of samples to take from the envelope.
     pair                      Optional argument to specify the output format. Default T for one list
                               (x/y-values) and NIL for two lists (x-values and y-values).


     Description:

     The ENVELOPE-SAMPLES function resamples an envelope of x/y-values by taking any
     given number of samples. The envelope can be input in one of two formats: a list of xy-
     value pairs or a list that contains a list of x-values and a list of y-values. The function works
     by rst splitting the x/y-values into separate lists if they aren't already. It then resamples the
     x-values to create a speci ed number of equidistant x-values within the same range as the
     original list. Using these new x-values, it maps them to the corresponding y-values.


     Examples:
     (envelope-samples '(0 1 1 1 2 2 3 4) 5)
     => (0.0 1.0 0.75 2.5 1.5 2.5 2.25 2.5 3.0 4.0)

     (envelope-samples '((0 1 2 3) (1 3 2 4)) 5 nil)
     => ((0.0 0.75 1.5 2.25 3.0) (1.0 2.5 2.5 2.5 4.0))

     (envelope-samples '(0 1 1 3 2 2 3 4) 5 nil)
     => ((0.0 0.75 1.5 2.25 3.0) (1.0 2.5 2.5 2.5 4.0))

     (envelope-samples '((0 1 2 3) (1 3 2 4)) 5)
     => (0.0 1.0 0.75 2.5 1.5 2.5 2.25 2.5 3.0 4.0)
fi
                        fi
