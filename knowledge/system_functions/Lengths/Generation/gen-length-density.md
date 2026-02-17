Opusmodus                                                                gen-length-density    1

gen-length-density count &key ratio level density type omn seed
[Function]

Arguments and Values:
count                 a number of list.
ratio                 ratio or length symbol. The default is 1/16.
level                 an integer or list of integers (number of unit). The default is 12.
density               an integer or list of integers. Maximum density is 100 (percent).
                      The default is 50.
type                  a binary mapping type 1 and 2. Type 1 binary-map.
                      Type 2 binary-length-map. The default is 1.
omn                   NIL or T. If true, the OMN style output is forced. The default is NIL.
seed                  integer or NIL. Default is NIL.


Description:

GEN-LENGTH-DENSITY returns a number of length lists in a given density value and
type number.


Examples:
(gen-length-density 2)
=> ((-1/16 -1/16 -1/16 1/16 1/16 1/16
     1/16 -1/16 -1/16 -1/16 -1/16 -1/16)
    (-1/16 -1/16 1/16 -1/16 1/16 -1/16
     1/16 -1/16 1/16 -1/16 1/16 1/16))

(gen-length-density 2 :omn t)
((s = - = = - = - - = - =) (s - - - - = - = = = - -))

(gen-length-density 2 :level 12 :density 10 :type 2)
=> ((5/16 3/16 1/4) (3/16 1/2 1/16))

(gen-length-density 2 :level 12 :density 48 :type 2)
=> ((3/16 1/16 1/16 1/16 1/16 1/16 1/16 3/16)
    (1/8 1/16 1/8 1/16 1/8 1/16 3/16))

(gen-length-density 2 :level 12 :density 85 :type 2)
=> ((1/16 1/16 1/8 1/8 1/16 1/16 1/16 1/16 1/16 1/16)
    (1/16 1/16 1/16 1/8 1/16 1/16 1/16 1/16 1/16 1/16 1/16))

(gen-length-density 2 :level 24 :density '(1 100) :type 2 :omn t)
=> ((w.) (s = = = = = = = = = = = = = = = = = = = = = = =))
Opusmodus                                              gen-length-density   2

(gen-length-density 2 :level 8 :ratio 'e :density '(25 75) :type '(2 1))
=> ((3/8 5/8) (1/8 1/8 -1/8 1/8 1/8 1/8 1/8 1/8))


Score Example:
(setf size 32)
(setf levels (rnd-sample size '(12 16 20)))

(setf pitch (gen-divide
             levels
             (vector-to-pitch
              '(g3 g6)
              (gen-noise (sum levels)))))

(setf length (gen-length-density
              size
              :level levels
              :density '(10 20 40 75 90 40 25 10)
              :type '(2 2 1 2 2 1 2 2)))

(setf violin (make-omn
              :pitch pitch
              :length length
              :velocity '(mf)))

(setf ts (get-time-signature violin))

(def-score violin-solo
           (:title "Solo pour Violin"
            :composer "S.Boussuge"
            :key-signature 'chromatic
            :time-signature ts
            :tempo 112
            :layout (violin-solo-layout 'violin)
            :accidentals :all)

  (violin
    :omn violin
    :channel 1
    :sound 'gm
    :program 'violin)
  )
