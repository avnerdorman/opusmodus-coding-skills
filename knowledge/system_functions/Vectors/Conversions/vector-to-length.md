Opusmodus                                                                 vector-to-length   1

vector-to-length length low high vector &key span
[Function]

Arguments and Values:
length                    a length value (ratio or OMN value).
low                       lowest multiplier value.
high                      highest multiplier value.
vector                    vector(s).
span                      NIL or ratio of length. The default is NIL.


Description:

VECTOR-TO-LENGTH will map vectors to a range of values between low and high.

(vector-to-length '1/16 1 2 (gen-noise 10))
=> (1/8 1/8 1/16 1/8 1/16 1/8 1/8 1/16 1/16 1/16)

The low and high arguments act as multipliers of a given length. So, to generate values
between 1 and 2, which in turn multiply a length of 1/16 will give us values between 1/16
(1) and 1/8 (2).


Examples:

Negative values can be used to generate rests, again the number acts as a multiplier.
Therefore in the following example the lengths will range from -3/16 to 1/8:

(vector-to-length '1/16 -3 2 (gen-noise 10))
=> (1/8 1/16 -3/16 1/16 1/8 1/8 -1/8 -1/8)

We can also force the output to :span a given duration, so here values will only be
generated to cover the duration of a half-note:

(vector-to-length '1/16 -3 2 (gen-noise 10) :span 1/2)
=> (-3/16 1/16 1/8 1/8)

A random :seed on the vector generator will give consistent outputs:

(vector-to-length '1/16 -3 2 (gen-noise 10 :seed 98) :span 1/2)
=> (-1/8 -1/16 1/8 -3/16)
Opusmodus                                                  vector-to-length   2

Example with more then one vector:

(vector-to-length 's -3 2
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 12 :type :double-exponential :seed 23)))
=> ((-1/16 -1/8 -1/16 1/8 -1/8 -1/16 -3/16 -3/16 -1/16)
    (1/8 -1/8 1/16 1/16 -1/8 1/16 -3/16 1/16)
    (-1/16 1/16 -3/16 1/8 -1/8 -1/8 -3/16 -1/16)
    (-1/16 -1/16 1/8 -1/16 -3/16 -1/8 -1/16 1/16 -1/16))

(vector-to-length '(s e t s) '(-3 -1 -2 0) '(2 2 3 2)
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 12 :type :double-exponential :seed 23)))
=> ((-1/16 -1/8 -1/16 1/8 -1/8 -1/16 -3/16 -3/16 -1/16)
    (1/4 -1/8 1/8 1/4 1/4 -1/8 1/8 1/8 1/8)
    (1/16 -1/16 3/32 -1/32 -1/32 1/32 -1/16)
    (1/16 1/16 1/16 1/8 1/16 1/16 1/16 1/16 1/8 1/16))

(vector-to-length '(s e t s) '(-3 -1 -2 0) '(2 2 3 2)
 (list
  (gen-noise 10 :seed 23)
  (gen-ar-time-series 10 '(-0.75) 0.5 :seed 23)
  (gen-gaussian-noise 9 :seed 23)
  (gen-noise 12 :type :double-exponential :seed 23)))
 :span '(1 1/2 1 1/4))
=> ((-1/16 -1/8 -1/16 1/8 -1/8 -1/16 -3/16 -3/16 -1/16)
    (1/4 -1/8 1/8)
    (1/16 -1/16 3/32 -1/32 -1/32 1/32 -1/16 1/16 -1/16
     3/32 -1/32 -1/32 1/32 -1/16 1/16 -1/16 3/32 -1/32)
    (1/16 1/16 1/16 1/16))
