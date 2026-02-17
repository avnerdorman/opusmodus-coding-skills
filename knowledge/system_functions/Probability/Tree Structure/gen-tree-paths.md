Opusmodus                                                                                gen-tree-paths       1

gen-tree-paths roots depth max-branching sizes
                           &key low high ambitus type variant mod assoc seed

[Function]

Arguments and Values:
roots                      (list): A list of root values for the trees. These can be pitches or integers.
                           If pitches are provided, they are converted to integers internally. Speci es the
                           starting point (root value) for each tree generated.

depth                      (integer or list): Speci es the depth of each tree. If a list is provided, it is
                           matched to the length of roots. Determines how “tall” each tree is (i.e., the
                           number of levels from root to leaves).

max-branching              (integer or list): The maximum number of branches (children) each node can
                           have in each tree. If a list is provided, it is matched to the length of roots.
                           Controls the “breadth” of each tree.

sizes                      (integer or list): The number of paths to extract from each tree. If a list is
                           provided, it is matched to the length of roots. Speci es how many paths to
                           collect from each generated tree.

low                        (integer, default: -60): Lower bound (inclusive) for the random values
                           assigned to the nodes in the trees. De nes the minimum possible value for
                           node values.

high                       (integer, default: 67): Upper bound (inclusive) for the random values
                           assigned to the nodes in the trees. De nes the maximum possible value for
                           node values.

ambitus                    (symbol, list, default: '(-60 67)): A symbol or two-element list specifying
                           the minimum and maximum allowed pitch values (ambitus). Values outside
                           this range are transposed into the range. Restricts the output pitches to
                           a speci c range.

type                       (symbol, default: :pitch): Speci es the type of the output. If :integer,
                           the output will be a list of integers; otherwise, it will be a list of pitches.

variant                    (list or NIL, default: NIL): A list specifying pitch transformations (e.g.,
                           inversion, retrograde etc.). If provided, applies the speci ed variant to the
                           output pitches.

mod                        (integer or NIL, default: NIL): Modulus for pitch class operations.
                           If provided, the intervals are processed modulo mod.

assoc                      Speci es the interval class to associate with when using modulus operations.
                           The default is 12, corresponding to the octave in Western music. Used in
                           conjunction with :mod to de ne the interval association.
             ￼
                 fi
                      fi
                                          fi
                                                  fi
                                                        fi
                                                             fi
                                                             fi
                                                                          fi
                                                                               fi
                                                                                              fi
     Opusmodus                                                                           gen-tree-paths   2

     seed                       (integer, default: NIL): A seed value for the random number generator.
                                If provided, ensures reproducible results.


     Description:

     The GEN-TREE-PATHS function generates arborescent (tree-like) structures for each
     speci ed root and processes the paths from these trees to produce sequences of pitches or
     integers. It allows for extensive customisation of the tree generation and path processing,
     including options for pitch mapping, modulation, ambitus (range limitation), and
     variant transformations. This function is particularly useful in algorithmic composition,
     where hierarchical structures and transformations are used to generate musical material.

     Examples:
     (gen-tree-paths '(0 0 0 0 0 0 0 0 0 0)
                     '(5 3 2 2 4)
                     '(2 3 4)
                     '(2 2 3 2 4 2 3 1)
                     :ambitus 'piano
                     :mod 24)
     => ((c4 g5 c5 d5 d5 c5)
         (c4 g5 c5 d5 a5 g5)
         (c4 c4 e3 a3)
         (c4 c4 e3 e3)
         (c4 cs3 g4)
         (c4 e4 bb3)
         (c4 e4 a2)
         (c4 e3 e3)
         (c4 e3 c4)
         (c4 f4 b3 bb5 c6)
         (c4 f4 b3 bb5 eb6)
         (c4 f4 b3 bb5 gs5)
         (c4 b4 d4 d4 e4 fs4)
         (c4 b4 d4 d4 cs5 fs6)
         (c4 eb5 eb5 f5)
         (c4 c3 f4)
         (c4 g4 d4)
         (c4 g4 f4)
         (c4 c4 bb5 b4 d4)
         (c4 c4 d3 e4 b3))

     Explanation of Parameters

     roots: (0 0 0 0 0 0 0 0 0 0)
     A list of ten roots, all set to 0. In pitch terms, this could represent C4 (middle C) if 0
     corresponds to C4.
fi
                 ￼
     Opusmodus                                                                      gen-tree-paths   3

     depth: (5 3 2 2 4)
     A list specifying the depth for each tree. After trimming or repeating values, this parameter
     will be adjusted to match the length of roots.

     max-branching: (2 3 4)
     A list specifying the maximum branching factor for each tree. Similar to depth, this list will
     be adjusted to match the length of roots.

     sizes: (2 2 3 2 4 2 3 1)
     A list specifying the number of paths to extract from each tree. Will be adjusted to match the
     length of roots.

     :ambitus: 'piano
     Speci es the ambitus (pitch range) to limit the output pitches. 'piano a prede ned range
     corresponding to the range of a piano (e.g., A0 to C8).

     :mod: 24
     Applies modulus 24 to the intervals. This means intervals will be mapped within two
     octaves.

     Score Example:

     (setf mat1 (gen-tree-paths '(0 0 0 0 0 0 0 0 0 0)
                                '(5 3 2 2 4)
                                '(2 3 4)
                                '(2 2 3 2 4 2 3 1)
                                :ambitus 'piano
                                :mod 24))

     (setf piano1 (make-omn :pitch mat1
                            :length '(s)
                            :span :pitch))

     (def-score tree1
         (:key-signature 'chromatic
          :time-signature (get-time-signature piano1)
          :tempo 120
          :layout (grand-layout 'piano))

       (piano :omn piano1 :channel 1 :sound 'gm :program 0))
fi
                 ￼
                                                                               fi
    Opusmodus                                                                  gen-tree-paths         4


           = 120
                             2            3             4             5             6




      7             8            9        10                11            12




      13                14           15       16   17            18            19




                                                                                          Opusmodus




    (setf mat2 (gen-tree-paths
                '(0 1 -2 3 -4 5 -6 7 -8 9 -1 11)
                1
                (rnd-sample 12 '(3 4))
                (rnd-sample 12 '(2 3))
                :ambitus 'piano
                :mod 24))

    (setf piano2 (make-omn :pitch mat2
                           :length '(s)
                           :span :pitch))

    (def-score tree1
        (:key-signature 'chromatic
         :time-signature (get-time-signature piano2)
         :tempo 120
         :layout (grand-layout 'piano))

      (piano :omn piano2 :channel 1 :sound 'gm :program 0))
￼
                ￼
    Opusmodus                                                                                 gen-tree-paths                  5


           = 120
                         2        3        4        5         6        7        8         9        10        11




      12            13       14       15       16   17   18       19       20   21   22       23        24




                                                                                                                  Opusmodus




    Relevant Functions
    ---------------------------------------------------------
    ARBORESCENCE
    COLLECT-TREE-PATHS
    COLLECT-TREE-NODES
    GEN-TREE-NODES
￼
                ￼
