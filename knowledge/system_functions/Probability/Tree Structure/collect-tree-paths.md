Opusmodus                                                                               collect-tree-paths           1

collect-tree-paths node &optional path
[Function]

Arguments and Values:
node                              (tree-node): The root node of the tree (or subtree) from which to collect paths.
                                  This node is expected to be an instance of a tree-node structure that has at least
                                  two elds:
                                  value: The value stored in the node.
                                  children: A list of child nodes (can be empty for leaf nodes).

path                              (list, optional, default: empty list): An accumulator for the path values during
                                  recursion. This argument is primarily used internally and should typically not
                                  be provided when calling the function externally.


Description:

The COLLECT-TREE-PATHS function traverses a tree data structure and collects all
possible paths from the root node to each leaf node. Each path is represented as a list of node
values, and the function returns a list of these paths.

This function is useful for scenarios where you need to analyze or process all possible
sequences from the root to the leaves in a tree, such as generating musical sequences,
decision trees, or any hierarchical data exploration.

Function Behaviour

Traversal:
The function performs a depth- rst traversal of the tree, exploring each path from the root to
every leaf node.

Path Collection:
At each node, the function appends the node’s value to the current path. When a leaf node is
reached (a node with no children), the current path is added to the list of paths.

Recursion:
For internal nodes (nodes with children), the function recursively calls itself on each child,
passing along the current path. The results from each child are combined using append to
form the complete list of paths.
               ￼
                        fi
                             fi
Opusmodus                                                             collect-tree-paths    2

Examples:
(setf tree (arborescence 4 3 :low -20 :high 20 :root 0))

Collect all paths from the root to the leaves:

(collect-tree-paths tree)
=> ((0 -8 -1 2 -19)
    (0 -8 -1 -16 6)
    (0 -8 -1 -16 6)
    (0 -8 -1 -16 1)
    (0 -8 -1 8 18)
    (0 -8 1 14 9)
    (0 -8 1 14 3)
    (0 -8 1 -5 -4)
    (0 -8 1 -5 3)
    (0 -8 1 -8 2)
    (0 -8 -19 5 -2)
    (0 -8 -19 5 13)
    (0 -8 -19 5 -2)
    (0 -8 -19 17 1)
    (0 -5 1 16 -9)
    (0 -5 1 16 6)
    (0 -5 1 16 3)
    (0 -5 1 -20 -10)
    (0 -5 -11 -8 -2)
    (0 -5 -11 7 -5)
    (0 17 18 2 0)
    (0 17 18 2 -17)
    (0 17 18 -9 5)
    (0 17 18 -9 -17)
    (0 17 18 -9 -3)
    (0 17 -2 -13 -5)
    (0 17 -2 -13 -4)
    (0 17 -2 -13 -19)
    (0 17 -2 -5 16)
    (0 17 -2 -5 17)
    (0 17 -2 -5 8))

For very large trees, the number of paths can grow exponentially, which may impact
performance or memory usage. Consider adding limits or processing paths incrementally for
large datasets.

The COLLECT-TREE-PATHS function is a powerful tool for extracting all possible root-to-
leaf paths in a tree structure. By understanding its usage and behaviour, you can apply it to
various domains requiring hierarchical data processing.
               ￼
Opusmodus                                              collect-tree-paths   3

Relevant Functions
---------------------------------------------------------
ARBORESCENCE
GEN-TREE-PATHS
COLLECT-TREE-NODES
GEN-TREE-NODES
            ￼
