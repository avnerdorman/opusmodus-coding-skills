Opusmodus                                                                              envelope-y    1

envelope-y env
[Function]

Arguments and Values:
env                     A list representing the envelope. The list is composed of pairs of x and y
                        values, where x typically represents time and y represents amplitude.
                        For example, an envelope like (0 1 1 0) means that at time 0 the
                        amplitude is 1, and at time 1 the amplitude is 0.


Description:

The function returns a list of the y-values from the envelope. The function rst pairs up
the elements of the input envelope using the PAIR-UP function. It then loops through
these pairs, collecting the second element (the y-value) from each pair into a new list.


Examples:
(envelope-y '(0 1 2 0 4 1))
=> (1 0 1)

(setf env (envelope-concatenate
           '(0.0 0.0 1.0 1.0)
           '(1.0 1.0 4.0 0.5)
           '(40.0 0.5 47.0 0.0)
           '(7.0 0.5 10.0 0.0)
           '(0.0 0.5 13.0 0.0)))
=> (0.0 0.0 1.0 1.0 1.01 1.0 4.01 0.5 4.0200005 0.5
    11.02 0.0 11.030001 0.5 14.030001 0.0 14.040001 0.5 27.04 0.0)

(envelope-y env)
=> (0.0 1.0 1.0 0.5 0.5 0.0 0.5 0.0 0.5 0.0)
                                                                              fi
