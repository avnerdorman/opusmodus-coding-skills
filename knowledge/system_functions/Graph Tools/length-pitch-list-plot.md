Opusmodus                                                        length-pitch-list-plot      1

length-pitch-list-plot lengths pitches &key point-radius
                                       join-points zero-based style
                                       file new-index

[Function]

Arguments and Values:
lengths                  a list of length.
pitches                  a list of pitches.
point-radius             an integer.
join-points              NIL or T. The default is NIL.
zero-based               NIL or T. The default is NIL.
style                    :axis or :fill.
file                      le name.
new-index                NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences of length and pitch data. This
function graphs pitches ascending from the axis and lengths descending from the axis. Rest
length values are denoted by hollow points and the absence of a corresponding pitch value.
                   fi
Opusmodus                                                         length-pitch-list-plot    2

Examples:
(setf length '(q e = s = = = -q e - = s = = -e.)
      pitch '(c4 cs5 d4 ds5 e4 f5 fs4 g5 gs4 a5 as4 b5))

(length-pitch-list-plot length pitch)




By default, points are plotted starting at x = 1. If :zero-based is T, the x coordinate will
start from 0. Each point is drawn as a circle. :point-radius lets you control the size of
the circles. If this is 0, the points will not be drawn. If :join-points is true, the points
(whether visible or not) will be connected with line segments. The :style keyword
argument may be either :axis or :fill. If :file is speci ed, it should be a pathname to
which a PDF of the graph will be written. If a .png suf x is present, the graph will be saved
in PNG format, for example:

(length-pitch-list-plot length pitch
 :file "length-pitch-plot.png")

:if-exists controls what to do if :file exists. It is :supersede by default, but can
also be :error or :new-index. If :new-index is true, it will override :if-exists
with :new-index.
                                               fi
                                                       fi
Opusmodus                                          length-pitch-list-plot   3

(setf
 length1 (vector-to-length 32 16 -8 (gen-noise 50))
 pitch1 (ambitus-chord
           14 (gen-chord 50 2 4 3 12
               (vector-to-pitch '(c2 c5) (gen-noise 100)))))

(length-pitch-list-plot length1 pitch1 :point-radius 2)




(length-pitch-list-plot length1 pitch1
 :join-points t :style nil)
Opusmodus                                           length-pitch-list-plot   4

OMN:

(setf mat '(e. g3 s b3 e d4 - q._e g4
            s a4 g4 fs4 e4 e. fs4 - s g4 e a4 -))

(length-pitch-list-plot (omn :length mat) (omn :pitch mat)
 :join-points t)
