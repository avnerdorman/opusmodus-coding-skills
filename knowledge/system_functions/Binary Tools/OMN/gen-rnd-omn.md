     Opusmodus                                                                              gen-rnd-omn     1

     gen-rnd-omn count level low high pitch length velocity
                         &key type variant rotate prob seed

     [Function]

     Arguments and Values:
     count                     an integer (number of return lists).
     level                     an integer or list of integers. (unit size).
     low                       an integer.
     high                      an integer.
     pitch                     list of pitches.
     length                    length symbol or list of lengths.
     velocity                  NIL or list of velocities.
     type                      length type: 1 (regular), 2 (extended), 3 (complex) and '? (at random).
                               The default is 1.
     variant                   'p (prime), 'r (retrograde), 'i (inversion), 'ri (retrograde-inversion)
                               and '? (at random).
     rotate                    an integer or list. The default is 0 (no rotation).
     prob                      Optional parameter with a default value of 0.5. This is a oating-point
                               number ranging between 0.0 and 1.0, which affects the distribution
                               of the generated random number within the speci ed range. A lower value for
                               this parameter increases the likelihood of selecting a lower number within
                               the given range, while a higher value favours the selection of higher numbers.
     seed                      This is an integer that guarantees consistent results each time the code is
                               evaluated. By providing a speci c seed, you can ensure that the randomness in
                               your code is reproducible. The default value for seed is NIL, which means the
                               seed is not set, resulting in different outputs on each run due to natural
                               randomness.


     Description:

     The function GEN-RND-OMN generates a random list of binaries and uses the binary list
     process to effect the operation. It can make n lists of any level (size) and control the
     balance of 1 and 0 with low and high arguments. The :variant option can process a
     sequence of common variant forms on lists of binary values. In the context of a ltering
     process this makes for very ne control over the random ordering of the binary-controlled
      lter.

     (gen-binary-rnd 3 8 1 3)
     => ((0 1 1 1 0 0 0 1) (1 1 1 0 1 0 0 0) (0 1 1 1 0 0 0 1))

     (setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4)))
     => (c4 gs4 fs4 d4 e4 fs4 gs4 c4 gs4 fs4
         e4 fs4 d4 fs4 fs4 fs4 fs4 gs4 c4 gs4)
fi
                          fi
                                                       fi
                                                                        fi
                                                                                 fl
                                                                                      fi
Opusmodus                                                                      gen-rnd-omn     2

A random :seed may be given:

(gen-rnd-omn 3 8 1 3 mat 's nil)
=> ((s c4 gs4 fs4 -e. s gs4 c4)
    (-e s e4 fs4 d4 -e.)
    (s fs4 gs4 c4 -e. s fs4 d4))


If a single list is required then append the function FLATTEN to the head of the expression:

(flatten (gen-rnd-omn 3 8 1 3 mat 's nil)
=> (s c4 gs4 fs4 -e. s gs4 c4 -e s e4 fs4 d4
    -e. s fs4 gs4 c4 -e. s fs4 d4)

One further feature of this function lies in the use of the keyword :variant - a binary list
can be inverted (1 0 0 1 1 0) can become (0 1 1 0 0 1). The possibility of four
outcomes can be realised giving the composer a further possibility of variation. The
variant functions include prime 'p, retrograde 'r, inversion 'i, retrograde inversion
'ri and '? at random.

(gen-rnd-omn 3 8 1 3 mat 's nil :variant 'i)
=> ((s c4 -e. s e4 fs4 gs4 -)
    (-e. s fs4 - fs4 fs4 fs4)
    (s fs4 -e. s c4 -e.))


Examples:

Here are further examples to highlight the element of control this function has:

(gen-rnd-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
             :rotate '(-1 2 0 1))
Opusmodus                                         gen-rnd-omn   3

(gen-rnd-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
             :rotate '(-1 2 0 1) :type 2)




(gen-rnd-omn 8 '(8 8 12 4) 2 4 mat 's '(p mp f)
             :rotate '(-1 2 0 1) :type 3)
Opusmodus                                       gen-rnd-omn   4

(omn-to-time-signature
 (gen-rnd-omn
  10 13 1 7
  (vector-to-pitch '(g3 g6) (gen-noise 64))
  (vector-to-length 's 1 2 (gen-noise 64))
  (vector-to-velocity 'mp 'ff (gen-noise 64))
  :type 2)
 '(4 4))
Opusmodus                                       gen-rnd-omn   5

(omn-to-time-signature
 (gen-rnd-omn
  10 13 1 7
  (vector-to-pitch '(g3 g6) (gen-noise 64))
  (vector-to-length 's 1 2 (gen-noise 64))
  (vector-to-velocity 'mp 'ff (gen-noise 64))
  :type 3)
 '(4 4))
Opusmodus                                       gen-rnd-omn   6

(gen-rnd-omn
 10 '(12 8 8 7 9) 1 5
  (vector-to-pitch '(g3 g6) (gen-noise 64))
  (vector-to-length 's 1 2 (gen-noise 64))
  (vector-to-velocity 'mp 'ff (gen-noise 64))
 :type 3 :variant '?)
