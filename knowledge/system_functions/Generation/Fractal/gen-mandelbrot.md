Opusmodus                                                                  gen-mandelbrot   1

gen-mandelbrot cells-x cells-y depth &key left top right bottom
[Function]

Arguments and Values:
cells-x                  an integer.
cells-y                  an integer.
depth                    an integer.
left                     a oating-point number. The default is -1.5.
top                      a oating-point number. The default is 1.0.
right                    a oating-point number. The default is 0.5.
bottom                   a oating-point number. The default is 1.0.


Description:

The Mandelbrot set is a mathematical set of points whose boundary is a distinctive and easily
recognisable two-dimensional fractal shape.

(gen-mandelbrot 6 6 6)
=> #2A((1 2 3 6 3 2) (2 2 6 6 6 2) (2 3 6 6 6 3)
       (3 6 6 6 6 6) (6 6 6 6 6 6) (3 6 6 6 6 6))

The set is closely related to Julia sets (which include similarly complex shapes), and is
named after the mathematician Benoît Mandelbrot, who studied and popularised it. The
output is a two-dimensional array, so to make any conversion into pitch one must use the
function ARRAY-TO-LIST.


Examples:
(setf man-int (gen-mandelbrot 6 6 6))
=> #2A((1 2 3 6 3 2) (2 2 6 6 6 2) (2 3 6 6 6 3)
       (3 6 6 6 6 6) (6 6 6 6 6 6) (3 6 6 6 6 6))

(setf man-lis (integer-to-pitch (array-to-list man-int)))
=> ((db4 d4 eb4 gb4 eb4 d4) (d4 d4 gb4 gb4 gb4 d4)
    (d4 eb4 gb4 gb4 gb4 eb4) (eb4 gb4 gb4 gb4 gb4 gb4)
    (gb4 gb4 gb4 gb4 gb4 gb4) (eb4 gb4 gb4 gb4 gb4 gb4))

(gen-divide 6
 (substitute-map
  '(1/4 1/8 -1/8 1/8 1/16 1/16) '(1 2 3 4 5 6)
   (flatten (array-to-list man-int))))
=> ((1/4 1/8 -1/8 1/16 -1/8 1/8) (1/8 1/8 1/16 1/16 1/16 1/8)
    (1/8 -1/8 1/16 1/16 1/16 -1/8) (-1/8 1/16 1/16 1/16 1/16 1/16)
    (1/16 1/16 1/16 1/16 1/16 1/16) (-1/8 1/16 1/16 1/16 1/16 1/16))
                    fl
                    fl
                    fl
                    fl
Opusmodus                                                     gen-mandelbrot   2

(gen-mandelbrot 10 12 11)
=> #2A((1 2 2 2 3 4 11 4 3 2 2 2)
       (2 2 2 3 6 9 11 9 6 3 2 2)
       (2 2 2 4 8 11 11 11 8 4 2 2)
       (2 2 3 4 8 11 11 11 8 4 3 2)
       (2 3 4 7 11 11 11 11 11 7 4 3)
       (3 4 10 11 11 11 11 11 11 11 10 4)
       (4 8 11 11 11 11 11 11 11 11 11 8)
       (8 11 11 11 11 11 11 11 11 11 11 11)
       (3 4 10 11 11 11 11 11 11 11 10 4)
       (2 3 6 11 11 11 11 11 11 11 6 3))

(list-plot
 (array-to-list (gen-mandelbrot 100 32 50))
 :join-points t :point-radius 2 :style :fill)




Example with ARRAY-TO-LIST and with REPEAT-FILTER function.

(filter-repeat 1 (array-to-list (gen-mandelbrot 10 12 11)))
=> ((1 2 3 4 11 4 3 2)
    (2 3 6 9 11 9 6 3 2)
    (2 4 8 11 8 4 2)
    (2 3 4 8 11 8 4 3 2)
    (2 3 4 7 11 7 4 3)
    (3 4 10 11 10 4)
    (4 8 11 8)
    (8 11)
    (3 4 10 11 10 4)
    (2 3 6 11 6 3))
Opusmodus                                                          gen-mandelbrot   3

A simple example how to generate pitches values from GEN-MANDELBROT result.

(setf mat
 (mapcar 'find-unique
         (filter-repeat 1 (array-to-list (gen-mandelbrot 10 12 11)))))
=> ((1 2 3 4 11) (2 3 6 9 11)
    (2 4 8 11) (2 3 4 8 11) (2 3 4 7 11)
    (3 4 10 11) (4 8 11) (8 11)
    (3 4 10 11) (2 3 6 11))

(interval-map 'c4 (interval-direction-series
                   '(1 2 3 2 2 1 1 2 3 2 2 1) mat :first 'a))
=> ((c4 db4 eb4 gb4 bb4 a5) (g5 e5 bb4 db4 d3)
    (c3 ab2 c2 db1) (eb1 gb1 bb1 gb2 f3)
    (g3 bb3 d4 a4 ab5) (b5 eb6 db7 c8) (ab7 c7 db6)
    (f5 gb4) (a4 db5 b5 bb6) (c7 eb7 a7 bb6))
