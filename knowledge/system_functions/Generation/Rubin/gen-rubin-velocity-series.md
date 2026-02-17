Opusmodus                                                            gen-rubin-velocity-series    1

gen-rubin-velocity-series n divide low high offset
                                               &key type set seed

[Function]

Arguments and Values:
n                          a list of integers - size.
divide                     a list of integers - zone count.
low                        a list of integers - lowest zone.
high                       a list of integers - highest zone.
offset                     a list of integers - zone offset.
set                        'cresc 'dim 'cresc-dim 'dim-cresc 'repeat or '? (at random).
                           The default is NIL.
type                       :float or :symbol. The default is :symbol.
seed                       an integer or NIL. The default in NIL.


Description:

The RUBIN FUNCTIONS are based on composition by Ernesto Rubin de Curvin Op.6 per
pianoforte (1966). The piano range and the velocity is divided to 4 zones. They are made up
of 7 different sizes of pitch cluster: 3-4, 4-5, 7, 13-15, 5, 20-22, 31-33, each cluster requires a
different technique - st, open hand, elbow etc... The composition is divided to 94 lines
(section) with duration of 15 sec each. The score is beautifully realised in graphic notation.




                          (Ernesto Rubin de Curvin Op.6, Line 29, fragment)
               fi
Opusmodus                                                  gen-rubin-velocity-series   2

This is a good example of how a composer's technique can be incorporated into
OPUSMODUS. This kind of function with so many arguments takes a little time and
experiment to learn - but it can be a most rewarding exercise.


Examples:
(gen-rubin-velocity-series
 '(8 11 8 13 7 6 2 4)
 '(8 8 8 8 8 8 8 8)
 '(1 2 1 2 1 1 1 2)
 '(3 4 3 3 3 4 3 4)
 '(0 0 -6 -3 0 0 -4 0 3)
 :set '? :type :float)
=> ((0.38 0.33 0.28 0.22 0.17 0.12 0.06 0.01)
    (0.42 0.43 0.34 0.19 0.49 0.49 0.29 0.2 0.32 0.5 0.18)
    (0.11 0.32 0.1 0.34 0.24 0.06 0.24 0.32)
    (0.11 0.16 0.2 0.23 0.28 0.31 0.35 0.31 0.28 0.23 0.2 0.16 0.11)
    (0.38 0.26 0.13 0.01 0.13 0.26 0.38)
    (0.5 0.25 0.01 0.17 0.34 0.5)
    (0.38 0.01)
    (0.13 0.26 0.39 0.5))

(gen-rubin-velocity-series
 '(8 11 8 13 7 6 2 4)
 '(8 8 8 8 8 8 8 8)
 '(1 2 1 2 1 1 1 2)
 '(3 4 3 3 3 4 3 4)
 '(0 0 -6 -3 0 0 -4 0 3)
 :set '?
=> ((p p pp ppp ppp pppp ppppp ppppp)
    (mp mp p ppp mf mf pp ppp p mf ppp)
    (pppp p pppp p pp ppppp pp p)
    (pppp ppp ppp ppp pp p p p pp ppp ppp ppp pppp)
    (p pp pppp ppppp pppp pp p)
    (mf pp ppppp ppp p mf)
    (p ppppp)
    (pppp pp p mf))
Opusmodus                                                 gen-rubin-velocity-series   3

(velocity-list-plot
 (flatten
  (gen-rubin-velocity-series
     '(8 11 8 13 7 6 2 4)
     '(8 8 8 8 8 8 8 8)
     '(1 2 1 2 1 1 1 2)
     '(3 4 3 3 3 4 3 4)
     '(0 0 -6 -3 0 0 -4 0 3) :set '?))
     :join-points t :point-radius 2)




It's recommended to study the GEN-RUBIN function rst before tackling the GEN-RUBIN-
VELOCITY. The list of arguments for GEN-RUBIN-VELOCITY are identical to that of the
function GEN-RUBIN. In the example below notice how a zone has been single out, zone 1
and then zone 5. Notice that the output here is independent of the perc-solo output.

(setf perc-solo
     (gen-repeat-seq '(4 6 8) 1 1
                       '((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4))))
=> ((c4 cs4 c4 cs4) (cs4 c4 d4 cs4 c4 d4) (cs4 c4 cs4 d4 cs4 c4 cs4 d4))

(gen-rubin-velocity-series
 '(4 6 8) ; matches the number of pitches in perc-solo
 '(7 5 7) ; number of zones accessed
 '(1 1 1) ; low level of zones (1 of 7)
 '(1 3 4) ; high level of zones (1 of 7)
 '(0 -5 0) ; offset of zones
 :set '?)
=> ((ppppp ppppp pppp pppp)       ; (c4 cs4 c4 cs4)
    (ppppp pp f mp ppp ppppp)     ; (cs4 c4 d4 cs4 c4 d4)
    (mp mf mf ppp mf mp pppp mp)) ; (cs4 c4 cs4 d4 cs4 c4 cs4 d4)
                                            fi
