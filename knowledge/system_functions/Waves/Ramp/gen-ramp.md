Opusmodus                                                                                    gen-ramp     1

gen-ramp start ramp-lists &key smooth
[Function]

Arguments and Values:
start                    (Number): The starting value of the rst ramp in the series.

ramp-lists               (List): A list of lists, where each sublist speci es the parameters for generating
                         a ramp. Each sublist can contain four to ve elements:
                         end value (Number): The end value of the ramp.
                         steps (Integer): The number of steps (or points) in the ramp.
                         exponent (Number): The exponent used to shape the curve. Higher values
                         create more pronounced curves.
                         type (Optional, Symbol): Speci es the type of ramp:
                         :invert: Generates an exponential inverted curve.
                         :mirror: Generates a mirrored exponential curve.
                         If omitted, a standard exponential growth curve is generated.

smooth                   (Optional, Number): A smoothing factor to be applied to the entire series of
                         generated ramps. Lower values produce smoother transitions between ramps.


Description:

The GEN-RAMP function orchestrates the generation of a series of ramps based on the
provided ramp-lists, starting from the start value. Each ramp is de ned by its end
value, number of steps, exponent, and optionally, its type (growth, inverted, or
mirrored). The function supports the optional smoothing of transitions between consecutive
ramps, enhancing the uidity of the numerical series.

Examples:

Single Ramp Examples:

(gen-ramp 0.0 '(1.0 120 1.0))
=> (0.0 0.008403362 0.016806724 0.025210087 0.033613447 0.042016808
0.050420173 0.058823534 0.067226894 0.075630255 0.084033616 0.09243698
0.100840345 0.109243706 0.11764707 0.12605043 0.13445379 0.14285715
0.15126051 0.15966387 0.16806723 0.1764706 0.18487396 0.19327732
0.20168069 0.21008405 0.21848741 0.22689078 0.23529414 0.2436975
. . . 1.0)
               fl
                                                   fi
                                                        fi
                                                             fi
                                                                  fi
                                                                            fi
Opusmodus                                                                          gen-ramp      2


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
                        20          40         60          80         100        120



Generates a linear ramp from 0.0 to 1.0 over 120 steps. Since the exponent is 1.0, the
growth is linear, not exponential.

(gen-ramp 0.0 '(1.0 120 4))


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
                        20          40         60          80         100        120



Creates an exponential growth ramp starting from 0.0 to 1.0 with 120 steps and an
exponent of 4. This steep exponent results in a curve that starts slowly and increases rapidly
towards the end.
Opusmodus                                                                          gen-ramp   3

(gen-ramp 0.0 '(1.0 120 4 :invert))


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
                        20          40         60          80         100         120



Forms an exponential inverted ramp from 0.0 down to 1.0 over 120 steps with an
exponent of 4, creating a curve that rapidly increases at rst and then levels off as it
approaches 1.0.

(gen-ramp 0.0 '(1.0 120 0.5))


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
                        20          40         60          80         100         120



Generates a concave, root-like curve from 0.0 to 1.0 over 120 steps with an exponent of
0.5, showing a rapid initial growth that increase down towards the end.
                                                    fi
Opusmodus                                                                       gen-ramp     4

(gen-ramp 0.0 '(1.0 120 0.5 :invert))


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
                           20      40         60             80    100         120



Generates a convex, root-like curve from 0.0 to 1.0 over 120 steps with an exponent of
0.5. This creates a smooth and gradual increase that steepens towards the end.

(gen-ramp 0.0 '(1.0 120 0.5 :mirror))


            0.8

            0.7

            0.6

            0.5

            0.4

            0.3

            0.2

            0.1

            0.0
                           20      40         60             80    100         120



This expression generates a series that starts at 0.0 and progresses towards 1.0 over 120
steps with an exponent of 0.5, under the :mirror type speci cation. This results in a
symmetrical curve where the rst half of the series exhibits a gradual, concave (root-like)
growth towards the midpoint, and the second half mirrors this growth in reverse.
                      fi
                                                        fi
Opusmodus                                                                        gen-ramp   5

Complex Ramp Series:

(setf ramp1 (gen-ramp 0.0 '((23 23 1.0) (8 8 1.0)
                            (79 36 1.0) (13 12 1.0)
                            (13 12 1.0))))


            80.

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                    10     20      30     40      50     60      70     80      90



This sequence constructs a series of linear ramps with varying end points but all with a
linear growth due to the exponent of 1.0. The series shifts in magnitude without altering the
linearity of progression between each set of points.

(setf ramp2 (gen-ramp 0.0 '((23 23 4) (8 8 3)
                            (79 36 8) (13 12 4)
                            (13 12 1.0))))


            80.

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                    10     20      30     40      50     60      70     80      90
Opusmodus                                                                        gen-ramp   6

A series of ramps with varying exponents, leading to different growth rates. The use of
higher exponents for certain segments results in more pronounced exponential growth
patterns within those segments.

(setf ramp3 (gen-ramp 0.0 '((23 23 4 :invert) (8 8 3 :invert)
                            (79 36 8 :invert) (13 12 4 :invert)
                            (13 12 1.0))))


            80.

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                    10      20     30      40     50      60     70        80   90



This expression generates a series of ramps with exponential inversions.

(setf ramp4 (gen-ramp 0.0 '((23 23 4) (8 8 3 :invert)
                            (79 36 8) (13 12 4 :invert)
                            (13 12 1.0))))


            80.

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                    10      20     30      40     50      60     70        80   90
Opusmodus                                                                     gen-ramp     7

A mixed series of growth and inverted ramps. Some segments grow exponentially, while
others invert, creating a dynamic series with contrasting segments.

(setf ramp5 (gen-ramp 0.0 '((23 23 4) (8 8 3 :invert)
                            (79 36 1.0 :mirror) (13 12 4)
                            (13 12 1.0))))


            80.

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                   10      20     30     40     50     60      70     80     90



Integrates growth, inverted, and mirrored exponential curves within the series. This
command produces a diverse and visually interesting sequence of ramps, with the mirrored
segment adding a unique symmetric characteristic.

(setf ramp6 (gen-ramp 0.0 '((23 23 4) (8 8 3 :invert)
                            (79 36 1.0 :mirror) (13 12 4)
                            (13 12 1.0)) :smooth 0.2))

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                   10      20     30     40     50     60      70     80     90
Opusmodus                                                                        gen-ramp    8

Creates a highly varied series of ramps with a smoothing factor of 0.2 applied across the
entire series. This smoothing blends the transitions between each ramp, regardless of whether
they are exponential growth, inverted, or extremely gentle slopes, resulting in a smooth
progression throughout the sequence.

To scale ramp6 proportionally to a span of 24 bars (* 24 4/4) with a default
resolution of 1/128 (step size), you would typically use a SCALE-RAMP function which
will adjust the sequence of values in ramp6 to t within the speci ed duration, maintaining
the relative proportions of each segment.

(list-plot (scale-ramp 24 ramp6 :span t) :join-points t)

            70.

            60.

            50.

            40.

            30.

            20.

            10.

             0.
                     500       1000     1500      2000          2500   3000   3500
                                         fi
                                                           fi
