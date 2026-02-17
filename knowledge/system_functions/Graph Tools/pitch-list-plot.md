Opusmodus                                                                   pitch-list-plot   1

pitch-list-plot pitches &key point-radius join-points join-chords
                           zero-based file style new-index

[Function]

Arguments and Values:
pitches                   a list of pitches.
point-radius              an integer.
join-points               NIL or T. The default is NIL.
join-chords               NIL or T. The default is T.
zero-based                NIL or T. The default is NIL.
file                       le name.
new-index                 NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences of pitch data. The value of each
item in a sequence is plotted as a y-coordinate. Items are sequentially plotted along the x-axis
in order of appearance in each sequence. Where pitches form chords each note in the
chord will be plotted on the same x-coordinate.
                   fi
Opusmodus                                                                 pitch-list-plot   2

Examples:
(setf pitch
      (ambitus-chord 13 (gen-chord 150 2 3 4 12
                     (vector-to-pitch '(c2 c5) (gen-noise 100)))))

(pitch-list-plot pitch)




By default, points are plotted starting at x = 1. If :zero-based is T, the x-coordinate
will start from 0. The points are drawn as circles. :point-radius lets you control the
size of the circles. If this is 0, the points will not be drawn. If :join-points is T, the
points (whether visible or not) will be connected with line segments. The :style keyword
argument may be either :axis or :fill. If :file is speci ed, it should be a pathname to
which a PDF of the graph will be written. If a .png suf x is present, the graph will be saved
in PNG format, for example:

(pitch-list-plot pitch :file "chord-plot.png")

:if-exists controls what to do if :file exists. It is :supersede by default. It can
also be :error or :new-index. If :new-index is T, it will override :if-exists
with :new-index.
                                               fi
                                                       fi
Opusmodus                                                 pitch-list-plot   3

(pitch-list-plot pitch :style :axis)




(pitch-list-plot pitch :join-points t :join-chords nil)
Opusmodus                                                pitch-list-plot   4

(pitch-list-plot
 (flatten
  (omn :pitch '((s a4 e a4 bb4 s a3 db4 e. gb4 s a4 e. bb4 s a4 h s f4)
                (s gb4 e. c5 s bb4 c4 bb4 c5 e ab3 ab4 s e. h eb4)))))
