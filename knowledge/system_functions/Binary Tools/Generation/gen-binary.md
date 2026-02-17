Opusmodus                                                                                 gen-binary   1

gen-binary count size &key prob seed
[Function]

Arguments and Values:
count                    an integer (number of return lists).
size                     an integer (list length).
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

The function GEN-BINARY generates binary lists at random. It can make N lists of any
size (length). The vertical alignment of the lists are mapped to one integer 1 only. The
GEN-BINARY function is a very good companion with BINARY-SECTION-MAP.

(gen-binary 4 24)
=> ((0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0)
    (0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 1 0 1 0 1 0 0 1)
    (1 1 0 1 1 1 1 0 0 0 1 1 0 1 0 0 0 1 0 0 0 0 1 0))


Example:

A random :seed may be given:

(gen-binary 4 24 :seed 65)
=> ((0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 1 1 0 0 0)
    (0 0 1 1 0 0 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0 1 0 1)
    (0 1 0 0 1 1 1 0 0 1 0 0 1 0 1 0 0 1 0 0 0 0 1 0)
    (1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0))

To see the function in action please have a look at score ‘Air.opmo’ which you will nd in
the ‘Score Examples/Piano’ section.
                                                 fi
                                                                  fi
                                                                           fl
                                                                                     fi
