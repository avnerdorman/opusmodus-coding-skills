Opusmodus                                                                                permute   1

permute sequence
[Function]

Arguments and Values:
sequence                  a list to process.


Description:

The function PERMUTE will generate multiple lists of all the permutations from a list of
items.

(permute '(1 2 3 4))
=> ((1 2 3 4) (1 2 4 3) (1 3 2 4) (1 3 4 2) (1 4 2 3) (1 4 3 2)
    (2 1 3 4) (2 1 4 3) (2 3 1 4) (2 3 4 1) (2 4 1 3) (2 4 3 1)
    (3 1 2 4) (3 1 4 2) (3 2 1 4) (3 2 4 1) (3 4 1 2) (3 4 2 1)
    (4 1 2 3) (4 1 3 2) (4 2 1 3) (4 2 3 1) (4 3 1 2) (4 3 2 1))


Examples:

Note that sublists are handled as single items.

(permute '((c4 d4) (e4 f4) (g4 a4)))
=> (((c4 d4) (e4 f4) (g4 a4)) ((c4 d4) (g4 a4) (e4 f4))
    ((e4 f4) (c4 d4) (g4 a4)) ((e4 f4) (g4 a4) (c4 d4))
    ((g4 a4) (c4 d4) (e4 f4)) ((g4 a4) (e4 f4) (c4 d4)))

This can be a valuable tool for creating repetitive textures in an orchestral context.


Score Example:
(setf i-3 (permute '(1 2 3)))
(setf cl-1 (integer-to-pitch i-3))
(setf cl-1t (pitch-transpose '(1 3 5 6 2 0) cl-1))

(def-score c-duo
             (:key-signature 'chromatic
              :time-signature '(3 8)
              :tempo 120)

 (clarinet :length (span cl-1t '(1/8)) :pitch cl-1t :velocity '(f)
           :channel 1 :sound 'gm :program 'clarinet)

 (drone :length '(18/8) :pitch '(c3) :velocity '(p) :channel 2))
