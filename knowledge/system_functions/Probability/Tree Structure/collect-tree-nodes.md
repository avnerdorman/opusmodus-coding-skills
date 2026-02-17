Opusmodus                                                                          collect-tree-nodes          1

collect-tree-nodes node
[Function]

Arguments and Values:

node                         (tree-node): The root node of the tree (or subtree) from which to collect node
                             values. It is expected to be an instance of a tree-node structure with at least
                             two elds:
                             value: The value stored in the node.
                             children: A list of child nodes (can be empty for leaf nodes).


Description:

The COLLECT-TREE-NODES function traverses a tree data structure and collects the values
of all nodes within the tree. The result is a at list containing the values of every node,
including both internal nodes and leaves. This function is useful when you need to analyse or
process all the values stored in a tree, such as computing statistics, searching for speci c
values, or transforming the data.


Examples:
(collect-tree-nodes (arborescence 4 3 :low -20 :high 20 :root 8))
=> (8 4 -3 -3 14 1 -20 19 10 18 -11 15 -5 16 14 6 4 -17 18 -7 11 7 -6)

Starts at the root node (8) and collects its value. Recursively visits each child node,
collecting their values. Combines all values into a single at list.


Relevant Functions
---------------------------------------------------------
ARBORESCENCE
COLLECT-TREE-PATHS
GEN-TREE-PATHS
GEN-TREE-NODES
               ￼
                        fi
                                         fl
                                                          fl
                                                                                             fi
