Opusmodus                                                               merge-attributes   1

merge-attributes &rest sequence
[Function]

Arguments and Values:
sequence                 lists.


Description:

The function MERGE-ATTRIBUTES returns a new list of merge attributes from given
attribute lists. The rst sequence is a master count list to which all others align to.


Examples:
(merge-attributes
 '(- - stacc - - marc - - -)
 '(- - marc - - marc - - -)
 '(- - - - - ped ped - -))
=> (- - stacc+marc - - marc+ped ped - -)

(merge-attributes
 '((- - stacc - - marc - - -) (stacc - marc - - marc) (- - - - - stacs))
 '((- - marc - - marc - - -) (stacc - stacc - - marc) (leg))
 '((- - - - - ped1 - - -) nil (- - - - - ped1)))
=> ((- - stacc+marc - - marc+ped1 - - -)
    (stacc - marc+stacc - - marc)
    (leg - - - - stacs+ped1))

(merge-attributes
 (binary-to-attribute (gen-binary-euclidean 4 8 1 5) 'stacc)
 (binary-to-attribute (gen-binary-euclidean 4 8 1 5) 'marc))
=> ((stacc+marc - stacc - stacc+marc - stacc -)
    (stacc+marc - stacc stacc+marc - stacc stacc+marc -)
    (stacc+marc - - - - - - -)
    (stacc+marc - marc stacc+marc - marc stacc+marc -))

(merge-attributes
 (binary-to-attribute (gen-weight 12 '((0 4) (1 1))) 'fermata)
 (binary-to-attribute (gen-weight 12 '((0 3) (1 1))) 'stacc)
 (binary-to-attribute (gen-weight 12 '((0 3) (1 1))) 'marc))
=> (stacc - fermata - - fermata+marc stacc stacc stacc - - marc)
             fi
Opusmodus                                               merge-attributes   2

(setf population (gen-population 4 8 8 :seed 56))
=> ((0.9078272 0.05199222 0.95386976 0.5921951 0.93476516
     0.506563 0.19755594 0.18478736)
    (0.2855475 0.4052874 0.6727474 0.6416326 0.86454636
     0.3624713 0.95245343 0.33112416) (0.6858621 0.76038295
     0.25854617 0.27156326 0.36454925 0.31875682 0.17618607 0.38432425)
    (0.33166522 0.7279301 0.29476014 0.22077358 0.49841577
     0.9730699 0.39359245 0.8593635))

(merge-attributes
 (binary-to-attribute
  (vector-round
   0 1
   (gen-mutate-population population :prob 0.1 :count '(1 2)))
  'leg)
 (binary-to-attribute
  (vector-round
   0 1
   (gen-mutate-population population :prob 0.1 :count '(1 5)))
  ‘ped))

=> ((leg+ped - leg+ped leg+ped leg+ped leg+ped - -)
    (- - leg+ped leg leg+ped - leg+ped -)
    (leg+ped leg+ped - - - - - -)
    (- leg+ped - - ped leg - leg))
