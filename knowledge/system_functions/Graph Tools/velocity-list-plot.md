Opusmodus                                                        velocity-list-plot   1

velocity-list-plot velocities &key point-radius join-points
                              zero-based file style new-index

[Function]

Arguments and Values:
velocities             a list of velocities.
point-radius           an integer.
join-points            NIL or T. The default is T.
zero-based             NIL or T. The default is NIL.
file                    le name.
new-index              NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences of velocity data. Each value in
a sequence is plotted on the y-coordinate, increasing in velocity from ppppp to fffff.
Items are plotted along the x-axis sequentially, by their position in the series.


Examples:
(setf velocity (gen-noise 64))
(velocity-list-plot velocity)
                  fi
Opusmodus                                                              velocity-list-plot   2

By default, points are plotted starting at x = 1. If :zero-based is T, the x coordinate
will start from 0. The points are drawn as circles. :point-radius lets you control the
size of the circles. If this has a value of 0, the points will not be drawn. If :join-points
is true, the points (whether visible or not) will be connected with line segments.
The :style keyword argument may be either :axis or :fill. If :file is speci ed, it
should be a pathname to which a PDF of the graph will be written. If a .png suf x is present,
the graph will be saved in PNG format, for example:

(velocity-list-plot velocity :file "velocity-plot.png")

:if-exists controls what to do if :file exists. It is :supersede by default. It can
also be :error or :new-index. If :new-index is T, it will override :if-exists
with :new-index.

(velocity-list-plot velocity :point-radius 2)




                                                                         fi
                                                                               fi
Opusmodus                                         velocity-list-plot   3

(velocity-list-plot velocity
 :style :axis :point-radius 2 :join-points nil)




(velocity-list-plot velocity
 :point-radius 2 :style :fill :line-width 0.5)
Opusmodus                                              velocity-list-plot   4

(velocity-list-plot (rndn 50 0.2 0.6) :style :axis)




(velocity-list-plot
 (list
 (vector-round 22 99 (gen-accumulate (rndn 50 -6 12)))
 (vector-round 22 99 (gen-accumulate (rndn 50 -8 12)))
 (vector-round 22 99 (gen-accumulate (rndn 50 -10 12)))
 (vector-round 22 70 (gen-accumulate (rndn 50 -12 12))))
 :point-radius 2)
