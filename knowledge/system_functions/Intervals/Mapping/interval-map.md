Opusmodus                                                                                   interval-map   1

interval-map start intervals &key ambitus seed
[Function]

Arguments and Values:
start                   start tonic pitch, or integer.
intervals               list of intervals.
ambitus                 pitches (low high), integers (low high), or instrument name.
                        The default is 'piano.
seed                    NIL or an integer (random seed). The default is NIL.


Description:

Use INTERVAL-MAP to map a series of intervals to pitches beginning with a speci ed
start (tonic note).

(interval-map 'c4 '(2))
=> (c4 d4)

Note the difference between the two examples below. The PCS version is not cumulative,
whereas the INTERVAL-MAP is. However, as the examples demonstrate with INTERVAL-
MAP many more creative and generative options are available.

(pcs '9-7)
=> (0 1 2 3 4 5 7 8 10)

(pcs '9-7 :type :pitch)
=> (c4 db4 d4 eb4 e4 f4 g4 ab4 bb4)

(interval-map 'c4 (pcs '9-7))
=> (c4 c4 db4 eb4 gb4 bb4 eb5 bb5 gb6 e7)


Examples:

Note that intervals are handled in a cumulative manner, note also the addition of
an :ambitus to constrain the range:

(interval-map 'c4 '(4 4 4 4 4 4) :ambitus '(c4 c5))
=> (c4 e4 gs4 c5 gs4 e4 c4)

(interval-map 'c4 '((2 2 1) (2 2 2 1) (-1 -2 -2 -2) (-1 -2 -2)))
=> ((c4 d4 e4 f4) (g4 a4 b4 c5) (b4 a4 g4 f4) (e4 d4 c4))
                                                                                       fi
Opusmodus                                                                 interval-map   2

Evaluate lists using multiple start (tonic) pitches:

(interval-map
 '(c4 e4 g4) '((2 2 1) (2 2 2 1) (-1 -2 -2 -2) (-1 -2 -2)))
=> ((c4 d4 e4 f4) (e4 gb4 ab4 bb4 b4) (g4 gb4 e4 d4 c4) (c4 b3 a3 g3))

Using NIL will randomise the starting point (within the range of the :ambitus):

(interval-map nil '(2 -2 2) :ambitus '(c4 a6))
=> (d4 e4 d4 e4)

Nil can also be used in lists to introduce random 'transpositions':

(interval-map '(c4 nil) '((2 -2 2) (2 -2 2)) :ambitus '(c4 a6))
=> ((c4 d4 e4 gb4) (d4 e4 d4 e4))
