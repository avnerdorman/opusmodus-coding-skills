Opusmodus                                                                         create-library   1

create-library library-name section-name index-name lists
                          &key file note new-index

[Function]

Arguments and Values:
library-name             a library name.
section-name             a library section name.
index-name               an index name.
lists                    a lists.
file                     a string. (name of the le).
note                     a string. (annotation).


Description:

The CREATE-LIBRARY function is an essential tool in the use and establishment of library-
based material. Accessing libraries open up a new set of possibilities for the composer using
Opusmodus. It can prove a very powerful tool not just as somewhere to store material but a
location from which data can be 'called' from within an active program. Libraries can quickly
become a valuable resource for composers able to store rhythmic patterns, scales and
melodic sequences, interval and chord sets. These might include Nicholas Slonimsky's
Thesaurus, Messiaen's library of non-retrogradable rhythms and the Harmony Book by
Elliott Carter. Equally, a library might be a repository of Traditional World Music rhythms or
those algorithmically-devised tonalities often found in the scores of Nigel Morgan, Rolf
Wallin and Magnus Lindberg.




                         A extract from The Harmony Book by Elliott Carter



The function CREATE-LIBRARY is used to establish a library presence. First we must
assemble the library material. This can be done from copying an existing list of data as in the
library entry for the Slonimsky Thesaurus. Notice each item must have an identi er, a
variable pre x, so that it can be located when called by the library function.
      fi
                                       fi
                                                                             fi
Opusmodus                                                                  create-library      2

(def-library slonimsky
    (:section tritone
              s1u '(c4 cs4 fs4 g4)
              s1d '(c5 g4 fs4 cs4)
              s2u '(c4 d4 fs4 gs4)
              s2d '(c5 gs4 fs4 d4)
              s3u '(c4 e4 fs4 as4)
              s3d '(c5 as4 fs4 e4)
              s4u '(c4 f4 fs4 b4)
              s4d '(c5 b4 fs4 f4)
              ...))

Sometimes it's possible, as in the 4-bit-binary le example below, a library can be generated
algorithmically. The function COMBINATION2 is able to generate all the 4-bit binary
instances of the pattern '(1 0 1 0).

(combination2 4 '(1 0 1 0))
=> ((0 0 0 0) (1 0 0 0) (0 1 0 0) (1 1 0 0) (0 0 1 0) (1 0 1 0)
    (0 1 1 0) (1 1 1 0) (0 0 0 1) (1 0 0 1) (0 1 0 1) (1 1 0 1)
    (0 0 1 1) (1 0 1 1) (0 1 1 1) (1 1 1 1))

That's ne. We could paste the print out from the LISTENER and attach identifying names as
in the Slonimksy le above. However, it is possible to assemble a library and its identi ers
using the function CREATE-LIBRARY.

(create-library 'Binary-Rhythmics '4-bit-binary 'bin
                (combination2 4 '(1 0 1 0)))

The print out in the LISTENER is as follows:

=> (def-library binary-rhythmics
      (:section 4-bit-binary
                bin0 '(0 0 0 0)
                bin1 '(1 0 0 0)
                bin2 '(0 1 0 0)
                bin3 '(1 1 0 0)
                bin4 '(0 0 1 0)
                bin5 '(1 0 1 0)
                bin6 '(0 1 1 0)
                bin7 '(1 1 1 0)
                bin8 '(0 0 0 1)
                bin9 '(1 0 0 1)
                bin10 '(0 1 0 1)
                bin11 '(1 1 0 1)
                bin12 '(0 0 1 1)
                bin13 '(1 0 1 1)
                bin14 '(0 1 1 1)
                bin15 '(1 1 1 1)
      ))
fi
            fi
                                       fi
                                                                               fi
Opusmodus                                                                    create-library      3

Now, simply paste the LISTENER output into a SCORE-FILE and evaluate it. Then, test it
with this expression using the function library.

Another option we have is to save the library output as a le directly into the DEF-LIBRARY
directory. To do that we use the :file keyword. The :file name must be a string "name-
of-the- le".

(create-library 'Binary-Rhythmics '4-bit-binary 'bin
                (combination2 4 '(1 0 1 0))
                :file "4-bit-library")

We also can add an annotation (e.g. explanation or comment) by using the :note keyword:

(create-library 'Binary-Rhythmics '4-bit-binary 'bin
                (combination2 4 '(1 0 1 0))
                :file "4-bit-library"
                :note "Library explanation or comment")

The next time we open the application the le will load at the start and will be ready for use.

We can call a collection of these patterns using the function library and use the keyword
argument :random like this:

(setf c-rhy (library 'binary-rhythmics
                     '4-bit-binary nil :random 10))
=> ((1 0 0 1) (0 0 0 0) (0 1 0 1)
      (1 0 0 0) (1 0 0 1) (1 0 0 0)
      (0 0 1 0) (0 1 0 1) (1 0 1 1)
      (0 0 1 1))

Another option allows an integer list to determine which entries in the library list can be
collected together in a set order.

(setf template '(11 12 7 9 15 13 12 4 2 6))
(setf lh-rhy (library 'binary-rhythmics
                      '4-bit-binary nil :collect template))

Random selection can be further enhanced and extended with the argument :repeat. For
some library material the argument :transpose may also be relevant.

(setf c-rhy1 (library 'binary-rhythmics '4-bit-binary nil
                      :repeat 2 :random 10 :seed 67))
=> ((1 1 1 0) (1 0 0 1) (1 1 1 1) (1 0 1 1)
    (0 0 1 1) (1 1 0 0) (0 1 0 0) (0 1 1 0)
    (1 0 0 1) (0 0 1 0) (1 1 1 0) (1 0 0 1)
    (1 1 1 1) (1 0 1 1) (0 0 1 1) (1 1 0 0)
    (0 1 0 0) (0 1 1 0) (1 0 0 1) (0 0 1 0))
fi
                                     fi
                                                    fi
Opusmodus                                                               create-library   4

In the examples below there is further opportunity to see how a library le can be
established. This time the source is a Euclidean binary rhythm. See GEN-BINARY-
EUCLIDEAN.


Examples:
(create-library 'euclidean-rhythmics 'mpre-ashanti 'er
                (gen-binary-euclidean 10 12 3 7 0))

=> (def-library euclidean-rhythmics
               (:section mpre-ashanti
                         er0 '(1 0 0 1 0 0 1 0 0 1 0 0)
                         er1 '(1 0 0 0 1 0 0 0 1 0 0 0)
                         er2 '(1 0 0 1 0 0 1 0 0 1 0 0)
                         er3 '(1 0 1 1 0 1 0 1 1 0 1 0)
                         er4 '(1 0 1 0 1 0 1 0 1 0 1 0)
                         er5 '(1 0 0 0 1 0 0 0 1 0 0 0)
                         er6 '(1 0 0 1 0 0 1 0 0 1 0 0)
                         er7 '(1 0 1 0 1 0 1 0 1 0 1 0)
                         er8 '(1 0 1 0 1 0 1 0 1 0 1 0)
                         er9 '(1 0 1 0 1 0 1 0 1 0 1 0)
                         ))

(library 'euclidean-rhythmics 'mpre-ashanti 'er6)
=> (1 0 0 1 0 0 1 0 0 1 0 0)

(library 'euclidean-rhythmics 'mpre-ashanti nil :random 10)
=> ((1 0 1 0 1 0 1 0 1 0 1 0)
    (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 1 0 1 0 1 0 1 0 1 0)
    (1 0 0 0 1 0 0 0 1 0 0 0)
    (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 1 0 1 0 1 0 1 0 1 0)
    (1 0 0 0 1 0 0 0 1 0 0 0))
                                                              fi
