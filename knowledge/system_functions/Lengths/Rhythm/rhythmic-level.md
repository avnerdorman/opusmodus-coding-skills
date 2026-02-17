Opusmodus                                                                               rhythmic-level       1

rhythmic-level level numerator span &key quantize
[Function]

Arguments and Values:
level                    an integer or a list of integers (successive divisions).
numerator                a list of integers (proportion values).
span                     an integer or a list of integers (overall duration).
quantize                 a list of integers (tuplet numbers).
                         The default tuplets group (1 2 3 4 5 6 7 8).


Description:

This function returns a list of rhythmic levels derived from a span (overall duration) and
its division, according to given proportions (numerator). Each successive level uses the
result of the previous level and is divided by using the same proportion values. No
more than four levels (0 1 2 3) are recommended, any additional rhythmic level
becomes very small and undifferentiated, so we lose the sense of the initial proportions. This
method has been described in Pierre Boulez Éventuellement, in Relevés d’apprenti, Aux
Editions du Seuil, Paris, 1966.


Examples:

In the next two examples each resulting bar (staff) represents a rhythmic level: 0, 1, 2 and
3.

(rhythmic-level '(0 1 2 3) '(2 4) 2)
=> ((h_3h 3q_wq)                            ; level 0
    (e.. qt_3h 3q_q_7h. 7w_h.)              ; level 1
    (7h 7w 7q_e e_3h 3q_s e._7h. 7w_et hs.) ; level 2
    (7q 7q 7q 7h. 7q_t s. s. t_7wq 7q 7q_7h ; level 3
     7h. 7h_e s. t_3h 3q_7h. 7w_q))

                  3                                                     3                7




  3          7                           3                          7




                                             7                                      3        7
  4          7                                           7




                                                                                                 Opusmodus
Opusmodus                                                                    rhythmic-level        2

(rhythmic-level '(0 1 2 3) '(3 5) 4)




 3              3                            3           5




 4    3     3                        3               5       7                     7




                                                                                       Opusmodus




In this example we de ne each level to different proportion values and span values:

(rhythmic-level
 (rnd-sample 8 '(0 1 2 3))
 (rnd-sample 8 '((3 4) (2 3) (1 3) (2 4)))
 (rnd-sample 8 '(w h q)))


            7                3   5                                   7         3




 4                                                               7                     7




 7                  7                    7       7                       5




                                                                                       Opusmodus
                        fi
Opusmodus                                                                rhythmic-level        3

Below we generate randomly a group of quantize lists, each one for every level:

(rhythmic-level
 (rnd-sample 24 '(0 1 2))
 (rnd-sample 24 '((3 4) (2 3) (1 3) (2 4) (2 4) (3 5)))
 (rnd-sample 24 '(w h q))
 :quantize (rnd-sample 24 '((1 2 3 4 8) (1 2 4 5) (1 2 4 5 7))))

            5                                        5           5             5




 7              5       5           5                                5             5




                            7       7                                    5
 12                 7                                        5                         5




 17    3                        7           7            5




 21                                     5




                                                                                   Opusmodus
