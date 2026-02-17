Opusmodus                                                                           gen-cluster   1

gen-cluster size &key type rotate transpose seed
[Function]

Arguments and Values:
size                an integer.
type                'c (chord), 'm (melody), '? (random selection) or NIL. If NIL then chord.
rotate              an integer, list of integers or NIL. If NIL no rotation.
transpose           an integer, list of integers or NIL. If NIL no transposition.
seed                NIL or an integer. The default is NIL.

Description:

This function generates pitch clusters both as chords and pitch groups. The use of cluster as a
harmonic and sonic resource was rst introduced to music by Henry Cowell in his book New
Musical Resources of 1930 and illustrated in many of his compositions for piano, notably the
infamous Banshee. Composers such as Bela Bartok and Charles Ives used similar clustering
in 2nd Piano Concerto and Concord Sonata respectively.

(gen-cluster 3)
=> (c4db4d4)

(gen-cluster 3 :type 'm)
=> (c4 db4 d4)

(gen-cluster 3 :type 'c :transpose 3)
=> (eb4e4f4)

(gen-cluster 9 :type 'm :transpose -2 :rotate -1)
=> (gb3 bb3 b3 c4 db4 d4 eb4 e4 f4)

(gen-cluster '(3 4 2 3)
               :type '?
               :transpose (rnd-sample 4 (gen-integer -12 12)))
=> ((c3db3d3) (g3 ab3 a3 bb3) (c5 db5) (gb3 g3 ab3))

(gen-cluster '(2 1 3 4)
               :transpose (rnd-sample 4 (gen-integer -12 12)))
=> ((d3eb3) (d4) (gb4g4ab4) (eb3e3f3gb3))

Examples:

As seen in the examples there are many way clusters can be generated with the addition of
randomisation's covering transposition and mixtures of pitch chord groups and rotation
(inversion).
                            fi
Opusmodus                                                      gen-cluster   2

(setf c-chords-rh (gen-cluster
                   (rnd-sample 24 '(2 3 4))
                   :type '?
                   :transpose (rnd-sample 24 (gen-integer 12 24))
                   :seed 76))
=> ((eb5e5f5) (ab5 a5 bb5) (gb5 g5) (gb5 g5 ab5)
    (g5 ab5 a5 bb5) (db5d5) (ab5a5bb5b5) (c5db5d5eb5)
    (a5bb5) (c5db5) (c6 db6) (ab5 a5 bb5 b5) (d5eb5)
    (c6 db6) (f5 gb5) (a5 bb5 b5) (db5d5) (db5 d5 eb5)
    (a5 bb5 b5) (b5 c6 db6 d6) (ab5 a5) (c5db5d5) (bb5 b5) (b5c6))

(setf bass-lh (pitch-transpose
               -24
               (filter-first 1 (pitch-melodize c-chords-rh))))
=> ((eb3) (ab3) (gb3) (gb3) (g3) (db3) (ab3) (c3) (a3)
    (c3) (c4) (ab3) (d3) (c4) (f3) (a3) (db3) (db3)
    (a3) (b3) (ab3) (c3) (bb3) (b3))

(setf rh-lh (flatten (gen-interleave2 bass-lh c-chords-rh)))
=> (eb3 eb5e5f5 ab3 ab5 a5 bb5 gb3 gb5 g5 gb3 gb5 g5
    ab5 g3 g5 ab5 a5 bb5 db3 db5d5 ab3 ab5a5bb5b5
    c3 c5db5d5eb5 a3 a5bb5 c3 c5db5 c4 c6 db6 ab3
    ab5 a5 bb5 b5 d3 d5eb5 c4 c6 db6 f3 f5 gb5 a3
    a5 bb5 b5 db3 db5d5 db3 db5 d5 eb5 a3 a5 bb5
    b5 b3 b5 c6 db6 d6 ab3 ab5 a5 c3 c5db5d5 bb3
    bb5 b5 b3 b5c6)

(pitch-list-plot rh-lh :style :axis :join-chords t)
