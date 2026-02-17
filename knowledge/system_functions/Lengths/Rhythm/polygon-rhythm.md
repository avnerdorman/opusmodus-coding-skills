Opusmodus                                                                         polygon-rhythm    1

polygon-rhythm n-gon points start &key pitch velocity articulation
                         invert value legato seed

[Function]

Arguments and Values:
n-gon                    an integer (number of sides) or list of integers ( xed sides).
points                   an integer (number of points). The default is 12.
start                    an integer or '? symbol (start point).
pitch                    pitch or NIL. The default is NIL.
velocity                 velocity or NIL. The default is NIL.
articulation             articulation or NIL. The default is NIL.
invert                   T or NIL. Inversion of n-gon in relation to points.
value                    a ratio. A value of a point.
legato                   T or NIL. The default is NIL.
seed                     an integer or NIL. An integer ensures the same result each time the code
                         is evaluated. The default is NIL.


Description:

This function returns a symmetrical polygon to a given n-gon (side number) with circle
points (denominator) with a given start point, and a symmetrical or non-symmetrical
polygon when a full list of sides are given.


Examples:

In this example we use 3-gon in a 16 point circle with the starting point 0:

(polygon-rhythm 3 16 0)
=> (1/16 -1/16 -1/16 -1/16 1/16 -1/16 -1/16 -1/16
    -1/16 -1/16 -1/16 -1/16 1/16 -1/16 -1/16 -1/16)

Same as above with :legato option:

(polygon-rhythm 3 16 0 :legato t)
=> (1/4 1/2 1/4)
                                                                fi
Opusmodus                                                               polygon-rhythm   2

The 3-gon in a 16 point circle with the starting point 0 will produce 7 symmetrical 3-gons
selected at random:

(circle-rhythm-plot (polygon-rhythm 3 16 0) :points 16)




Example with start point 5:

(polygon-rhythm 3 16 5)
=> (-1/16 -1/16 -1/16 -1/16 -1/16 1/16 -1/16 -1/16
    -1/16 -1/16 -1/16 1/16 -1/16 -1/16 -1/16 1/16)

To visualise the polygon correctly we need to change the :points and the :value in
CIRCLE-RHYTHM-PLOT function to the same values as in the POLYGON-RHYTHM
function.

(circle-rhythm-plot (polygon-rhythm 5 16 5 :seed 45) :points 16)
Opusmodus                                                               polygon-rhythm   3

In the next three examples below we use a list of xed polygon sides (non-symmetrical):

(circle-rhythm-plot (polygon-rhythm '(1 6 10) 16 1) :points 16)




To rotate the polygon we change the starting point value:

(circle-rhythm-plot (polygon-rhythm '(1 6 10) 16 2) :points 16)
                                           fi
Opusmodus                                                                polygon-rhythm     4

(circle-rhythm-plot
 (polygon-rhythm '(0 2 5 7 10 12 13 15 16 18 19 21 23) 24 0)
 :points 24 :value 1/24)




In the following example we create 8 bars of a ‘Drum Set’ rhythm. First we assign the ‘GM
Percussion’ names to variables:

(setf bd (read-map *gm-percussion* 'acoustic-bass-drum))
(setf sd (read-map *gm-percussion* 'Acoustic-Snare))
(setf ht (read-map *gm-percussion* 'High-Tom))
(setf hh (read-map *gm-percussion* 'Open-Hi-hat))

Next we create 4 polygon rhythms:

(setf bd-gon (polygon-rhythm 3 16 0 :pitch bd :seed 5))
(setf sd-gon (polygon-rhythm 2 16 1 :pitch sd :seed 45))
(setf ht-gon (polygon-rhythm 2 16 5 :pitch ht :seed 45))
(setf hh-gon (polygon-rhythm 5 16 2 :pitch hh :seed 5))
Opusmodus                                                                 polygon-rhythm     5

Visualising how the rhythms are working together:

(circle-rhythm-plot (list bd-gon sd-gon ht-gon hh-gon) :points 16)




Lets hear the result above, using PS function and ‘GM Instrument Set’ with a 8 times loop:

(ps 'gm
    :ds-bd (list (gen-loop 8 bd-gon))
    :ds-sd (list (gen-loop 8 sd-gon))
    :ds-ht (list (gen-loop 8 ht-gon))
    :ds-hh (list (gen-loop 8 hh-gon))
    :tempo 120)

Same as above but without a seed value:

(ps 'gm
    :ds-bd (list (gen-loop 8 (polygon-rhythm 3 16 0 :pitch bd)))
    :ds-sd (list (gen-loop 8 (polygon-rhythm 2 16 1 :pitch sd)))
    :ds-ht (list (gen-loop 8 (polygon-rhythm 2 16 5 :pitch ht)))
    :ds-hh (list (gen-loop 8 (polygon-rhythm 5 16 2 :pitch hh)))
    :tempo 120)
Opusmodus                                                            polygon-rhythm   6

In the next example we add a few more percussion instruments. The '? start symbol
means the start point is selected at random: 0 to 15.

(progn
 (setf bd (read-map *gm-percussion* 'Acoustic-Bass-Drum))
 (setf sd (read-map *gm-percussion* 'Acoustic-Snare))
 (setf ht (read-map *gm-percussion* 'High-Tom))
 (setf hh (read-map *gm-percussion* 'Open-Hi-hat))
 (setf lb (read-map *gm-percussion* 'Low-Bongo))
 (setf hb (read-map *gm-percussion* 'High-Bongo))
 (setf mhc (read-map *gm-percussion* 'Mute-Hi-Conga))
 (setf lc (read-map *gm-percussion* 'Low-Conga))

    (ps 'gm
         :ds-bd (list (gen-loop 16 (polygon-rhythm 3 16 0 :pitch bd)))
         :ds-sd (list (gen-loop 16 (polygon-rhythm 2 16 1 :pitch sd)))
         :ds-ht (list (den-loop 16 (polygon-rhythm 2 16 5 :pitch ht)))
         :ds-hh (list (gen-loop 16 (polygon-rhythm 5 16 2 :pitch hh)))
         :rhy   (list (gen-loop 16 (polygon-rhythm 5 16 '? :pitch lb))
                      (gen-loop 16 (polygon-rhythm 4 16 '? :pitch hb))
                      (gen-loop 16 (polygon-rhythm 7 16 '? :pitch mhc))
                      (gen-loop 16 (polygon-rhythm 7 16 '? :pitch lc)))
         :tempo 120)
)
