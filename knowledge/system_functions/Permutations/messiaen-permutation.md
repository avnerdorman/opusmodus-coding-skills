Opusmodus                                                                  messiaen-permutation         1

messiaen-permutation sequence &key type
[Function]

Arguments and Values:
sequence                 A list of integers, pitches, or an OMN (Opusmodus Notation) form sequence.

type                     (optional): Speci es the permutation method. It can be:
                         :open: Applies the open fan permutation technique.
                         :closed: Applies the closed fan permutation technique.
                         A list of integers: Speci es the order for a custom symmetrical permutation.
                         Default: NIL (primary permutation technique).


Description:

The MESSIAEN-PERMUTATION function applies various permutation techniques inspired
by Olivier Messiaen’s compositional methods. These techniques manipulate a sequence
(whether a list of integers, pitches, or an OMN sequence) in different ways depending on the
provided type argument.

• Primary Permutation (Default): When type is not provided, the primary permutation
  algorithm is applied, which rearranges the sequence in a speci c, non-repeating order until
  the original sequence is restored.

• Open Fan Permutation (:open): This method reorders the sequence using an “open
  fan” approach, which requires the sequence to have an even number of elements. The
  sequence is split into two halves, and the elements are interleaved from the two ends
  inward.

• Closed Fan Permutation (:closed): Similar to the open fan, but the sequence is split
  and then interleaved from the centre outwards, forming a “closed” pattern. Like the open
  fan, the sequence length must be even.

• Symmetrical Permutation (List of Integers): When type is a list of integers, these
  integers act as indices into the sequence, dictating a custom order for rearranging the
  sequence. The algorithm will permute the sequence in this speci ed order, repeatedly
  applying the same order until the original sequence is restored. The provided order
  must include integers between 0 and length: (1- (length sequence)), with no
  duplicates.
                                  fi
                                         fi
                                                           fi
                                                                    fi
Opusmodus                                                        messiaen-permutation   2

(setf sequence '(c4 db4 d4))

(messiaen-permutation sequence)
=> (db4 d4 c4 d4 c4 db4 c4 db4 d4)

For generating a random order, you can use the following:

(setf order (rnd-order
             (loop for i to (1- (length sequence))
                   collect i)))


Examples:

Examples with Numbers

Primary Permutation:

(setf numbers (rnd-order (gen-integer 0 11) :seed 26))
=> (5 9 2 11 3 6 8 1 0 7 10 4)

(messiaen-permutation numbers)
=> A sequence of numbers permuted using the primary permutation technique.


       11

       10

        9

        8

        7

        6

        5

        4

        3

        2

        1

        0
                     20          40          60             80     100         120
Opusmodus                                                         messiaen-permutation    3

Open Fan Permutation:

(messiaen-permutation numbers :type :open)
=> Numbers permuted using the open fan technique, suitable for even-length sequences.


       11

       10

       9

       8

       7

       6

       5

       4

       3

       2

        1

       0
                    20          40          60           80         100         120



Closed Fan Permutation:

(messiaen-permutation numbers :type :closed)
=> Numbers permuted using the closed fan technique, suitable for even-length sequences.


       11

       10

       9

       8

       7

       6

       5

       4

       3

       2

        1

       0
                    20          40          60           80         100         120




Random Order for Symmetrical Permutation:

(setf order1 (rnd-order (gen-integer 0 (1- (length numbers))) :seed 34))
=> (3 11 2 6 9 4 1 7 10 8 0 5)
Opusmodus                                                           messiaen-permutation   4

(messiaen-permutation numbers :type order1)
=> Numbers permuted according to the custom order provided.


       11

       10

       9

       8

        7

       6

       5

       4

       3

       2

        1

       0
                      20         40           60           80         100         120



Consecutive Numbers Permutation:

(setf order2 (gen-integer 0 (1- (length numbers))))
=> (0 1 2 3 4 5 6 7 8 9 10 11)

(messiaen-permutation numbers :type order2)
=> Numbers permuted in their natural order, demonstrating the idempotent nature of the
   permutation.

       11

       10

       9

       8

        7

       6

       5

       4

       3

       2

        1

       0
                  1    2     3        4   5        6   7        8     9     10    11
Opusmodus                                                                                                              messiaen-permutation                               5

Examples with Pitches

Random Pitch Sequence:

(setf pitches (rnd-row :type :pitch :seed 62))
=> (c4 gs4 e4 b4 bb4 eb4 a4 cs4 g4 d4 fs4 f4)

(messiaen-permutation pitches)
=> A permuted sequence of pitches using the primary permutation.

                             2                           3                  4         5              6            7         8                        9




     10             11                           12                    13       14                  15            16            17                       18




     19                               20                     21                           22                 23                            24




     25                                    26                     27                      28                 29                      30




                                                                                                                                                              Opusmodus




Open Fan Permutation with Pitches:

(messiaen-permutation pitches :type :open)
=> Pitches permuted using the open fan technique.

                         2                           3                      4   5                        6        7             8                        9




     10        11                               12                13                 14              15           16   17                       18




     19                               20                               21                      22                 23                      24




     25                          26                                    27                      28            29                      30




                                                                                                                                                              Opusmodus
Opusmodus                                                                                                      messiaen-permutation                          6

Closed Fan Permutation with Pitches:

(messiaen-permutation pitches :type :closed)
=> Pitches permuted using the closed fan technique.

                       2                   3             4          5                        6             7        8                  9




     10                11                           12         13   14                  15             16       17                          18




     19                          20                           21               22                      23                    24




     25                           26                          27          28                     29                     30




                                                                                                                                                 Opusmodus




Custom Order Permutation with Pitches:

(setf order3 (rnd-order
              (loop for i to (1- (length pitches))
                    collect i)
             :seed 34))
=> (3 11 2 6 9 4 1 7 10 8 0 5)

(messiaen-permutation pitches :type order3)
=> Pitches permuted according to the custom order.

              2                        3                 4          5               6                  7            8                        9




     10           11                           12         13        14              15                16       17                      18




     19                     20                           21               22                          23                          24




     25                      26                           27             28                       29                    30




                                                                                                                                                 Opusmodus
Opusmodus                                                                                                messiaen-permutation        7

Examples with OMN Sequence

(setf omn (make-omn :pitch pitches :length '(s e q) :span :pitch))
=> (s c4 mf e gs4 q e4 s b4 e bb4 q eb4 s a4 e cs4 q g4 s d4 e fs4 q f4)

(messiaen-permutation omn)
=> An OMN sequence permuted using the primary permutation.

                                             2                                              3




     4                     5                                        6                                           7




     8                 9                             10                      11                           12




     13                                 14                                        15




     16                                               17                                                   18




                                                                                                                         Opusmodus




(messiaen-permutation omn :type :open)
=> OMN sequence permuted using the open fan technique.

                                                 2                                              3




     4                         5                           6                                7




     8                              9                          10                                   11




     12                                 13                                             14




     15                        16                                       17                                          18




                                                                                                                         Opusmodus
Opusmodus                                                                                                   messiaen-permutation      8

(messiaen-permutation omn :type :closed)
=> OMN sequence permuted using the closed fan technique.

                                 2                                          3                                        4




     5                   6                                    7                                         8




     9              10                                   11                                        12




     13                              14                                                  15




     16                                             17                                                          18




                                                                                                                          Opusmodus




Custom Order Permutation with OMN Sequence:

(setf order4 (rnd-order
              (loop for i to (1- (length (omn :pitch omn)))
                    collect i)
             :seed 21))
=> (2 4 6 9 5 7 10 3 11 1 0 8)

(messiaen-permutation omn :type order4)
=> OMN sequence permuted according to the custom order.

                                     2                                          3




     4                   5                                         6                                        7




     8                       9                                         10                                       11




     12                  13                                   14                                   15




     16                                        17                                             18




     19                                   20                                        21




                                                                                                                          Opusmodus
Opusmodus                                                                                            messiaen-permutation      9

Examples with Rhythm Permutation

(setf rhy '(w h q e s t))
=> A basic rhythm sequence.

(messiaen-permutation rhy)
=> Rhythm sequence permuted using the primary permutation.

                                2                 3                        4                            5




     6                 7                                           8                                     9




     10                                      11                                 12



                                                                                                                   Opusmodus




(messiaen-permutation rhy :type :open)
=> Rhythm sequence permuted using the open fan technique.

                                    2                 3                                      4               5




     6                                        7                        8                         9




     10                                 11                                 12



                                                                                                                   Opusmodus




(messiaen-permutation rhy :type :closed)
=> Rhythm sequence permuted using the closed fan technique.

                 2                                        3                          4                   5




     6                 7                          8                                      9




     10                    11                                 12



                                                                                                                   Opusmodus




(setf order5 (rnd-order
              (loop for i to (1- (length rhy))
                    collect i)
              :seed 74))
=> (2 5 0 1 3 4)
Opusmodus                                                                                                     messiaen-permutation                       10

(messiaen-permutation rhy :type order5)
=> Rhythm sequence permuted according to the custom order.

                              2                                       3                     4




  5                       6                                       7                     8



                                                                                                                                 Opusmodus




Example with Divided Sequence

(setf dseq (gen-divide 3 (integer-to-pitch (gen-integer 1 24))))
=> ((cs4 d4 eb4) (e4 f4 fs4) (g4 gs4 a4) (bb4 b4 c5)
    (cs5 d5 eb5) (e5 f5 fs5) (g5 gs5 a5) (bb5 b5 c6))

(messiaen-permutation dseq)
=> Divided sequence permuted using the primary permutation.

                2                 3             4             5                6                     7             8        9




      10        11                    12            13                    14                    15            16            17




      18             19                    20            21                        22                    23            24




                                                                                                                                             Opusmodus
