Opusmodus                                                          rewrite-accidentals   1

rewrite-accidentals sequence &key map
[Function]

Arguments and Values:
sequence              omn list or lists.
map                   :chromatic, :sharp and :flat. The default is NIL (default).



Description:

This function replaces all accidentals to a given map in an omn-form sequence. The
chromatic map will rewrite all pitch accidentals with sharps when the pitch ascends
and with flats when the pitch descends. The sharp map uses sharp accidentals only
and the flat map uses flat accidentals only. The default map is as follows: c cs d
ds e eb f fs g gs a bb b.


Examples:
(setf omn1 '((5q fs4 p - bb3 f3 e4) (-3q g4 c5)
             (s eb5 a5 mf cs6 gs6)
             (5q gs6 pp cs6 mf a5 eb5 -) (-s c5 g4 e4)))

                            5




                                                3




             4


                                5

                                                                       Opusmodus
Opusmodus                                    rewrite-accidentals   2

(rewrite-accidentals omn1 :map :chromatic)

                      5




                                    3




            4


                          5

                                                Opusmodus




(rewrite-accidentals omn1 :map :sharp)

                      5




                                    3




            4


                          5

                                                Opusmodus




(rewrite-accidentals omn1 :map :flat)

                      5




                                    3




            4


                          5

                                                Opusmodus
Opusmodus                                           rewrite-accidentals   3

(setf omn2 '(t bb4 mp cs6 c5 b5 bb4 cs6 a3 gs2 3q a2 gs5 fs4))




                                         3

                                             Opusmodus




(rewrite-accidentals omn2 :map :chromatic)




                                         3

                                             Opusmodus




(rewrite-accidentals omn2 :map :sharp)




                                         3

                                             Opusmodus




(rewrite-accidentals omn2 :map :flat)




                                         3

                                             Opusmodus
Opusmodus                                          rewrite-accidentals   4

(setf omn3 '(s gs3+ g4 eb4+ a3 cs4 eb4 gs4+ g3 fs4+ e4 cs4+ eb4))




                                              Opusmodus




(rewrite-accidentals omn3 :map :chromatic)




                                              Opusmodus




(rewrite-accidentals omn3 :map :sharp)




                                              Opusmodus




(rewrite-accidentals omn3 :map :flat)




                                              Opusmodus
