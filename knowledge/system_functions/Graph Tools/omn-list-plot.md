Opusmodus                                                               omn-list-plot   1

omn-list-plot omn-form &key point-radius join-points zero-based
                       style file new-index

[Function]

Arguments and Values:
omn-form                omn form list.
point-radius            an integer.
join-points             NIL or T. The default is NIL.
zero-based              NIL or T. The default is NIL.
style                   :axis or :fill.
file                     le name.
new-index               NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences of OMN format data. This function
graphs pitches ascending from the axis and lengths descending from the axis. Rest length
values are denoted by hollow points and the absence of a corresponding pitch value.


Examples:
(setf
 mat '(q c4 e cs5 d4 s ds5 e4 f5 fs4 -q e g5 - gs4 s a5 as4 b5 -e.))

(omn-list-plot mat)
                  fi
Opusmodus                                                                   omn-list-plot   2

By default, points are plotted starting at x = 1. If :zero-based is T, the x coordinate will
start from 0. Each point is drawn as a circle. :point-radius lets you control the size of
the circles. If this is 0, the points will not be drawn. If :join-points is true, the points
(whether visible or not) will be connected with line segments. The :style keyword
argument may be either :axis or :fill. If :file is speci ed, it should be a pathname to
which a PDF of the graph will be written. If a .png suf x is present, the graph will be saved
in PNG format, for example:

(omn-list-plot mat :file "omn-plot.png")

:if-exists controls what to do if :file exists. It is :supersede by default, but can
also be :error or :new-index. If :new-index is true, it will override :if-
exists with :new-index.

(setf length1 (vector-to-length 32 16 -8 (gen-noise 50)))

(setf pitch1 (ambitus-chord
              14 (gen-chord 50 2 4 3 12
                  (vector-to-pitch
                   '(c2 c5) (gen-noise 100)))))

(setf mat2 (make-omn :length length1 :pitch pitch1))

(omn-list-plot mat2 :point-radius 2)
                                               fi
                                                       fi
Opusmodus                                                  omn-list-plot   3

(omn-list-plot mat2 :join-points t :style nil)




(setf
 mat3 '(e. g3 s b3 e d4 - q._e g4 s a4 g4 fs4 e4 e. fs4 - s g4 e a4 -))

(omn-list-plot mat3 :join-points t)
