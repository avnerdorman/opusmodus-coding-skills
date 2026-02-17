Opusmodus                                                                                   xy-plot       1

xy-plot envelope &key point-radius point-style join-points
             line-width style file new-index

[Function]

Arguments and Values:
envelope                  The list is composed of pairs of x and y values, where x typically represents
                          time and y represents amplitude.
                          For example, an envelope like (0 1 1 0) means that at time 0 the
                          amplitude is 1, and at time 1 the amplitude is 0.
point-radius              an integer (radius size). The default is 1.
point-style               :square, :circle, :hollow or :triangle. The default is :circle.
join-points               NIL or T. The default is NIL.
line-width                an integer. The default is 1.
style                     :axis (draw line to axis) or :fill ( ll from axis).
file                        le name.
if-exists                 :supersede, :error or :new-index
new-index                 NIL or T. The default is NIL.


Description:

The XY-GRAPH function is designed to generate a graph illustrating the relationship between
two sets of data, speci cally x and y coordinates. These coordinates, ideally representing
time (x) and amplitude (y), are to be provided in an input list comprised of (x, y) pairs.
Encapsulated in this format, the function effectively illustrates the data's trajectory over time,
providing valuable insights into its pattern and behaviour.

The points are drawn as circles. :point-radius lets you control the size of the circles. If
0, the points will not be drawn. If :join-points is T, the points (whether visible or not)
will be connected with line segments. The :style keyword argument may be either :axis
or :fill.
                fi
                     fi
                                                         fi
Opusmodus                                                                            xy-plot   2

Examples:
(setf val (make-xy (primes-to 20) (fibonacci 0 7)))

(xy-plot val :join-points t :point-radius 2
             :style :axis :point-style :square)


            14

            12

            10

            8

            6

            4

            2

            0
                 4     6         8         10         12         14     16    18   20




(setf env (envelope-exp '(7.0 0.5 10.0 1.0) 3.5 12))

(xy-plot env :join-points t :point-radius 2
             :style :axis :point-style :square)


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
                 7.2       7.6       8.0        8.4        8.8        9.2    9.6   10.0
Opusmodus                                                                                         xy-plot   3

(setf sin (make-xy (loop for x from 0 to 15 by .1 collect (sin x))
                   (loop for x from 0 to 15 by .2 collect (sin x))))

(xy-plot sin :join-points t :point-radius 0)


            1.0
        0.8
        0.6
        0.4
         0.2
        0.0
                  -0.8     -0.6          -0.4     -0.2   0.0   0.2    0.4         0.6     0.8   1.0
        -0.2
        -0.4
        -0.6
        -0.8
        -1.0




(xy-plot (list '(0.0 1.0 0.75 1.0 1.5 1.5 2.25 2.5 3.0 4.0)
               '(0.0 1.0 0.8 1.145 1.6 1.521 2.4 2.03 3.2 4.5))
         :join-points t :point-radius 4
         :point-style '(:square :triangle))

(xy-plot (flatten (archimedes-spiral 10 10 0.01 1500)))


        160.

        120.

        80.

        40.

             0.
                   -120.          -80.          -40.     0.     40.         80.         120.    160.
        -40.

        -80.

       -120.

       -160.
Opusmodus                                                            xy-plot   4

(xy-plot (flatten (archimedes-spiral 10 10 0.01 128)))


         22.
         20.
            18.
            16.
            14.
            12.
            10.
             8.
             6.
            4.
             2.
             0.
                  7.0    8.0    9.0    10.0   11.0   12.0   13.0   14.0




(xy-plot
 (gen-loop 4 (envelope-samples
              (list (rndn 24 0.0 0.2)
                    (rndn 24 -1.4 1.0)) 24))
 :point-radius 3 :point-style :hollow)


        0.8
        0.6
        0.4
         0.2
        0.0
                  0.06   0.08   0.10   0.12   0.14   0.16   0.18   0.20
        -0.2
        -0.4
        -0.6
        -0.8
        -1.0
        -1.2
