Opusmodus                                                                       gen-euclidean-omn     1

gen-euclidean-omn count level low high pitch length velocity
                                &key type variant rotate prob seed

[Function]

Arguments and Values:
count                    an integer (number of return lists).
level                    an integer or list of integers. (unit size).
low                      an integer.
high                     an integer.
pitch                    list of pitches.
length                   length symbol or list of lengths.
velocity                 NIL or list of velocities.
type                     length type: 1 (regular), 2 (extended), 3 (complex) and '? (at random).
                         The default is 1.
variant                  'p (prime), 'r (retrograde), 'i (inversion), 'ri (retrograde-inversion)
                         and '? (at random).
rotate                   an integer or list. The default is 0 (no rotation).
prob                     Optional parameter with a default value of 0.5. This is a oating-point
                         number ranging between 0.0 and 1.0, which affects the distribution
                         of the generated random number within the speci ed range. A lower value for
                         this parameter increases the likelihood of selecting a lower number within
                         the given range, while a higher value favours the selection of higher numbers.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.


Description:

This function is based on the Euclidean algorithm. This computes the greatest common
divisor of two given integers. It has been demonstrated that the structure of this algorithm
can generate a large family of ostinato-like rhythms. The unique feature of such ostinatos is
the even distribution of their patterns.

In Traditional World Music a common method for representing musical rhythms is as a
binary sequence, sometimes known as 'beat / space'. In the literature of ethnomusicology the
usual representation of the beat/space is "x" and ".". In OPUSMODUS we shall use 1 and 0.
So a rhythm such as E(5,13=[x . . x . x . . x . x . . ] would look like this '(1 0 0 1 0 1 0
0 1 0 1 0 0). This rhythm is a cyclic rhythm with a time span of 13 units.

(gen-binary-euclidean 1 13 5 5)
=> (1 0 0 1 0 1 0 0 1 0 1 0 0)
                                                 fi
                                                                  fi
                                                                           fl
Opusmodus                                                               gen-euclidean-omn      2

The function GEN-EUCLIDEAN-OMN uses the binary mechanism described above to
produce a binary list from which the ltering process works.

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 89))
=> (c4 gs4 fs4 d4 e4 fs4 gs4 c4 gs4 fs4
    e4 fs4 d4 fs4 fs4 fs4 fs4 gs4 c4 gs4)

A random seed may be given:

(gen-euclidean-omn 3 8 1 3 mat 's nil :seed 89)
=> ((s c4 -e. s e4 -e.) (s gs4 -q..) (s fs4 -e. s c4 -e.))

If a single list is required then append the function FLATTEN to the head of the expression.

(flatten (gen-euclidean-omn 3 8 1 7 mat 's nil :seed 46))
=> (s e4 -e. s e4 -e. s fs4 - c4 d4 e4 - gs4 d4 s gs4 - c4 - e4 - fs4 -)

One further feature of this function lies in the use of the keyword :variant - a binary list
can be inverted (1 0 0 1 1 0) can become (0 1 1 0 0 1). The possibility of four
outcomes can be realised giving the composer a further possibility of variation. The
variant functions include prime 'p, retrograde 'r, inversion 'i, retrograde inversion
'ri and '? at random.

(gen-euclidean-omn 3 8 1 7 mat 's nil :variant 'i :seed 46)
=> ((-s gs4 fs4 d4 - fs4 gs4 c4)
    (-s fs4 e4 - d4 fs4 - fs4)
    (-s gs4 c4 gs4 - gs4 fs4 d4))
                              fi
Opusmodus                                                                gen-euclidean-omn   3

Examples:

Here are further examples to highlight the element of control this function has:

(gen-euclidean-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
                   :rotate '(-1 2 0 1) :seed 457)




(gen-euclidean-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
                   :rotate '(-1 2 0 1) :type 2 :seed 457)
Opusmodus                                                gen-euclidean-omn   4

(gen-euclidean-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
                   :rotate '(-1 2 0 1) :type 3 :seed 457)




(omn-to-time-signature
 (gen-euclidean-omn
  10 13 1 7
  (vector-to-pitch '(g3 g6) (gen-noise 64 :seed 26))
  (vector-to-length 's 1 2 (gen-noise 64 :seed 45))
  (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 56))
  :type 2 :rotate '(-1 2 0 1) :seed 34)
 '(4 4))
Opusmodus                                                gen-euclidean-omn   5

(omn-to-time-signature
 (gen-euclidean-omn
  10 13 1 7
  (vector-to-pitch '(g3 g6) (gen-noise 64 :seed 26))
  (vector-to-length 's 1 2 (gen-noise 64 :seed 45))
  (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 56))
  :type 3 :rotate '(-1 2 0 1) :seed 34)
 '(4 4))
Opusmodus                                               gen-euclidean-omn   6

(gen-euclidean-omn
 10 '(12 8 8 7 9) 1 5
 (vector-to-pitch '(g3 g6) (gen-noise 64 :seed 26))
 (vector-to-length 's 1 2 (gen-noise 64 :seed 45))
 (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 56))
 :type 3 :rotate '(-1 2 0 1) :variant '? :seed 34)
