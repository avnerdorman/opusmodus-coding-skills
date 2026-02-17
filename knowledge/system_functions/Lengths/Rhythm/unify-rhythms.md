Opusmodus                                                              unify-rhythms   1

unify-rhythms &rest lists
[Function]

Arguments and Values:
lists                  omn or length lists.


Description:

The UNIFY-RHYTHMS function merges a list of sequences with different lengths into a
single uni ed length sequence.


Examples:
(setf l1 '(q e e 3q 3q 3q -e. s))
(setf l2 '(e e e. s -e e s -s s -s))

(list l1 l2) ; select and press cmd-2

                                                  3




(unify-rhythms l1 l2)

                                              3       3
   fi
Opusmodus                                                                                  unify-rhythms         2

(setf r1 (rhythm-series 6 5 3/8 :length '(q. e. e s 3q)))
(setf r2 (rhythm-series 6 4 1/2 :length '(q. e. e s 3q)))
(setf r3 (rhythm-series 6 3 1/2 :length '(q. e. e s 3q)))

(list r1 r2 r3) ; select and press cmd-2

                               2   3               3       3       3               4




      5
                               6   3           3               3       7               8




                                                       3                       3




                                                                                                     Opusmodus




Now we merge all three voices to form a single entity:

(unify-rhythms r1 r2 r3)

                           3           3   3                                                          3
                                                                       2




            3     3            3                                           3
  3


                                                                                                     Opusmodus
