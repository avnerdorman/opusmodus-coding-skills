Opusmodus                                                                            pause-series      1

pause-series n sequence
[Function]

Arguments and Values:
n                           an integer (maximum number of empty bars in a series).
sequence                    omn sequence.


Description:

This function removes a series of empty bars when lager then a given n (number).


Examples:
(setf omn '((h b5 pp f6) (-w) (-w) (q cs6 p - b5)
            (-q. s cs6 mp b5 e gs5 -q.)
            (-e b5 mp gs5 b5 -h) (-w) (-w) (q c6 f - cs6)
            (-q s e6 ff e g5 s fs6 -q s fs6 b5 e6 g5)
            (-w) (-w) (-w)))


                        2         3       4                      5




   6                                          7          8           9




   10                                                                11       12      13




                                                                                           Opusmodus
Opusmodus                                              pause-series    2

(pause-series 1 omn)


                       2               3           4




   5                       6           7   8               9




                                                           Opusmodus




(pause-series 0 omn)


                               2               3




   4                               5       6




                                                           Opusmodus
