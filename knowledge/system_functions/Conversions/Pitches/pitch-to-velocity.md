Opusmodus                                                               pitch-to-velocity   1

pitch-to-velocity from to pitch &key type
[Function]

Arguments and Values:
from                     a velocity symbol or oating point number.
to                       a velocity symbol or oating point number.
pitch                    a list of pitches.
type                     :float or :velocity. The default is :symbol.


Description:

This function converts a list of pitches to velocity values in a given rage: from and to. It
is similar to the functions GEN-CRESC and GEN-DIM. The function PITCH-TO-
VELOCITY allows a dynamic crescendo or diminuendo within a single function.

(get-velocity (gen-cresc 6 'pp 'ff))
=> (0.27 0.35 0.43 0.5 0.58 0.66)

(setf cresc-1
      (pitch-to-velocity 'pp 'ff '(c2 c3 c4 c5 c6 c7) :type :float))
=> (0.27 0.35 0.43 0.5 0.58 0.66)

(setf dim-1
      (pitch-to-velocity 'ff 'pp '(c2 c3 c4 c5 c6 c7) :type :float))
=> (0.66 0.58 0.5 0.43 0.35 0.27)

Let's use the Lisp primitive APPEND or list to bring the two dynamic forms together.

(append cresc-1 dim-1)
=> (0.27 0.35 0.43 0.5 0.58 0.66 0.66 0.58 0.5 0.43 0.35 0.27)

(list cresc-1 dim-1)
=> ((0.27 0.35 0.43 0.5 0.58 0.66)
    (0.66 0.58 0.5 0.43 0.35 0.27))


Examples:
(pitch-to-velocity 'pp 'ff '(c2 c3 c4 c5 c6 c7))
=> (pp p mp mf f ff)

(pitch-to-velocity 'f 'p '(c2 c3 c4 c5 c6 c7))
=> (f mf mf mp mp p)
                                     fl
                                     fl
Opusmodus                                                pitch-to-velocity   2

(pitch-to-velocity 'ppp 'mf '((d5 cs6 c4 e5) (f4 cs4 g5 fs5))
                     :type :float)
=> ((0.36 0.5 0.19 0.39) (0.26 0.19 0.5 0.49))

(pitch-to-velocity '(ppp p) '(mf ff)
                     '((d5 cs6 c4 e5) (f4 cs4 g5 fs5))
                     :type :float)
=> ((0.36 0.5 0.19 0.39) (0.42 0.35 0.66 0.65))
