Opusmodus                                                            vector-to-list   1

vector-to-list vector
[Function]

Arguments and Values:
vector            a vector array.


Description:

The function VECTOR-TO-LIST will convert a vector array to a series of lists.

(vector-to-list #((1 2 3) (4 5 6) (7 8 9)))
=> ((1 2 3) (4 5 6) (7 8 9))


Examples:

There are a number of mapping functions which extend such conversion from vectors.

(vector-to-pitch '(g3 b4) (gen-noise 10))
=> (fs4 gs4 b4 a4 d4 fs4 g3 g3 c4 c4)

(vector-to-length '1/16 1 2 (gen-noise 10))
=> (1/8 1/8 1/16 1/8 1/16 1/8 1/8 1/16 1/16 1/16)

(vector-map '(c4 d4 e4 g4 a4) (gen-noise 10))
=> (g4 e4 c4 c4 d4 e4 a4 d4 d4 a4)

(vector-map '(1/16 1/16 -1/16 1/16) (gen-noise 10))
=> (1/16 1/16 -1/16 1/16 1/16 1/16 -1/16 1/16 1/16 1/16)

(vector-map '(mp mf mp mf) (gen-noise 10))
=> (mf mp mf mf mp mf mf mf mp mf)
