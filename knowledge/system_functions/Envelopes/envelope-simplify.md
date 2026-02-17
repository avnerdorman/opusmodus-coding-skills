Opusmodus                                                                      envelope-simplify      1

envelope-simplify env &optional ygrid xgrid
[Function]

Arguments and Values:
env                      A list representing the envelope. The list is composed of pairs of x and y
                         values, where x typically represents time and y represents amplitude.
                         For example, an envelope like (0 1 1 0) means that at time 0 the
                         amplitude is 1, and at time 1 the amplitude is 0.
ygrid                    Optional parameter specifying the number of grid lines for the
                         y-axis (vertical). Default is 10.
xgrid                    Optional parameter specifying the number of grid lines for the
                         x-axis (horizontal). Default is 100.

Description:

The simpli cation process involves reducing the number of points in the envelope while
trying to maintain the original shape. This is done by checking if a point lies on the line
between two others and, if so, removing it.


Examples:
(envelope-simplify '(0.0 0.0 1.0 1.0 2.0 2.0 3.0 3.0 4.0 4.0 5.0 5.0))
=> (0.0 0.0 5.0 5.0)
      fi
