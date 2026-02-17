Opusmodus                                                                             chord-derive   1

chord-derive sequence &key level chord variant omit start seed
[Function]

Arguments and Values:
sequence                   a list of pitches or chords.
level                      an integer or list of integers.
chord                      T ot NIL. The default is NIL.
variant                    'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                           'a (ascending), 'd (descending), 'ad (ascending-descending),
                           'da (descending-ascending), 'ro (random order) or '? (at random).
omit                       a list or variant symbols to omit when '? (at random) is de ned.
start                      a list of integers or pitches. (transposition).
seed                       an integer. Ensures the same result each time the code is evaluated.
               The default is NIL.


Description:

This function returns a chord series (levels) by: 1) rotating the given chord with an
interval taken form the difference between the rst and the last pitch and, 2) transposing each
rotation to the rst chord pitch. This method was developed by Pierre Boulez and was used
in his composition Derive.


Examples:

When the :level is not de ned, the function will return all possible :levels to the given
sequence or :chord:

(setf sequence '(eb4 a4 c5 b4 e5 d5))




                                                               Opusmodus
         fi
                      fi
                                           fi
                                                                             fi
Opusmodus                                                     chord-derive    2

(chord-derive sequence)
=> ((eb4 a4 c5 b4 e5 d5)     ; level 0
    (eb4 fs4 f4 bb4 gs4 a3) ; level 1
    (eb4 d4 g4 f4 fs3 c4)    ; level 2
    (eb4 gs4 fs4 g3 cs4 e4) ; level 3
    (eb4 cs4 d3 gs3 b3 bb3)) ; level 4


                             2                   3




            4                                5




                                                             Opusmodus




(chord-derive sequence :level '(1 2))


                                         2




                                                                         Opusmodus


(chord-derive sequence :level '(0 1 2 3 2 1))


                         2                           3




   4                             5                       6




                                                                  Opusmodus
Opusmodus                                                   chord-derive   3

(chord-derive '(eb4a4c5b4e5d5)
              :level '(0 1 2 3 2 1)
              :variant '(p r i ri p i))


                              2                   3




            4             5                   6




                                                          Opusmodus


(chord-derive '(eb4a4c5b4e5d5) :level '(2 3 1 2 0 1) :chord t)




                                                                      Opusmodus



(chord-derive '((gs3 c5 f5 eb4 bb2 cs5) (d4 b4 g2 e3 fs2 a2))
              :level '((0 1)))


                                              2




            3                             4




                                                          Opusmodus
Opusmodus                                                     chord-derive   4

(chord-derive '((gs3 c5 f5 eb4 bb2 cs5) (d4 b4 g2 e3 fs2 a2))
              :level '((1 2) (3 4)))


                                  2




                                          8


  3                           4




                                                  Opusmodus


Random variant with omit variants: (ro da ad):

(chord-derive '((gs3 c5 f5 eb4 bb2 cs5) (d4 b4 g2 e3 fs2 a2))
              :level '((1 2) (3 4))
              :variant '?
              :omit '(ro da ad))



                                      2




                                              8


  3                           4




                                                  Opusmodus
Opusmodus                                                                              chord-derive        5

In this example we use a start option to perform a start transposition on each chord
level:

(chord-derive '((gs3 c5 f5 eb4 bb2 cs5) (d4 b4 g2 e3 fs2 a2))
              :level '((1 2) (3 4))
              :variant '?
              :omit '(ro da ad)
              :start '(0 1 -2 3))



                                             2




  3                                                  4




                                                                              Opusmodus




Reference:
Moguillnasky, Eduardo, Continuidad y auto desarrollo en la música de Pierre Boulez. Un anális de Dérive,
in Cetta, P. (ed.), Altura-Timbre-Espacio. Cuaderno de Estudio N° 5. IIMCV. Educa. 2004.

Relevant Documents:
http://www.eumus.edu.uy/eme/ensenanza//EP/2008/2008_c/documentos/
Moguillansky_Continuidad.y.autodesarrollo.en.la.musica.de.Boulez.pdf
