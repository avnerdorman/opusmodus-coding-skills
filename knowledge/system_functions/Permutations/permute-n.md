Opusmodus                                                                          permute-n     1

permute-n n
[Function]

Arguments and Values:
n                         an integer value.


Description:

PERMUTE-N will return a list of all the permutations of the integers 1 - n.

(permute-n 3)
=> ((1 2 3) (1 3 2) (3 1 2) (2 1 3) (2 3 1) (3 2 1))


Examples:
(permute-n 4)
=> ((1 2 3 4) (1 2 4 3) (1 3 2 4) (1 3 4 2) (1 4 2 3) (1 4 3 2)
    (2 1 3 4) (2 1 4 3) (2 3 1 4) (2 3 4 1) (2 4 1 3) (2 4 3 1)
    (3 1 2 4) (3 1 4 2) (3 2 1 4) (3 2 4 1) (3 4 1 2) (3 4 2 1)
    (4 1 2 3) (4 1 3 2) (4 2 1 3) (4 2 3 1) (4 3 1 2) (4 3 2 1))

This can be a valuable tool for creating repetitive textures in an orchestral context. Look at
the differences / similarities with the function PERMUTE.

The integer must be greater than 0:

(permute-n 0)
=> Error: Stack overflow on value stack.

Score Example:
(setf i-3 (permute-n 3))
(setf cl-1 (integer-to-pitch i-3))
(setf cl-1t (pitch-transpose '(1 3 5 6 2 0) cl-1))

(def-score c-duo
             (:key-signature 'chromatic
              :time-signature '(3 8)
              :tempo 120)

    (clarinet :length (span cl-1t '(1/8)) :pitch cl-1t :velocity '(f)
              :channel 1 :sound 'gm :program 'clarinet)

    (drone :length '(18/8) :pitch '(c3) :velocity '(p) :channel 2))
