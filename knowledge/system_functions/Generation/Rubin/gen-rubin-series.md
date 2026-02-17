Opusmodus                                                                      gen-rubin-series    1

gen-rubin-series n divide low high offset type direction interval
                              &key ambitus seed

[Function]

Arguments and Values:
n                          an integer - size.
divide                     an integer - zone count.
low                        an integer - lowest zone.
high                       an integer - highest zone.
offset                     a list of integers - zone offset.
type                       'm (melody), 'c (chord) or '? (at random).
direction                  'd (descending) 'a (ascending) or '? (at random).
intervals                  a list of intervals.
ambitus                    instrument name or an integer list (low high). The default is 'piano.
seed                       NIL or integer. The default is NIL.


Description:

The RUBIN FUNCTIONS are based on composition by Ernesto Rubin de Curvin Op.6 per
pianoforte (1966). The piano range and the velocity is divided to 4 zones. They are made up
of 7 different sizes of pitch cluster: 3-4, 4-5, 7, 13-15, 5, 20-22, 31-33, each cluster requires a
different technique - st, open hand, elbow etc... The composition is divided to 94 lines
(section) with duration of 15 sec each. The score is beautifully realised in graphic notation.




                          (Ernesto Rubin de Curvin Op.6, Line 41, fragment)
               fi
Opusmodus                                                           gen-rubin-series   2

This is a good example of how a composer's technique can be incorporated into
OPUSMODUS. This kind of function with so many arguments takes a little time and
experiment to learn - but it can be a most rewarding exercise.


Examples:
(gen-rubin-series
 '(13 3 5 4 4 3 4 4)
 '(8 8 8 8 8 8 8 8)
 '(1 3 5 4 3 6 5 5)
 '(3 3 2 5 6 4 1 2)
 '(-6 0 0 0 6 0 -3 0)
 '(m m m c m c m c)
 '(d a d d d d d d)
 '(1 2 3)
 :ambitus 'piano)
=> ((f3 d3 b2 a2 g2 f2 d2 c2 bb1 g1 f1 d1 c1)
    (db3 eb3 e3) (d3 b2 bb2 a2 ab2) (bb4ab4gb4eb4)
    (eb6 db6 b5 a5) (f5d5b4) (db3 b2 g2 e2) (c5bb4ab4f4))

(gen-rubin-series
 '(13 3 5 4 4 3 4 4)
 '(8 8 8 8 8 8 8 8)
 '(1 3 5 4 3 6 5 5)
 '(3 3 2 5 6 4 1 2)
 '(-6 0 0 0 6 0 -3 0)
 '(?)
 '(?)
 '(1 2 3)
 :ambitus 'piano)
=> ((b0 c1 eb1 e1 f1 gb1 g1 ab1 a1 bb1 b1 c2 db2) (g2 ab2 a2)
    (g3f3d3c3a2) (bb3db4eb4f4) (e3gb3ab3bb3) (g3ab3a3)
    (c4 d4 e4 f4) (d5 c5 b4 bb4))

It's recommended to study the GEN-RUBIN function rst before tackling the GEN-RUBIN-
SERIES. The list of arguments for GEN-RUBIN-SERIES are identical to that of the
function GEN-RUBIN.
                                            fi
