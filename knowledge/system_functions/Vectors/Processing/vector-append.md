Opusmodus                                                                vector-append     1

vector-append &rest vectors
[Function]

Arguments and Values:
vectors                 vectors.


Description:

The function VECTOR-APPEND appends together two or more lists of vectors.

(vector-append #(1 2 3) #(a b c))
=> #(1 2 3 a b c)

This can be valuable when a the graphical function LIST-PLOT is used to bring together a
sequence of vector generations.


Examples:
(setf vec1 (gen-sine 5 6 0.1 :modulation (gen-sine 40 6 0.7)))
(setf vec2 (gen-sine 5 7 0.1 :modulation (gen-sine 40 6 0.2)))
(setf vec3 (gen-sine 5 7 0.3 :modulation (gen-sine 40 4 0.2)))

(vector-append vec1 vec2 vec3)
=> (0.0 -0.09857716 -0.093585365 0.09109767 -0.06323945
      0.0 -0.04038182 0.09400401 0.06667982 0.085028104
      0.0 -0.035457417 0.28201205 -0.28965893 0.13690084)
