Opusmodus                                                                   circle-rhythm-plot   1

circle-rhythm-plot sequences &key points value point-radius
                              line-width style file if-exists new-index

[Function]

Arguments and Values:
sequences              a sequence (lengths, integers, binary or omn-form list).
points                 an integer (number of steps). The default is 12.
value                  a ratio (length value). The default is 1/16.
point-radius           an integer or Nil. The default is NIL.
line-width             an integer. The default is 2.
style                  :line or :fill. The default is :line.
file                    le name.
if-exists              :supersede, :error or :new-index
new-index              NIL or T. The default is NIL.


Description:

The function CIRCLE-RHYTHM-PLOT returns a polygonal representation of music rhythms
and is ideal tool for measuring individual rhythmic patterns and combination of them.


Examples:

A few Clave rhythms:

(circle-rhythm-plot '(0 4 6 10 12) :points 16)
                 fi
Opusmodus                                        circle-rhythm-plot   2

(circle-rhythm-plot '(0 3 6 10 12) :points 16)




(circle-rhythm-plot '(0 3 6 10 11) :points 16)
Opusmodus                                       circle-rhythm-plot   3

(circle-rhythm-plot '(0 2 4 7 9))




Two patterns representation:

(circle-rhythm-plot '((0 2 4 7 9) (0 3 6 9)))
Opusmodus                                           circle-rhythm-plot   4

An example with binary input and 4 patterns:

(circle-rhythm-plot '((1 0 1 0 1 0 1 0 1 0 1 0)
                      (1 0 0 1 0 0 1 0 0 1 0 0)
                      (1 0 0 0 1 0 0 0 1 0 0 0)
                      (1 0 0 0 0 0 1 0 0 0 0 0)))




Examples with lengths input:

(circle-rhythm-plot '((e q e q q) (-e e q e q e))
                    :points 8 :value 1/8)
Opusmodus                                              circle-rhythm-plot   5

Euclidean polygonal representation:

(circle-rhythm-plot (gen-binary-euclidean 1 16 4 12) :points 16)
Opusmodus                                              circle-rhythm-plot   6

Example with omn form sequence:

(circle-rhythm-plot '(-e. s c2 ffff -e. e cs2 ff ffff c2 -s e c2))
