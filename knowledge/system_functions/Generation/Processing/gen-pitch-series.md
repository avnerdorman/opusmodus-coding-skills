          Opusmodus                                                                            gen-pitch-series       1

          gen-pitch-series intervals &key root direction repeat seed
          [Function]

          Arguments and Values:
          intervals                    This argument speci es the sequence of intervals to be applied in generating
                                       the pitch sequence. The minimum length of the intervals list is 1. Please note,
                                       in such a case, the palindrome function is not called.
          root                         Speci es the root pitch from which to start generating the sequence.
                                       If not provided, it defaults to 0.
          direction                    Speci es the direction of the transformation to be applied to the interval
                                       sequence. It accepts one of four options: 'a' for ascending, 'd' for descending,
                                       'r' for re ecting the sequence, 'n' for no transformation, and '?' for a random
                                       direction. If not provided, it defaults to 'n' (none).
          repeat                       Speci es how many times to repeat the generated sequence. If not provided,
                                       the sequence is not repeated.
          seed                         This is an integer that guarantees consistent results each time the code is
                                       evaluated. By providing a speci c seed, you can ensure that the randomness in
                                       your code is reproducible. The default value for seed is NIL, which means the
                                       seed is not set, resulting in different outputs on each run due to natural
                                       randomness.


          Description:

          The function GEN-PITCH-SERIES is designed to generate pitch sequences derived from
          speci ed root pitches, intervals, directions, and repetition values. In this
          function, each interval sequence is transformed into a palindrome, re ecting the
          sequence around its middle element for a harmonious balance. The method of transformation
          is controlled by the direction argument, which allows for ascending, descending,
          re ection, or no transformation. The function then converts the transformed interval
          sequences into pitches, starting from the designated root pitch. An optional repeat
          argument permits repetition of the entire sequence for a desired number of times. By
          leveraging these parameters, GEN-PITCH-SERIES offers extensive control and exibility
          for the creation of diverse pitch patterns in musical composition.


          Examples:
          (gen-pitch-series'(1 5))
          => (c4 cs4 fs4 g4)

          This will generate a pitch sequence starting from the default pitch 0, with intervals 1, 5, and
          1 (palindrome) with no transformation applied to the interval sequence.
fl
     fi
                                  fi
                                  fi
                                  fi
                                        fl
                                                    fi
                                                               fi
                                                                                       fl
                                                                                                  fl
Opusmodus                                                                 gen-pitch-series    2

(gen-pitch-series '(1 5) :direction 'd)
=> (c5 b4 fs4 f4)

This will generate a pitch sequence starting from an octave above the root pitch (+ 0 12),
with intervals 1, 5, and 1 (palindrome) and will transform the interval sequence to be strictly
descending.

(gen-pitch-series '(1 2 2 1) :direction 'd)
=> (c5 b4 a4 g4 fs4 e4 d4 cs4)

(gen-pitch-series '(1 2 2 1) :root 6 :direction 'r)
=> (fs4 g4 a4 b4 c5 bb4 gs4 g4)

In the next example the function generates the pitch sequence for each set of parameters
(intervals, root, direction, repeat), then concatenates the results to form the
overall sequence of pitches, which is then assigned to the pitches variable.

Note that each of the optional arguments (root, direction, repeat) must either be
omitted entirely or provided as lists of the same length as the list of intervals. Each
element of the optional arguments corresponds to the sequence of intervals at the same
position in the intervals list.

For example, the rst interval sequence is (4 4), the root is -2, the direction is d
(descending), and the repeat count is 1. This will generate a descending pitch sequence
starting from pitch -2 (which is then raised by an octave to 10 - speci cation for descending
sequences), with intervals 4, 4 and 4 (palindrome), and the sequence will not be repeated.
This generated sequence is the rst part of the overall sequence that is assigned to the
pitches variable. The process is repeated for each set of parameters to generate the full
sequence of pitches.

(setf pitches
      (gen-pitch-series '((4 4) (-5 4 4) (-4 5 5 -4) (-5 4 4)
                          (4 -5) (-3 4 -3) (5 5 -4 -4) (-5 -4 -4 -4 -5))
                        :root '(-2 11 0 -5 0 -1 -7 -8)
                        :direction '(d n d a a d n d)
                        :repeat '(1 1 2 1 1 2 1 2)))

(make-omn :length '(s)
          :pitch pitches
          :span :pitch)
            fi
                         fi
                                                                 fi
Opusmodus                       gen-pitch-series    3

            2           3




        4       5           6




        7           8




                                        Opusmodus
