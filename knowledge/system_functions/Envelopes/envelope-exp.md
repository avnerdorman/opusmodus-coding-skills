Opusmodus                                                                             envelope-exp      1

envelope-exp env &optional power xgrid
[Function]

Arguments and Values:
env                       A list of alternating x and y coordinates de ning the envelope.
power                     (optional): The power to which the normalized envelope is raised. A higher
                          power makes the envelope more 'extreme' by pushing values towards the edges
                          (min and max). Default value is 1.0 which leaves the envelope unchanged.
xgrid                     (optional): De nes the granularity of the envelope. It is the number of steps in
                          the x-axis over which the exponential envelope is generated.
                          Default value is 100.


Description:

This function takes an envelope env and two optional parameters power (default 1.0) and
xgrid (default 100), and generates an exponential envelope. The function operates by rst
calculating the minimum and maximum y-values of the envelope, as well as the start and end
x-values. It then iterates from the minimum x to the maximum x in steps of size (max-x -
min-x) / xgrid, generating new y-values at each step. The y-values are created by rst
linearly interpolating the envelope at the x position, and then adjusting this value according
to the normalized and exponentiated y position within the envelope.

If the largest difference in y-values of the envelope is zero, the original y-value is collected.
Otherwise, the adjusted y-value is calculated by normalizing the y-value (subtracting the
minimum y-value and dividing by the largest y-value difference), raising it to the given
power, scaling it by the largest y-value difference, and then adding the minimum y-value
back. The function nally returns a new envelope as a list of alternating x and y coordinates.


Examples:
(envelope-exp '(7.0 0.5 10.0 1.0) 3.5 12)
=> (7.0 0.5 7.2727275 0.50011325 7.545455 0.50128145 7.8181825
    0.5052969 8.09091 0.514498 8.363637 0.5316586 8.636364 0.5599274
    8.909091 0.6027872 9.181818 0.6640252 9.454545 0.7477104 9.727272
    0.85817504 9.999999 0.9999996)
             fi
                                fi
                                                             fi
                                                                                       fi
                                                                                            fi
Opusmodus                                                     envelope-exp   2

(xy-plot (envelope-exp '(7.0 0.5 10.0 1.0) 3.5 12)
         :point-radius 2 :style :axis :join-points t)


        1.00
       0.95
       0.90
       0.85
       0.80
       0.75
       0.70
       0.65
       0.60
       0.55
       0.50
               7.2    7.6    8.0    8.4   8.8    9.2    9.6      10.0




(xy-plot (envelope-exp '(7.0 0.5 10.0 1.0) 1.5 12)
         :point-radius 2 :style :axis :join-points t)


        1.00
       0.95
       0.90
       0.85
       0.80
       0.75
       0.70
       0.65
       0.60
       0.55
       0.50
               7.2    7.6    8.0    8.4   8.8    9.2    9.6      10.0
