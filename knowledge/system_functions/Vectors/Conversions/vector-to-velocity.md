     Opusmodus                                                            vector-to-velocity   1

     vector-to-velocity low high vector &key type

     [Function]

     Arguments and Values:
     low                     lowest velocity value.
     high                    highest velocity value.
     vector                  a series of vector values.
     type                    :float or :symbol. The default is :symbol.



     Description:

     VECTOR-TO-VELOCITY will map a series of vector values to a given velocity range.

     (vector-to-velocity 0.27 0.87 (gen-noise 10 :seed 67))
     => (ff mf f ffff ff ff pp pp mp mf)

     (get-velocity
      (vector-to-velocity .27 0.87 (gen-noise 10 :seed 67))
      :type :midi)
     => (91 69 80 113 91 91 36 36 58 69)

     Using GET-VELOCITY enables the vector mapping to be represented in MIDI values. This
     can be valuable for those composers used to MIDI as the common value for dynamics. The
      oating point values used in OPUSMODUS are of a far higher resolution than the velocity
     symbols '(pppp pppp ppp pp p mp mf f ff fff ffff fffff) which equal
     12 velocity values.


     Examples:

     Symbols can also be used to specify the range:

     (vector-to-velocity 'ppp 'mf (gen-noise 10))
     => (p mp mf mf p mp mf mf p ppp)

     A random :seed on the vector generator will give consistent outputs:

     (vector-to-velocity 'ppp 'mf (gen-noise 10 :seed 98))
     => (pp pp mp mf ppp mf mp p mp pp)
fl
Opusmodus                                                     vector-to-velocity   2

Example with more then one vector:

(vector-to-velocity 'ppp 'f
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 10 :type :double-exponential :seed 23)))
=> ((mp pp p f pp mp ppp ppp mp p)
    (f pp mf mf pp mf ppp mf mp mp)
    (p mf ppp f pp pp mp ppp p)
    (mp p p f p mp ppp pp mp p))

(velocity-list-plot
 (vector-to-velocity
  '(ppp p mf pp) '(p f ff p)
  (list
   (gen-noise 10 :seed 23)
   (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
   (gen-gaussian-noise 9 :seed 23)
   (gen-noise 10 :type :double-exponential :seed 23))
  :type :float)
 :point-radius 2 :style :fill)
=> ((0.28 0.25 0.26 0.37 0.25 0.28 0.2 0.21 0.29 0.28)
    (0.63 0.41 0.58 0.59 0.43 0.6 0.37 0.55 0.52 0.52)
    (0.59 0.67 0.54 0.72 0.56 0.59 0.65 0.55 0.63)
    (0.33 0.32 0.32 0.37 0.32 0.33 0.28 0.3 0.33 0.32))


      ffffffffff

       ffffffff

       ffffff

        ffff

         ff

       mfmf

       mpmp

         pp

       pppp

      pppppp

     pppppppp

    pppppppppp
                   11   22   33      44   55   66   77   88        99    10
                                                                          10
