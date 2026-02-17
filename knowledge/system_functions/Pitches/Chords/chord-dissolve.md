Opusmodus                                                                       chord-dissolve   1

chord-dissolve count level sequence &key variant segment
                        omit sample seed

[Function]

Arguments and Values:
count                   an integer or list of integers (number of return chords or pitches).
level                   an integer or list of integers (max. dissolved chord size).
sequence                a list or lists of chords or pitches.
variant                 'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                        'a (ascending), 'd (descending), 'ad (ascending-descending),
                        'da (descending-ascending), 'ro (random order) or '? (at random).
                        The default is 'p (prime).
segment                 'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                        'a (ascending), 'd (descending), 'ad (ascending-descending),
                        'da (descending-ascending), 'ro (random order) or '? (at random).
                        The default is 'p (prime).
omit                    list of variants to omit. The default is NIL.
sample                  an integer (number of dissolved chords selected at random).
seed                    an integer. Ensures the same result each time the code is evaluated.
                        The default is NIL.


Description:

This function creates a chord from a list of pitches and dissolves the chord by one pitch
at the time. The process can be controlled by a variant option applied to the sequence rst
- before the dissolve process starts - and can be modi ed by a segment option after the
dissolve process is done.


Examples:

These two examples below illustrate the process clearly.
The count and the level values are equal to the chord size (7).

Ascending:

(chord-dissolve 7 7 '(c4e4gs4b4d5f5a5) :variant 'a)
                                                     fi
                                                                                         fi
Opusmodus                                                                    chord-dissolve      2

Descending:

(chord-dissolve 7 7 '(c4e4gs4b4d5f5a5) :variant 'd)




If the count value is larger then the chord size or pitch count in the list, a reverse process
will start:

(chord-dissolve 13 7 '(c4 e4 gs4 b4 d5 f5 a5) :variant 'a)


                                            2     3          4




(chord-dissolve 13 7 '(c4e4gs4b4d5f5a5) :variant 'd)


                                            2         3          4




In this example we set the level value to 4 which means the dissolve process will stop
on chord size 4:

(chord-dissolve 13 4 '(c4e4gs4b4d5f5a5) :variant 'a)


                                        2          3                 4




                                                                                                 Opusmodu


(chord-dissolve 13 4 '(c4e4gs4b4d5f5a5) :variant 'd)


                  2          3          4




                                                                         Opusmodus
Opusmodus                                                               chord-dissolve    3

Same as above but with an optional variant set to 'i (inversion):

(chord-dissolve 13 4 '(c4e4gs4b4d5f5a5) :variant 'i)

                                2                 3                 4




                                                                           Opusmodus


Adding a segment (variant symbol) value to our expression from above will modify the
output considerably:

(chord-dissolve 13 4 ‘(c4e4gs4b4d5f5a5) :variant 'i :segment 'i)


                                             2




       3                                                        4




                                                                         Opusmodus




More Examples:
(setf chord '(d4 eb4 f4 c4 gb4 ab4))

(chord-dissolve 11 6 chord)
                                        2             3




                                                                                              Opusmod

(chord-dissolve 11 6 chord :variant 'a)


                                       2                  3




                                                                                         Opusmodus
Opusmodus                                                               chord-dissolve   4

(chord-dissolve 11 6 chord :variant 'd)


                                                    2       3




                                                                                              Opusm


(chord-dissolve 11 6 chord :variant 'ad)


                                                2       3




                                                                                             Opusmo


(chord-dissolve 11 6 chord :variant 'da)


                                            2           3




                                                                                              Opusm


(chord-dissolve 11 6 chord :variant 'ri)


                                        2                           3




                                                                                    Opusmodus


(chord-dissolve 11 6 chord :variant 'i)


                                    2                           3




                                                                                     Opusmodus



With an optional segment variant:

(chord-dissolve 11 6 chord :variant 'a :segment 'i)


                                    2                           3
Opusmodus                                                     chord-dissolve   5

(chord-dissolve 11 6 chord :variant 'd :segment 'i)


                                     2        3




                                                                                   Opusmo


(chord-dissolve 11 6 chord :variant 'ad :segment '? :seed 23)


                                 2                3




                                                                        Opusmodus


(chord-dissolve 11 6 chord :variant 'da :segment ‘i)


                                 2        3




                                                                                    Opusm



(chord-dissolve 11 6 chord :variant 'ri :segment ' i)


                                 2                        3




                                                                          Opusmodus


(chord-dissolve 11 6 chord :variant 'i :segment ‘i)


                             2                        3




                                                                                    Opusm
Opusmodus                                                   chord-dissolve       6

Examples with sublists:

(chord-dissolve '(6 6) '(4 3)
                '((eb4 d4 ab4 f4 c4 gb4) (cs4 e4 g4 a4 bb4 b4))
                :variant 'i :segment 'i)


                                             2




(setf chords '((cs4d4fs4c5cs5) (cs4f4b4c5c4) (bb4e5f5f4fs4)             Opusmodus
               (gs4d5eb5eb4e4) (c5fs5g5g4gs4) (a4eb5e5e4f4)
               (bb4b4b3c4e4) (e5f5f4fs4bb4) (eb5eb4e4gs4d5) (g5))


(chord-dissolve '(6 6) '(4 3) chords :variant 'i :segment 'i)


                                     2




  3                       4                       5




  6                                          7




                                         8              8
  8                              9                              10




                                                                     Opusmodus
Opusmodus                                                                                      chord-dissolve         7

The sample option returns a number of segments chosen at random:

(setf gsteps
      (mclist (omn :pitch (library 'standard 'chords ‘Giant-Steps))))

(chord-dissolve 4 4 gsteps :variant 'i :segment 'i :sample 1)



                      2          3   4         5       6        7            8             9             10




       11       12     13                14                15       16                17            18




       19       20          21                22           23       24           25            26




                                                                                                    Opusmodus

OMN:

(setf strawinsky
      '((s d5f5b5 f e5g5c6 e f5a5d6 s g5b5e6 f5a5d6 e5g5c6 d5f5b5)
        (e c5e5a5 c5e5a5 q d5f5b5 marc)
        (s d5f5b5 e5g5c6 f5a5d6 g5b5e6 e f5a5d6 s e5g5c6 d5f5b5)
        (e c5e5a5 c5e5a5 q d5f5b5 marc)))

(chord-dissolve 6 3 strawinsky :variant 'd :segment 'ro)



                       2                           3                     4




                                                                                                                Opusmodus
