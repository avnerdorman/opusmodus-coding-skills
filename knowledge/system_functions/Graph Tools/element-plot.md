Opusmodus                                                                  element-plot    1

element-plot sequence &key type point-radius point-style join-points
                       line-width style file new-index

[Function]

Arguments and Values:
sequence                 omn-form sequence or sequences.
type                     :length, :pitch, :interval and :velocity.
point-radius             an integer (radius size). The default is 1.
point-style              :square, :circle, :hollow or :triangle. The default is :circle.
join-points              NIL or T. The default is NIL.
line-width               an integer. The default is 1.
style                    :axis (draw line to axis) or :fill ( ll from axis).
file                      le name.
if-exists                :supersede, :error or :new-index
new-index                NIL or T. The default is NIL.


Description:

Generate a graph that shows the count of the element type values given in omn-form
sequence.

The points are drawn as circles. :point-radius lets you control the size of the circles. If
0, the points will not be drawn. If :join-points is T, the points (whether visible or not)
will be connected with line segments. The :style keyword argument may be either :axis
or :fill.


Examples:
(setf vn1
      '((-h reh+rehn-26 e b4-e4+ ppp ten+norm+arco - -q)
        (-q -e cs6+e6+ ten e6+b6- leg fs4+e5+ cs4 stacc+ten -)
        (-q z^q c5+e5+ s c4 ten -e. q fs5e6 ten+leg e e6+d7+ ten -)
        (-h e fs5+e6+ ten+stacc cs5+e5+cs6 ten+stacc cs5+ ten+stacc -)
        (-q -e c5c6-e6- ten fs6+e7+ leg e6bb6 leg cs5+ > leg c6e6 >
          e4+b4- > ten+stacc -)
        (e d5-e5+ pppp marc d5-e5+ marc -q bl-ll)
        (-e reh cs5+d5 sff mart+arco mf mart cs5+d5 mart -q)
        (-q -5q 5w cs6+e6+ mf<fff ponte+comma q ppp norm+fermata-vl
           5q mf> mart > dbow p mart -5h fermata-vl)))
                  fi
                                                   fi
Opusmodus                                                                                         element-plot        2




                                                                                  8
      26      arco
             norm.           2                                   3                      4




                         8
  5                                                                               6




  27


                                                             norm.
                                        sul pont.

  8


                                    5                                                         5


                                                                                                          Opusmodus




(element-plot vn1 :type :length)


      2020

      1818

      1616

      1414

      1212

      1010

       88

       66

       44

       22

       00
                -0.4
                  -0.4           -0.3
                                   -0.3             -0.2
                                                      -0.2       -0.1
                                                                   -0.1   0.0
                                                                            0.0       0.1
                                                                                        0.1       0.2
                                                                                                    0.2       0.3
                                                                                                                0.3
Opusmodus                                                     element-plot   3

(element-plot vn1 :type :pitch)


    99


    88


    77


    66


    55


    44


    33


    22


    11
             55     10
                     10     15
                             15     20
                                     20     25
                                             25   30
                                                   30   35
                                                         35   40
                                                               40      45
                                                                        45




(element-plot vn1 :type :interval)


   1111

   1010

    99

    88

    77

    66

    55

    44

    33

    22

    11
            -25
              -25   -20
                      -20   -15
                              -15   -10
                                      -10   -5
                                             -5   00    55    10
                                                               10      15
                                                                        15
Opusmodus                                                                                 element-plot     4

(element-plot vn1 :type :velocity)


    1616


    1414


    1212


    1010


     88


     66


     44


     22


     00
                0.20
                  0.20        0.30
                                0.30           0.40
                                                 0.40           0.50
                                                                  0.50       0.60
                                                                               0.60     0.70
                                                                                          0.70    0.80
                                                                                                    0.80




Loading score for analysis:

(load "~/Opusmodus/Scores/bach-gv-18.opmo")

(setf gv18-1 (collect-score-instruments '+imported 1))
(setf gv18-2 (collect-score-instruments '+imported 2))
(setf gv18-3 (collect-score-instruments '+imported 3))

(element-plot gv18-1 :type :length)


    7070


    6060


    5050


    4040


    3030


    2020


    1010


     00
               -0.4
                 -0.4    -0.2
                           -0.2        0.0
                                         0.0            0.2
                                                          0.2        0.4
                                                                       0.4      0.6
                                                                                  0.6     0.8
                                                                                            0.8    1.0
                                                                                                     1.0
Opusmodus                                                            element-plot   5




(element-plot gv18-1 :type :pitch)


   2828


   2424


   2020


   1616


   1212


    88


    44


    00
                  14
                   14         16
                               16        18
                                          18        20
                                                     20        22
                                                                22            24
                                                                               24




(element-plot gv18-1 :type :interval)


   4040


   3535


   3030


   2525


   2020


   1515


   1010


    55


    00
            -6
             -6         -4
                         -4   -2
                               -2   00         22   44    66          88      10
                                                                               10
Opusmodus                                                                                       element-plot       6

(element-plot gv18-1 :type :velocity)


  160160


  140140


  120120


  100100


   8080


   6060


   4040


   2020


    00
            0.05
              0.05   0.10
                       0.10     0.15
                                  0.15   0.20
                                           0.20   0.25
                                                    0.25   0.30
                                                             0.30   0.35
                                                                      0.35   0.40
                                                                               0.40    0.45
                                                                                         0.45    0.50
                                                                                                   0.50   0.55
                                                                                                            0.55




(setf voices (list gv18-1 gv18-2 gv18-3))

(element-plot voices :type :length :join-points t)


  180180

  160160

  140140

  120120

  100100

   8080

   6060

   4040

   2020

    00
               -0.4
                 -0.4         -0.2
                                -0.2      0.0
                                            0.0       0.2
                                                        0.2         0.4
                                                                      0.4      0.6
                                                                                 0.6        0.8
                                                                                              0.8         1.0
                                                                                                            1.0
Opusmodus                                                                           element-plot   7




(element-plot voices :type :pitch :join-points t)


   3232


   2828


   2424


   2020


   1616


   1212


    88


    44


    00
            -25
              -25   -20
                      -20   -15
                              -15     -10
                                        -10   -5
                                               -5        00   55        10
                                                                         10   15
                                                                               15     20
                                                                                       20    25
                                                                                              25




(element-plot voices :type :interval :join-points t)


   8080


   7070


   6060


   5050


   4040


   3030


   2020


   1010


    00
                    -8
                     -8             -4
                                     -4             00             44          88            12
                                                                                              12
Opusmodus                                                                                    element-plot       8




(element-plot voices :type :velocity :join-points t)


  320320

  300300

  280280

  260260

  240240

  220220

  200200

  180180

  160160

  140140
            0.05
              0.05   0.10
                       0.10   0.15
                                0.15   0.20
                                         0.20   0.25
                                                  0.25   0.30
                                                           0.30   0.35
                                                                    0.35   0.40
                                                                             0.40   0.45
                                                                                      0.45    0.50
                                                                                                0.50   0.55
                                                                                                         0.55
