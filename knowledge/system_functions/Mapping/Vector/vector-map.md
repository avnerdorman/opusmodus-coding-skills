Opusmodus                                                                      vector-map      1

vector-map map data
[Function]

Arguments and Values:
map                      a series of items.
data                     a series of oating-point numbers.


Description:

VECTOR-MAP enables a stream of oating-point numbers to be related to a series of items.

(vector-map '(c4 d4 e4 g4 a4) (gen-noise 10))
=> (g4 e4 c4 c4 d4 e4 a4 d4 d4 a4)

Here, for example, we generate 10 white-noise samples, which are then related to a
pentatonic series. This is a kind of substitution function similar to SUBSTITUTE-MAP but
without the precise association between items in one list and items in another. Whatever the
complexity of the GEN-NOISE output it can be simpli ed and mapped to a series of items.


Examples:
(vector-map '(1/16 1/16 -1/16 1/16) (gen-noise 10))
=> (1/16 1/16 -1/16 1/16 1/16 1/16 -1/16 1/16 1/16 1/16)

(vector-map '(mp mf mp mf) (gen-noise 10))
=> (mf mp mf mf mp mf mf mf mp mf)

A random :seed on the vector generator will give consistent outputs:

(vector-map '(q e s - -e -q) (gen-noise 12 :seed 98))
=> (e s - -q q -e -e s -e e - -e)

Example with more then one vector:

(vector-map '((1/16 1/16 -1/16 1/16))
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 10 :type :double-exponential :seed 23)))
=> ((1/16 1/16 1/16 1/16 1/16 1/16 -1/16 -1/16 1/16 1/16)
    (1/16 -1/16 1/16 1/16 1/16 1/16 -1/16 1/16 1/16 1/16)
    (1/16 1/16 -1/16 1/16 -1/16 1/16 1/16 -1/16 1/16)
    (1/16 1/16 1/16 1/16 1/16 1/16 -1/16 1/16 1/16 1/16))
                            fl
                                 fl
                                                  fi
Opusmodus                                               vector-map   2

(vector-map '((c4 fs4 cs5 g5) (c4 d4 e4 fs4 gs4))
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 10 :type :double-exponential :seed 23)))
=> ((fs4 fs4 fs4 g5 fs4 fs4 c4 c4 cs5 fs4)
    (gs4 d4 fs4 fs4 d4 gs4 c4 fs4 e4 e4)
    (fs4 cs5 c4 g5 c4 fs4 cs5 c4 fs4)
    (e4 e4 e4 gs4 e4 e4 c4 d4 e4 e4))
