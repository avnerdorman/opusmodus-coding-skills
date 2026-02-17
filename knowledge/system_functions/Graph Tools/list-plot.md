Opusmodus                                                                     list-plot   1

list-plot sequences &key point-radius join-points line-width
               zero-based style file new-index

[Function]

Arguments and Values:
sequences               a numerical sequence or sequences.
point-radius            an integer (radius size). The default is 1.
join-points             NIL or T. The default is NIL.
line-width              an integer. The default is 1.
zero-based              NIL or T. The default is NIL.
style                   :axis (draw line to axis) or :fill ( ll from axis).
file                     le name.
if-exists               :supersede, :error or :new-index
new-index               NIL or T. The default is NIL.


Description:

Generate a graph from the data provided in sequences. Sequences may be either a
single sequence of real numbers, or a series of such sequences. Each number in a
sequence represents a y-coordinate. Numbers are positioned along the x-axis according to
their position in the sequence.
                  fi
                                                      fi
Opusmodus                                                                       list-plot   2

Examples:
(list-plot '(0 2 3 5 8 13 21 34)
           :zero-based t :point-radius 2 :join-points t)




As can be inferred from the above examples, by default points are plotted starting at x = 1.
If :zero-based is T, points will start being plotted at the x coordinate of 0. The points are
drawn as circles. :point-radius lets you control the size of the circles. If 0, the points
will not be drawn. If :join-points is T, the points (whether visible or not) will be
connected with line segments. The :style keyword argument may be either :axis
or :fill, for example:
Opusmodus                                 list-plot   3

(list-plot
 (list
  (gen-accumulate (rndn 200 -1.0 1.0))
  (gen-accumulate (rndn 200 -1.0 1.0)))
 :point-radius 1 :style :axis)
Opusmodus                                                     list-plot   4

(list-plot
 (list
  (ambitus-integer 'piccolo (gen-accumulate (rndn 50 -12 12)))
  (ambitus-integer 'violin (gen-accumulate (rndn 50 -12 12)))
  (ambitus-integer 'viola (gen-accumulate (rndn 50 -12 12)))
  (ambitus-integer '(-30 12) (gen-accumulate (rndn 50 -12 12)))
  (ambitus-integer 'piano (gen-accumulate (rndn 50 -12 12)))
  (ambitus-integer 'cello (gen-accumulate (rndn 50 -12 12))))
 :point-radius 0 :style :fill)
Opusmodus                                                                          list-plot      5

If :file is speci ed, it should be a pathname to which a PDF of the graph will be written.
The .pdf suf x will be appended automatically if it is not present. If a .png suf x is present,
the graph will be saved in PNG format, for example:

(list-plot
 (list
  (gen-accumulate (rndn 200 -1.0 1.0))
  (gen-accumulate (rndn 200 -1.0 1.0)))
 :point-radius 1 :style :axis :file "accumulate-plot.png")




:if-exists controls what to do if :file exists. It is :supersede by default. It can
also be :error or :new-index. If :new-index is T, it will override :if-exists
with :new-index.
      fi
            fi
                                                                          fi
Opusmodus                                          list-plot   6

(list-plot (gen-accumulate (rndn 200 -1.0 1.0)))




(list-plot
 (gen-accumulate (rndn 200 -1.0 1.0))
 :join-points t :point-radius 0)
Opusmodus                                 list-plot   7

With two or more sequences.

(list-plot
 (list
  (gen-accumulate (rndn 200 -1.0 1.0))
  (gen-accumulate (rndn 200 -1.0 1.0)))
 :point-radius 2)
Opusmodus                                            list-plot   8

(list-plot
 (list
  (loop for x from 0 to 15 by .1 collect (sin x))
  (loop for x from 0 to 29 by .2 collect (sin x))
  (loop for x from 0 to 43 by .3 collect (sin x)))
 :join-points t :point-radius 0)
