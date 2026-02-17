     Opusmodus                                                                                   gen-tree-nodes         1

     gen-tree-nodes node &key type ambitus mod assoc
     [Function]

     Arguments and Values:
     node                               (tree-node): The root node of the tree from which to collect and process node
                                        values. The tree should be constructed using a compatible node structure
                                        (e.g., from the ARBORESCENCE function).

     type                               (symbol, optional, default: :pitch): Speci es the type of the output:
                                        :pitch: Returns a list of pitches.
                                        :integer: Returns a list of integers.

     ambitus                            (symbol, list, default: '(-60 67)): A symbol or two-element list specifying
                                        the minimum and maximum allowed pitch values (ambitus). Values outside
                                        this range are transposed into the range. Restricts the output pitches to
                                        a speci c range.

     mod                                (integer or NIL, default: NIL): Modulus for pitch class operations.
                                        If provided, the intervals are processed modulo mod.

     assoc                              Speci es the interval class to associate with when using modulus operations.
                                        The default is 12, corresponding to the octave in Western music. Used in
                                        conjunction with :mod to de ne the interval association.


     Description:

     The GEN-TREE-NODES function processes a tree data structure to collect all node values
     and optionally applies pitch transformations, ambitus restrictions, and modulus
     operations. It returns a list of pitches or integers based on the collected node values, allowing
     for further musical or data processing involving hierarchical structures.


     Examples:
     (gen-tree-nodes (arborescence 4 3 :low -24 :high 24 :seed 5))
     => (eb2 eb4 c6 g4 fs5 e3 e4 gs5 eb2 f5 eb3 bb4 b4 gs5 b4 c5 eb3 cs2)

     Each element is a pitch corresponding to a node value from the tree. Pitches are adjusted to
      t within the speci ed ambitus. The pitches represent the musical notes derived from the
     node values.
fi
                  ￼
                      fi
                              fi
                                   fi
                                                             fi
                                                                            fi
    Opusmodus                                                 gen-tree-nodes         2

    Score Example:

    (setf pitches
          (gen-tree-nodes
           (arborescence 5 3 :low -24 :high 24) :mod 24 :ambitus '(-24 24)))

    (setf piano (make-omn :pitch pitches :length '(s) :span :pitch))

    (def-score tree-nodes
        (:key-signature 'chromatic
         :time-signature '(4 4)
         :tempo 120
         :layout (grand-layout 'piano))

      (piano :omn piano :channel 1 :sound 'gm :program 0)
      )

           = 120
                                                  2




      3                                   4




      5                                       6




      7                                       8




                                                                         Opusmodus
￼
                ￼
Opusmodus                                                   gen-tree-nodes   3


Relevant Functions
---------------------------------------------------------
ARBORESCENCE
COLLECT-TREE-PATHS
GEN-TREE-PATHS
COLLECT-TREE-NODES
            ￼
