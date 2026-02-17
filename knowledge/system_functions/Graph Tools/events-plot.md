Opusmodus                                                                        events-plot   1

events-plot sequence &key length pitch velocity point-radius
                        join-points line-width style file new-index

[Function]

Arguments and Values:
sequence                   omn-form sequence.
length                     an integer. The default scale is 10.
pitch                      an integer. The default scale is 1.
velocity                   an integer. The default scale is 100.
point-radius               an integer (radius size). The default is 1.
join-points                NIL or T. The default is T.
line-width                 an integer. The default is 1.
style                      :axis (draw line to axis) or :fill ( ll from axis).
file                        le name.
if-exists                  :supersede, :error or :new-index
new-index                  NIL or T. The default is NIL.


Description:

Generate a graph that shows the relationship between two sets of data of three elements:
length, pitch and velocity given in omn-form sequence.

The points are drawn as squares (length), circles (pitch) and dots
(velocity). :point-radius lets you control the size of the points. If 0, the points will
not be drawn. If :join-points is T, the points (whether visible or not) will be connected
with line segments. The :style keyword argument may be either :axis or :fill.

Green        =     length (square)
Blue         =     pitch (circle)
Red          =     velocity (dot)
                   fi
                                                         fi
Opusmodus                                                     events-plot       2

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



                                                                8
      26     arco
            norm.         2                           3




                                                  8
  4                                   5




                                          27
  6




                                          norm.
                          sul pont.


  8


                      5                                   5

                                                                    Opusmodus
Opusmodus                                                    events-plot     3

(events-plot vn1)


   8080



   7070



   6060



   5050



   4040



   3030



   2020



   1010



    00
            1.0
              1.0   2.0
                      2.0   3.0
                              3.0   4.0
                                      4.0   5.0
                                              5.0   6.0
                                                      6.0   7.0
                                                              7.0    8.0
                                                                       8.0


  -10-10
Opusmodus                                                       events-plot     4

Scaling elements:

(events-plot vn1 :length 50 :velocity 50)


   5050




   4040




   3030




   2020




   1010




    00
               1.0
                 1.0   2.0
                         2.0   3.0
                                 3.0   4.0
                                         4.0   5.0
                                                 5.0   6.0
                                                         6.0   7.0
                                                                 7.0    8.0
                                                                          8.0



   -10-10




   -20-20




   -30-30
Opusmodus                                                    events-plot    5

Loading score for analysis:

(load "~/Opusmodus/Scores/bach-gv-18.opmo")
(events-plot (collect-score-instruments '+imported 1))


   6060




   5050




   4040




   3030




   2020




   1010




    00
                 10.
                  10.         20.
                               20.   30.
                                      30.   40.
                                             40.   50.
                                                    50.   60.
                                                           60.       70.
                                                                      70.




   -10-10
Opusmodus                                                   events-plot    6

(events-plot (collect-score-instruments '+imported 2))


   60.60.




   50.50.




   40.40.




   30.30.




   20.20.




   10.10.




    0.0.
             10.
              10.     20.
                       20.     30.
                                30.     40.
                                         40.     50.
                                                  50.    60.
                                                          60.       70.
                                                                     70.




  -10.-10.
Opusmodus                                                      events-plot   7

(load "~/Opusmodus/Scores/frames.opmo")
(events-plot (collect-score-instruments 'frames+imported 1))


   6060



   5050



   4040



   3030



   2020



   1010



    00
             55       10
                       10      15
                                15      20
                                         20      25
                                                  25       30
                                                            30         35
                                                                        35


  -10-10



  -20-20



  -30-30



  -40-40
