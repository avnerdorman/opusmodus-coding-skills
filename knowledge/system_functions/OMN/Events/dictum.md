Opusmodus                                                                                                       dictum   1

dictum dictum sequence
[Function]

Arguments and Values:
dictum                     A list of directives specifying how to modify the sequence. Each directive is a
                           list itself, containing key-value pairs that describe the modi cation operation.
                           The keys (dictum types) determine the nature of the operation, while the
                           values provide speci cs such as which elements to target or what changes
                           to apply.
sequence                   The musical sequence to be edited. A sequence is a list of events, where each
                           event represents a musical note or rest with attributes such as length (l), pitch
                           (p), velocity (v), and articulation (a).


Dictum Types:
:if                        Targets events with a speci c element (e.g., l, p, v, a). It can be a single
                           element or a combination thereof.
:and                       Speci es a condition that must match an exact set of event elements for the
                           rule to apply.
:within                    Targets events with elements within a speci ed range (e.g., length range, pitch
                           range, velocity range).
:previous                  Speci es a condition that must match an exact set of event elements from the
                           preceding event for the rule to be apply.
:do                        De nes the modi cation to apply, such as changing an event element, applying
                           a list of changes, or executing a function on the targeted events.
:grace-note                NIL or T. Speci es the modi cations to be applied exclusively to
                           grace note events. The default is NIL (indicating that no modi cation is
                           applied to grace note events).
:remove                    Speci es an event element, or a list of elements, to be removed from the
                           sequence.
:first                     Targets the rst event in the sequence or in a speci ed bar for modi cation.
:last                      Targets the last event in the sequence or in a speci ed bar for modi cation.
:butlast                   Modi es all events except the last one in the sequence or in a speci ed bar.
:rest                      Modi es all events except the rst one in the sequence or in a speci ed bar.
:substitute                Replaces the entire content of a speci ed bar with a new sequence of events.
:bar                       Speci es the bar number(s) to which the dictum should be applied.
                           It can be a single integer or a list of integers.
:event                     Speci es the event number(s) within the bar(s) to which the dictum should
                           be applied.
                fi
                     fi
                     fi
                      fi
                      fi
                      fi
                      fi
                      fi
                               fi
                                    fi
                                         fi
                                              fi
                                                   fi
                                                        fi
                                                             fi
                                                                  fi
                                                                       fi
                                                                            fi
                                                                                 fi
                                                                                      fi
                                                                                           fi
                                                                                                fi
                                                                                                     fi
                                                                                                      fi
                                                                                                           fi
     Opusmodus                                                                            dictum      2

     Description:

     The DICTUM function serves as a powerful tool for dynamic editing of omn-form
     sequences, facilitating complex transformations with simple, declarative statements. By
     leveraging a rich set of directives, users can apply targeted modi cations to enhance or alter
     their compositions effectively.


     Dictum Examples:

     Changes a speci ed element to a new element across all bars. This operation affects every
     instance of the target element in the sequence.

     (:if f :do p)
     (:if q :do e)
     (:if stacc :do leg)
     (:if q :do stacc)
     (:if e :do (s stacc))

     Modi es a speci ed element to a new element within the speci ed bar(s). This allows for
     targeted changes at speci c locations in the sequence.

     (:if f :do p :bar 1)
     (:if q :do e :bar 1)
     (:if stacc :do leg :bar 1)
     (:if q :do stacc :bar 1)
     (:if e :do (s stacc) :bar 1)
     (:if e :do (s stacc) :bar (1 3 5))
     (:if e (s stacc) :bar 2..6)

     Alters a speci ed element to a new element at a speci c event number within the
     designated bar(s). This provides precise control over the modi cation of musical elements
     at particular points.

     (:if f :do p :bar 1 :event 1)
     (:if q :do e :bar 1 :event 1)
     (:if q :do stacc :bar 1 :event 1)
     (:if e :do (s stacc) :bar 1 :event 1)
     (:if e :do (s stacc) :bar (1 3 5) :event 1)

     Converts a speci ed list of elements to a new single element across all bars. This operation is
     applied globally within the sequence.

     (:if (f mf) :do mp)
fi
            fi
                 fi
                      fi
                       fi
                            fi
                                                     fi
                                                              fi
                                                                   fi
                                                                        fi
     Opusmodus                                                                               dictum   3

     Changes a speci ed list of elements to a new single element within the speci ed bar(s). This
     targeted approach allows for changes within speci c sections of the sequence.

     (:if (f mf) :do mp :bar 1)

     Substitutes all occurrences of a certain type of element with a new element throughout the
     entire sequence. This type-based replacement affects all relevant elements globally.

     (:do stacc)

     Modi es all occurrences of a certain type of element to a new element within the speci ed
     bar(s). This allows for type-based changes within speci c segments.

     (:do stacc :bar 2)
     (:do stacc :bar (2 4 6 8))

     Adjusts all accidentals in the sequence to either sharp or at according to the speci ed map.
     This transformation affects the harmonic character of the sequence.

     (:do :sharp)
     (:do :flat)

     Executes a speci ed function across the whole sequence, potentially transforming the
     sequence based on the function's logic.

     (:do (dechord x))

     Executes a speci ed function within the speci ed bar(s) or at a speci c event, allowing for
     localised transformations.

     (:do (dechord x) :bar 3)
     (:do (dechord x) :bar 3 :event 2)

     Deletes a speci ed element or attribute (e.g., velocity, articulation) from the sequence. This
     can be applied to speci c types or instances.

     (:remove leg)
     (:remove :velocity)
     (:remove :attribute)

     Changes the first or last event in the sequence or within speci c bars, which can alter
     the opening or closing character of a musical phrase.

     (:first ord)
     (:first ord :bar 6)
     (:last fermata :bar 6)
fi
             fi
                  fi
                       fi
                       fi
                            fi
                                             fi
                                                  fi
                                                        fi
                                                             fl
                                                                   fi
                                                                        fi
                                                                             fi
                                                                                   fi
                                                                                        fi
Opusmodus                                                                           dictum    4

Replaces all elements in a sequence excluding the last event:

(:butlast leg)

Replaces all elements in a sequence excluding the first event:

(:rest leg)

Substitutes elements within a speci ed pitch, length or dynamic range with a new element,
enabling focused modi cations based on musical parameters.

(:within (t s) :do marc)
(:within (mp f) :do p)
(:within (c4 c5) :do tasto)
(:within (t s) :do marc :bar 2)
(:within (mp f) :do p :bar 2)
(:within (c4 c5) :do tasto :bar 2)

Changes elements that match a speci c series of conditions to a new element. This
conditional operation allows for complex, criteria-based modi cations.

(:and (q c4 f) :do ff)
(:and (q c4 f stacc) :do (q c4cs5 f marc))

Replaces the entire content of a speci ed bar(s) with a new sequence of events, effectively
rewriting sections of the musical piece.

(:substitute (3q c4 eb4 gs4) :bar 8)

Executes a speci ed function applied exclusively to grace note events.

(:do (pitch-transpose 12 x) :grace-note t)

Executes a speci ed function within the speci ed bar(s) exclusively to grace note events.

(:do (pitch-transpose 12 x) :grace-note t :bar 2)

This operation alters elements meeting certain prede ned conditions from the preceding
event, replacing them in the current event with a new element. Such conditional
manipulation facilitates intricate, criteria-driven modi cations.

(:previous ff :do p)
(:previous (h c4 f) :do (pp tr))
            fi
            fi
                 fi
                            fi
                                 fi
                                      fi
                                           fi
                                                fi
                                                     fi
                                                          fi
Opusmodus                                      dictum   5

Examples:
(setf omn '(e g4 f leg gs4 fs4 mf leg a4
            s f4 p bb4 e4 b4 eb4 c5 d4 cs5))




(dictum '(:remove :velocity) omn)




(dictum '(:if e :do stacc) omn)




(dictum '(:remove leg) omn)




(dictum '((:if leg :do tr1) (:do f)) omn)
Opusmodus                                                  dictum   6

(dictum '((:if e :do (f stacc))
          (:if s :do (mp leg))) omn)




(dictum '(:if e :do leg+ten) omn)




(dictum '((:do gliss+pizz :event 1)
          (:do gliss+pizz :event 3)
          (:remove mf)
          (:if s :do leg+tasto)) omn)

                             pizz.             sul tasto


                             gliss.   gliss.




(dictum '(:do :sharp) omn)




(dictum '(:do :flat) omn)
Opusmodus                                                           dictum   7

(setf omn2 '((5q fs4 p - bb3 f3 e4 -3q g4 c5 s eb5 mf a5 cs6 gs6)
             (5q gs6 f cs6 a5 eb5 - -s c5 g4 e4)))

                       5

                                               2



                                                       5
                                   3
                                                                             Opusmodus




(dictum '(:remove (f mf)) omn2)

                           5

                                               2



                                                       5
                                       3
                                                                                 Opusmodus




(dictum '((:within (t s) :do (pitch-transpose -12 x))
          (:if 3q :do ten)) omn2)

                                                   5
                   5
                                           2




                               3
                                                                                   Opusmodus




(dictum '((:if s :do stacc :bar 1) (:if e :do leg :bar 2)
          (:if 5q :do leg :bar 2)) omn2)

                       5

                                               2



                                                       5
                                   3
                                                                                 Opusmodus
Opusmodus                                                                             dictum   8

(dictum '((:remove mf :bar 1) (:if s :do leg)
          (:remove leg :bar 1 :event 12)
          (:if s :do p :bar 2)) omn2)

                               5

                                                   2



                                                                      5
                                           3
                                                                                                 Opusmodus




(dictum '((:if s :do (pp ped) :bar 1)
          (:if 5q :do leg :bar 1)
          (:do :sharp :bar 1)
          (:do :flat :bar 2)) omn2)

                           5

                                                       2



                                                                      5
                                       3

                                                                                               Opusmodus




(dictum '((:if mf :do pp) (:if s :do (p ponte) :bar 2)
          (:if e :do ord :bar 2) (:if 5q :do ord :bar 2)
          (:if 3q :do pizz)) omn2)

                                                           ord.
                               5
                                                                          sul pont.
                                       pizz.       2



                                                                      5
                                        3
                                                                                                Opusmodus




(dictum '((:if 5q :do tasto :bar 1)
          (:first ord :bar 2)
          (:do (gen-pause x) :bar 1 :event 1)
          (:if e :do tasto :bar 2)) omn2)

               sul tasto                               ord.
                           5

                                               2



                                                                  5
                                   3
                                                                                                      Opusmodus
Opusmodus                                                                                            dictum        9


(dictum '((:remove :velocity) (:do < :bar 1)
          (:first p :bar 1) (:last f :bar 1)
          (:do > :bar 2) (:last p :bar 2)) omn2)

                             5

                                                              2



                                                                                5
                                         3

                                                                                                                       Opusmodus




(setf omn3
      '(#|1|# (h fs3 mp e3bb3 mf tie)
        #|2|# (q e3bb3 h. g3)
        #|3|# (h d3c4 mp q a3 p b3 mp tie)
        #|4|# (q b3 mp h f3cs4 q gs3eb4 tie)
        #|5|# (q gs3eb4 mp h fs3 q f3b3 p)
        #|6|# (h g3 mp bb3c4 mf tie)
        #|7|# (q bb3c4 h eb4 mp q e4a4 p)
        #|8|# (q cs4d5 p gs5 fs5 -)
        #|9|# (5d fs3 mp e3bb3 f 5w c3g3 tie)
        #|10|# (5w c3g3 f 5d a2d3 mf b2 mp)
        #|11|# (5d cs3 mf f3 5w eb3gs3 tie)
        #|12|# (5w eb3gs3 5d fs3 f3b3 mp)
        #|13|# (5d g3 mf bb3c4 f 5w eb4 mf tie)
        #|14|# (5w eb4 5d e4 mp a4)
        #|15|# (5d cs5 mp d5 5w gs5 tie)
        #|16|# (h gs5 -)
        ))


                2                    3                4                     5                6




                                                          5                         5
                                                                                                 5
   7                     8                        9                    10               11




                                                      5

  12                13                       14                   15                    16



                                 5
            5                                                                       5

                                                                                                       Opusmodus
Opusmodus                                                                                         dictum          10

(dictum '((:do > :bar 1..8)
          (:do < :bar 9..16)
          (:first ff :bar 1)
          (:first p :bar 9)
          (:first (fermata ff) :bar 16))
        omn3)


                2                    3            4                 5                     6




                                                          5             5
                                                                                                  5
   7                     8                    9                    10           11




                                                      5

  12                13                   14                   15                     16



                             5
            5                                                               5

                                                                                                      Opusmodus




(setf omn4 '((e b4 fs5 e3 a5) (e e5 b5 c4) (e g5 a4 eb3 d4)
             (e c6 b5 a4) (e c5 eb5 gs4) (e b4 f5 f5 fs5 gs5 a5)
             (e cs4 g4 c6) (e gs5)))


                                 2                    3                              4




   5                6                                         7                               8




                                                                                                      Opusmodus




(dictum '(:butlast leg) omn4)


                                 2                    3                              4




   5                6                                         7                               8




                                                                                                      Opusmodus
Opusmodus                                                                          dictum         11

(dictum '((:butlast leg :bar (1 3 6))
          (:do stacc :bar (2 4 5))
          (:last fermata :bar 8)) omn4)


                                  2             3              4




            5             6                         7              8




                                                                       Opusmodus




The substitute type will replace a given bar number with a new sequence of events:

(dictum '(:substitute (q c5eb5gs5 arp) :bar 8) omn4)


                              2             3                           4




   5                6                                   7                   8




                                                                                      Opusmodus




This dictum applies a function to a range of values, found in a given sequence.

(setf omn5 '(q b3eb4gs4 a3d4fs4 e bb3cs4f4 gs3b3e4
             s g3c4eb4 gs3b3e4 bb3d4f4 a3cs4fs4))




(dictum '(:within (t s) :do (dechord x)) omn5)
Opusmodus                                                                   dictum    12

(setf omn6 '(e f4 p q bb4b3 f s bb4b3 bb4b3 mf e bb5b4 f))




(dictum '(:within (b3 c4) :do (pitch-transpose -7 x)) omn6)




(dictum '(:within (t s) :do (pitch-invert x)) omn6)




(dictum '(:within (t s) :do (dechord (pitch-invert x))) omn6)




In the next example we apply a series of dictums in a given sequence in consecutive
order:

(dictum '((:within (t s) :do (dechord x))
          (:within (b3 c4) :do (pitch-transpose -7 x))
          (:within (t s) :do (pitch-invert x))) omn6)
Opusmodus                                                             dictum          13

(setf omn7 '((s fs3 mf d4 a4 c5 b4 f4 bb3 cs3)
             ((acc e f2 cs2) q c2 f stacc)
             (s e2 b2 gs3 e4 bb4 c5 bb4 e4)
             ((acc e gs3 b2) q e2 f stacc)
             (s c2 cs2 f2 cs3 bb3 f4 b4 c5)))

                                                                  2




   3                                 4       5




                                                                          Opusmodus




(dictum '(:do (attribute-series '((leg 4) (stacc 4)) x)
             :bar (1 5)) omn7)


                                                              2




   3                             4       5




                                                                         Opusmodus




(dictum '(:remove acc) omn7)

                                                          2




   3                                 4   5




                                                                        Opusmodus
Opusmodus                                                          dictum          14

(dictum '((:do (pitch-transpose 12 x) :grace-note t)
          (:do (pitch-transpose 24 x) :bar (2 4))) omn7)



                                     2           3




   4             5




                                                                      Opusmodus




(dictum '(:previous c5 :do ((pitch-transpose 13 x) tr1+fermata)) omn7)




                                                           2




   3                             4       5




                                                                     Opusmodus




(dictum '(:previous c5 :do (cs6 tr1+fermata)) omn7)




                                                               2




  3                              4           5




                                                                       Opusmodus
Opusmodus                                                        dictum         15

(dictum '((:previous c5 :do (unfold 'om 'ld72 x))
          (:do (rewrite-accidentals x :map :chromatic))) omn7)


                                                           2




  3                               4       5




                                                                    Opusmodus
