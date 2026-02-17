Opusmodus                                                                               arborescence      1

arborescence depth max-branching &key low high root seed
[Function]

Arguments and Values:
depth                     (integer): Speci es the maximum depth of the tree. A depth of 0 produces
                          a single-node tree (the root).

max-branching             (integer): The maximum number of branches (children) each node can have.
                          Each node will have between 1 and max-branching children.

low                       (integer, optional, default: -60): The lower bound (inclusive) for the random
                          values assigned to the nodes.

high                      (integer, optional, default: 67): The upper bound (inclusive) for the random
                          values assigned to the nodes.

root                      (integer or NIL, optional, default: NIL): If provided, sets the value of the root
                          node to this value. If nil, the root node’s value is randomly generated.

seed                      (integer or NIL, optional, default: NIL): A seed for the random number
                          generator. If provided, it ensures reproducibility of the random values
                          generated.


Description:

The ARBORESCENCE function generates a random tree structure (arborescence) where each
node contains a value and a list of child nodes. The values of the nodes are randomly
generated within a speci ed range. The structure of the tree is determined by the speci ed
depth and branching factor.

This function is useful for creating hierarchical data structures, simulations, or generating
musical structures where tree-like patterns are desired.


Examples:
(arborescence 4 3 :low -20 :high 20)
=> #S(tree-node :value 2 :children (#S(tree-node :value -11 :children
(#S(tree-node :value -7 :children (#S(tree-node :value -13 :children
(#S(tree-node :value -15 :children nil) #S(tree-node :value -7 :children
nil) #S(tree-node :value -12 :children nil)))))))))
         ￼
                  fi
                                  fi
                                                                                           fi
Opusmodus                                                                  arborescence     2

Explanation of the Example

Parameters:

depth: 4
The tree will have a maximum depth of 4 levels (including the root).

max-branching: 3
Each node can have up to 3 children.

:low: -20
The minimum possible value for node values.

:high: 20
The maximum possible value for node values.

Generated Tree:
The root node has a value of 2.
The root has one child with a value of -11.
The child -11 has one child -7.
The node -7 has one child -13.
The node -13 has three children: -15, -7, and -12, all leaf nodes.

Structure:
The tree is unbalanced, with most nodes forming a single branch until node -13, which has
multiple children. The values are within the speci ed range of -20 to 20.

Visualisation of the Tree:

          (2)
           |
         (-11)
           |
          (-7)
           |
         (-13)
          / | \
      (-15) (-7) (-12)



Relevant Functions
---------------------------------------------------------
COLLECT-TREE-PATHS
GEN-TREE-PATHS
COLLECT-TREE-NODES
GAN-TREE-NODES
        ￼
                                          fi
