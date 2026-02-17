     Opusmodus                                                                          add-interval-omn          1

     add-interval-omn range intervals sequence &key section exclude
     [Function]

     Arguments and Values:
     range                    (list): A list of two duration values (min, max) specifying the minimum and
                              maximum length of pitches to which intervals will be added. Durations outside
                              this range are not modi ed.

     intervals                (list): A list of integers representing musical intervals to be added to the pitches
                              within the speci ed range.

     sequence                 (list): A list representing an OMN (Opusmodus Notation) formatted
                              sequence to be processed.

     section                  (integer or list of integers, optional): Speci es the sections of the sequence to
                              be processed. If not provided, the function applies to the entire sequence.

     exclude                  (integer or list of integers, optional): Speci es the sections of the sequence that
                              should be excluded from processing. If not speci ed, no sections are excluded.


     Description:

     The ADD-INTERVAL-OMN function processes an OMN-formatted sequence by adding
     speci ed intervals to pitches within a de ned duration range. This operation allows for
     harmonic and melodic development by intervallic enhancement. The function can selectively
     process or exclude speci c sections of the sequence, providing exibility in composition and
     arrangement.


     Examples:

     Adding intervals (6 13 11) to pitches within durations q (quarter) to h (half):

     (add-interval-omn '(q h) '(6 13 11) '(e c4 mf d4 e4 f4 q a4 p b4))
     => (e c4 mf d4 e4 f4 q a4eb5 p b4c6)

     Adding intervals (6 13 11) to pitches within durations e (8th) to h (half):

     (add-interval-omn '(e h) '(6 13 11) '(e c4 mf d4 e4 f4 q a4 p b4))
     => (e c4fs4 mf d4eb5 e4eb5 f4b4 q a4bb5 p b4bb5)
fi
                      fi
                                      fi
                                           fi
                                                fi
                                                                   fi
                                                                   fi
                                                                        fl
                                                                             fi
Opusmodus                                                      add-interval-omn        2

(setf omn '((e fs4 f cs4 s c4 mf gs4 fs4 g4)
            (h g4 mp q c4 p g4)
            (-e gs4 mf fs4 s gs4 fs4 c4 g4)
            (h gs4 p gs4)))

                      2             3                  4




                                                                           Opusmodus




(add-interval-omn '((e h) (e e) (e h)) '(1 2 3 4 5 6) omn)

                          2              3                 4




                                                                           Opusmodus




(add-interval-omn '(e h) '(((13 13) 6 2) (6 13) (11 13)) omn)



                      2              3                 4




                                                                           Opusmodus
