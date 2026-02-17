Opusmodus                                                                                   scale-ramp—1

scale-ramp (number ramp &key time span)
[Function]

Arguments and Values:
number                   (type: integer): Represents either the desired number of points in the scaled
                         ramp or, if span is speci ed, the physical span to which the ramp will be
                         scaled.

ramp                     (type: list): The original ramp (wave) to be scaled, represented as a list of
                         numerical values.

time                     (type: number, optional, default = 1/128): The time used to determine
                         the number of points when span is true. It de nes the size of each unit
                         of span.

span                     (type: boolean, optional): A ag indicating whether number refers to
                         a physical span rather than the direct number of points. If true, the actual
                         number of points is calculated based on the span and time.


Description:

The SCALE-RAMP scales a ramp shape (a list of numerical values) proportionally. The
function is designed to adjust the size of a ramp based on speci ed parameters, ensuring that
the shape of the ramp remains consistent whether it is expanded or compressed. The
function operates by rst determining the target number of points for the scaled ramp. This
is directly set by number unless span is true, in which case it is calculated based on the
number and time. The function then computes a scale factor and constructs a new ramp
by linearly interpolating between points in the original ramp according to this scale factor.

Note: The function assumes that ramp consists of numerical values. The number should be
a positive integer, and time should be a positive non-zero number. Ensure that the input data
is validated before calling SCALE-RAMP.


Examples:
(scale-ramp 12 '(1 5 1))
=> (1.0 1.7272728 2.4545455 3.1818183 3.909091 4.636364
    4.6363635 3.909091 3.181818 2.4545455 1.7272725 1.0)

(scale-ramp 12 '(1 5 1) :span t)
=> (1.0 1.0052117 1.0104234 1.0156351 1.020847 1.0260587 . . .)
              fi
                                           fi
                                                fl
                                                               fi
                                                                fi
Opusmodus                                                              scale-ramp—2

(setf wave (mod-sine-waves
            50 120 4 0.1
            :modulation (gen-sine 120 1 0.4)
            :variant 2))

(list-plot wave :join-points t)


        0.40

        0.35

        0.30

        0.25

        0.20

        0.15

        0.10

        0.05

        0.00
                  20           40          60          80      100    120




(list-plot (scale-ramp 24 wave :span t) :join-points t)


        0.40

        0.35

        0.30

        0.25

        0.20

        0.15

        0.10

        0.05

        0.00
                 500    1000        1500        2000    2500   3000   3500
Opusmodus                                              scale-ramp—3

(list-plot (scale-ramp 24 wave) :join-points t)


        0.40

        0.35

        0.30

        0.25

        0.20

        0.15

        0.10

        0.05

        0.00
                   4       8        12       16   20   24
