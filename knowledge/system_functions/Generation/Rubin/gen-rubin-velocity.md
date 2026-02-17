Opusmodus                                                                     gen-rubin-velocity   1

gen-rubin-velocity n divide low high offset &key type set seed
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
Opusmodus                                                         gen-rubin-velocity   2

This is a good example of how a composer's technique can be incorporated into
OPUSMODUS. This kind of function with so many arguments takes a little time and
experiment to learn - but it can be a most rewarding exercise.


Examples:
(gen-rubin-velocity 18 7 3 5 0 :seed 345)
=> (pp p p p p mp mp mp mf mf mf f f f ff ff ff fff)

(gen-rubin-velocity 14 8 2 4 0 :seed 345)
=> (pppp ppp ppp ppp pp pp pp p p mp mp mp mf mf)

(gen-rubin-velocity 8 4 1 3 0 :set 'cresc-dim)
=> (ppppp ppp p f fff f p ppp)

(gen-rubin-velocity 8 4 2 4 8 :set 'dim :type :float)
=> (1.0 0.9 0.79 0.69 0.57 0.47 0.36 0.26)

(gen-rubin-velocity 8 4 2 4 8 :set '?)
=> (pp p mf f ff ffff fffff fffff)

It's recommended to study the GEN-RUBIN function rst before tackling the GEN-RUBIN-
VELOCITY. The list of arguments for GEN-RUBIN-VELOCITY are identical to that of the
function GEN-RUBIN. In the example below notice how a zone has been single out, zone 1
and then zone 5. The difference in output is very marked.

(setf perc-solo
      (gen-repeat-seq  '(4 6 8) 1 1
                       '((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4))))
=> ((c4 cs4 c4 cs4) (cs4 c4 d4 cs4 c4 d4) (cs4 c4 cs4 d4 cs4 c4 cs4 d4))

(gen-rubin-velocity
 (length (flatten perc-solo))
 7 1 3 0 :seed 45)
=> (mp mp p p p pp pp pp ppp ppp ppp ppp
    pppp pppp pppp ppppp ppppp ppppp)

(gen-rubin-velocity
 (length (flatten perc-solo)) 7 5 5 0 :seed 45 :type :symbol)
=> (fff ff ff ff ff ff ff ff ff ff ff f f f f f f f)
                                            fi
