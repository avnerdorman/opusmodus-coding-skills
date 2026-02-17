Opusmodus                                                                length-list-plot   1

length-list-plot lengths &key point-radius
                            join-points zero-based file new-index

[Function]

Arguments and Values:
lengths                  a sequence or series of sequences.
point-radius             an integer.
join-points              NIL or T. The default is NIL.
zero-based               NIL or T. The default is NIL.
file                      le name.
new-index                NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences. Sequences in this case are series of
note lengths. Each value in a sequence is plotted on the y-axis. Positive values on the y-axis
indicate sounding note lengths, whereas negative values denote rest lengths. Values are
positioned along the x-axis according to their position in the sequence.


Examples:
(length-list-plot '(e = = - = = = -))
                   fi
Opusmodus                                                               length-list-plot   2

 By default, points are plotted starting at x = 1. If :zero-based is true, the x coordinate
will start from 0. The points are drawn as circles. :point-radius lets you control the size
of the circles. If 0, the points will not be drawn. If :join-points is true, the points
(whether visible or not) will be connected with line segments. The :style keyword
argument may be either :axis or :fill. If :file is speci ed, it should be a pathname to
which a PDF of the graph will be written. If a .png suf x is present, the graph will be saved
in PNG format, for example:

(length-list-plot
 (vector-to-length 8 8 -8 (gen-noise 100))
 :file "vector-length.png")




:if-exists controls what to do if :file exists. It is :supersede by default. It can
also be :error or :new-index. If :new-index is T, it will override :if-exists
with :new-index.
                                               fi
                                                       fi
Opusmodus                                               length-list-plot   3

(length-list-plot '(q = -e = = = 5q = = = - t = = = = - - -)
 :style :fill :join-points t)
