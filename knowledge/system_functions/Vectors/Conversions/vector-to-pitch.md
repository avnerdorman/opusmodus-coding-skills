Opusmodus                                                                      vector-to-pitch      1

vector-to-pitch range vector &key quantize remain
[Function]

Arguments and Values:
range                   a list (low high) or instrument name.
vector                  a series of vector values.
quantize                1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone). The default is 1/2.
remain                  NIL or T (remain values in cents). The default is NIL.


Description:

VECTOR-TO-PITCH will map a series of vector values to a given pitch range.

(setf values (gen-noise 12 :seed 89))
=> (0.18478736 0.9568939 0.6663358 0.26542348 0.4052874
    0.68264747 0.95090246 0.12790146 0.86454636 0.7837427
    0.45705402 0.7908409)

(vector-to-pitch '(g3 g4) values)
=> (gs3 g4 eb4 a3 b3 eb4 g4 g3 fs4 e4 c4 f4)

(vector-to-pitch '(g3 g4) values :quantize 1/4)
=> (gs3 g4 eb4 a3 cs4 eb4 g4 g3 f4+ e4+ c4 e4+)

(vector-to-pitch '(g3 g4) values :quantize 1/8)
=> (g3.. g4 d4.. a3 cs4 eb4 g4 g3 f4.. e4+ c4. e4+)

Here are the mechanics of this mapping that demonstrate how the conversion from
vectors to pitches is made:

(setf mel-data (vector-round -5.0 7.0 (gen-noise 10 :seed 89)))
=> (-4.1765537 7.0 2.7940545 -3.0093136 -0.9847264
    3.0301723 6.913271 -5.0 5.663231 4.4935656)

(integer-to-pitch mel-data)
=> (gs3 g4 eb4 a3 b3 eb4 g4 g3 fs4 e4)

(integer-to-pitch mel-data :quantize 1/4)
=> (gs3 g4 eb4 a3 cs4 eb4 g4 g3 f4+ e4+)
Opusmodus                                                              vector-to-pitch   2

Examples:
(vector-to-pitch '(g3 b4) (gen-noise 10))
=> (g3 gs3 gs4 b4 eb4 e4 f4 c4 e4 fs4)

A random :seed on the vector generator will give consistent outputs:

(vector-to-pitch '(g3 b4) (gen-noise 10 :seed 98))
=> (bb3 c4 fs4 b4 g3 a4 gs4 cs4 gs4 b3)

Example with more then one vector:

(vector-to-pitch
 '(g3 b4)
 (list
 (gen-noise 10 :seed 23)
 (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
 (gen-gaussian-noise 9 :seed 23)
 (gen-noise 12 :type :double-exponential :seed 23)))
=> ((eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4)
    (b4 a3 gs4 a4 b3 a4 g3 fs4 e4 e4)
    (c4 g4 g3 b4 a3 c4 f4 gs3 eb4)
    (eb4 d4 d4 b4 d4 eb4 g3 bb3 eb4 eb4 g4 eb4))

Microtone:

(vector-to-pitch
 '((g3 cs4) (c3 c4) (g3 b4) violin)
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 12 :type :double-exponential :seed 23))
   :quantize 1/4)
=> ((bb3 gs3+ a3 cs4 gs3+ bb3 g3 g3+ as3+ a3+)
    (c4 cs3+ bb3 bb3 eb3 as3+ c3 gs3+ g3 g3)
    (c4 fs4+ g3 b4 a3 c4+ f4 gs3 eb4)
    (g5+ ds5+ e5+ g7 eb5 g5 g3 e4+ gs5 fs5+ gs6 fs5))
