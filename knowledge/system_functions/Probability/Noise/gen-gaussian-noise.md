Opusmodus                                                               gen-gaussian-noise      1

gen-gaussian-noise n &key scale seed
[Function]

Arguments and Values:
n                         an integer (a sample size).
scale                      oating number. The default is 1.0.
seed                      an integer or NIL. The default is NIL.


Description:
This function generates N samples of gaussian noise. In probability theory and statistics, a
Gaussian process is a stochastic process whose realisations consist of random values
associated with every point in a range of times (or of space) such that each such random
variable has a normal distribution. Gaussian processes are important in statistical modelling
because of properties inherited from the normal. For example, if a random process is
modelled as a Gaussian process, the distributions of various derived quantities can be
obtained explicitly.

(gen-gaussian-noise 9 :seed 23)
=> (0.8426631415712468D0 1.7360690318771401D0 0.19823522329196053D0
    2.3091227266721077D0 0.4868216276193075D0 0.8126468299770748D0
    1.5213404866899194D0 0.35277777692113044D0 1.2270547431357015D0)

(list-plot (gen-gaussian-noise 500)
 :join-points nil :point-radius 1)
                   fl
Opusmodus                                                         gen-gaussian-noise      2

Examples:

Compare the output of the first example with output from GEN-NOISE. Both outputs create
10-tone tonalities.

(setf white-series (vector-to-pitch '(g3 b4) (gen-noise 20 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 ab3 e4 d4
    bb4 d4 bb3 a3 ab3 c4 a4 bb4 bb4 db4)

(setf gauss-series (vector-to-pitch
                    '(g3 b4) (gen-gaussian-noise 20 :seed 23)))
=> (db4 g4 a3 b4 b3 db4 gb4 bb3 e4 db4
    g3 ab4 d4 c4 eb4 eb4 eb4 c4 d4 eb4)

(sort-asc (find-unique white-series))
=> (g3 ab3 a3 bb3 b3 c4 db4 d4 eb4 e4 a4 bb4 b4)

(sort-asc (find-unique gauss-series))
=> (g3 a3 bb3 b3 c4 db4 d4 eb4 e4 gb4 g4 ab4 b4)

Mapping gaussian result to velocity symbols.

(vector-to-velocity 'ppp 'mf
 (gen-gaussian-noise 20) :type :symbol)
=> (mf ppp ppp ppp mp ppp pp mf ppp pp pp p pp p p mp p mf p mf)
