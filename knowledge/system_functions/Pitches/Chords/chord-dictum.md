     Opusmodus                                                                                    chord-dictum      1

     chord-dictum dictum sequence &key rhy-values section exclude seed
     [Function]

     Arguments and Values:
     dictum                      A list of properties and placeholders, representing rules and methods
                                 to be applied.

     sequence                    An omn-form sequence to which the chord-map process will be applied.

     rhy-values                  (optional): Length values used when :rhy is set to T. Default length values
                                 are '(h q. q e. e s 3q 5q). This parameter determines the rhythm
                                 series to be used for segment division when non-uniform rhythm is desired.

     section                      (optional): An integer or a list of integers specifying the sections of the
                                  sequence to which the process should be applied. If not provided,
                                  the function processes the entire sequence.

     exclude                      (optional): An integer or a list of integers indicating the sections of the
                                  sequence that should be excluded from processing. By default,
                                  all sections are included.

     seed                         (optional) This is an integer that guarantees consistent results each time the
                                  code is evaluated. By providing a speci c seed, you can ensure that the
                                  randomness in your code is reproducible. The default value for seed is NIL,
                                  which means the seed is not set, resulting in different outputs on each run due
                                  to natural randomness.

     Dictum Properties and Placeholders:

     :len - (Required) Speci es the length as either a symbol or a ratio.
     :chd - (Required) Number of pitches in the chord.
     :div - (Required) Number of divisions of the length.
     :vel - (Optional) Velocity, represented as either a symbol or NIL.
     :att - (Optional) Attribute (articulation), speci ed as either a symbol or NIL.
     :grp - (Optional) List of chord size values to be generated, provided as a list of numbers or NIL.
     :int - (Optional) List of intervals, or NIL.
     :var - (Optional) Variant to be applied to the process.
            Options include: p, r, i, ri, a, d, ad, da, and ? (at random), or NIL.
     :mtd - (Optional) Method applied to the process. Options are m (melodize) and r (repeat), or NIL.
     :rhy - (Optional) Rhythm-series function to be applied, indicated by T or NIL.


     Description:

     The CHORD-DICTUM function is designed to process an omn-form sequence using a set
     of de ned rules and methods, as speci ed in the dictum. This function offers a versatile
     tool for composers and programmers working with musical sequences, enabling complex
fi
                       fi
                                         fi
                                               fi
                                                                   fi
     Opusmodus                                                                      chord-dictum         2

     transformations and variations. By adjusting various properties such as chord size, rhythm,
     and articulation, users can explore a wide range of musical possibilities, from simple
     modi cations to intricate rearrangements of the original sequence.

     Through thoughtful experimentation with different dictum con gurations, CHORD-
     DICTUM allows for creative and nuanced composition, making it an essential function for
     advanced musical programming.


     Example:

     Sequence too process:

     (setf mat1 '((h a2b2e3f3gs3 mf)
                  (h a2b2e3f3gs3 p)
                  (q bb4c5gs5a5b5 mp q bb4c5gs5a5b5 p)))

                                               2          3




     In this example, we focus on using only the required placeholders: length (:len), chord-size
     (:chd), and the division (:div). These placeholders will be applied to each chord element,
     given that both length and chord-size are part of the events. The function CHORD-DICTUM
     will process each event in the sequence mat1 using the speci ed dictums.

     Each dictum in the list checks every event in the sequence sequentially before moving to the
     next dictum. In the rst dictum, if the length of an event is (h) (half note) and the chord-size
     is 5, then the length of that event will be divided into 5 equal parts, while maintaining the
     original event span. Similarly, the second dictum applies to events with a quarter note
     length (q) and a chord-size of 5, dividing the event into 4 equal parts.

     (chord-dictum '((:len h :chd 5 :div 5) (:len q :chd 5 :div 4)) mat1)

                                   5                                       5

                                                      2




        3




                                                                                             Opusmodus
fi
                  fi
                                                              fi
                                                                   fi
     Opusmodus                                                                     chord-dictum         3

     In the example below, we use a similar dictum as in the previous example, but with an
     additional placeholder for the chord-group (:grp). The value for :grp in both dictums is
     set to 2, which means that the chord size of all processed chords will be reduced to 2-pitch
     chords, regardless of their original pitch count.


     (chord-dictum '((:len h :chd 5 :div 5 :grp 2)
                     (:len q :chd 5 :div 4 :grp 2))
                   mat1)

     In this example, CHORD-DICTUM is applied to the sequence mat1 with two dictums. Each
     dictum now includes a :grp value of 2, alongside the previously discussed placeholders
     (:len, :chd, :div).

     The rst dictum targets half-note chords (:len h) with ve pitches (:chd 5), divides
     them into ve equal segments (:div 5), and then reduces each resulting chord to only 2
     pitches (:grp 2).

     The second dictum applies the same logic to quarter-note chords (:len q), dividing them
     into four segments (:div 4) and reducing them to 2-pitch chords (:grp 2).

     This process ensures that every chord in the sequence, whether half-note or quarter-note, is
     transformed into a 2-pitch chord, following the speci ed division and group size rules.

                                                                         5

                                                         2




                                 5




        3



                                                                                            Opusmodus




     (chord-dictum '((:len h :chd 5 :div 5 :grp 2 :rhy t)
                     (:len q :chd 5 :div 4 :grp 2 :rhy t))
                   mat1)

     In this example, we extend the use of the CHORD-DICTUM function by incorporating
     the :rhy (rhythm-series) placeholder, set to T. This setting is used when we want the length
     division segments to have non-equal values.
fi
        fi
                                                    fi
                                                             fi
          Opusmodus                                                                    chord-dictum        4


                                                            2




             3



                                                                                               Opusmodus




          In the above code, CHORD-DICTUM is applied to mat1 with two dictums that include
          the :rhy placeholder set to T. The presence of :rhy t in each dictum indicates that the
          divisions of the chord lengths should not be of equal duration. Instead, they will follow a
          rhythm series pattern, creating a more varied rhythmic structure within the processed chords.

          The rst dictum applies to half-note chords (:len h) with ve pitches (:chd 5). It divides
          these into ve segments (:div 5), reduces each to 2-pitch chords (:grp 2), and applies a
          non-uniform rhythm series (:rhy t).

          Similarly, the second dictum works on quarter-note chords (:len q), also dividing them,
          adjusting their pitch count, and applying a non-uniform rhythm series.

          With the :rhy t setting, the length segments produced by CHORD-DICTUM will have
          varied durations, adding rhythmic complexity to the resulting sequence.

          Applying CHORD-DICTUM with :mtd:

          (chord-dictum '((:len h :chd 5 :div 5 :mtd r)
                          (:len q :chd 5 :div 4 :mtd r))
                        mat1)

          In this example, the :mtd (method) placeholder is set to r (repeat) for both dictums. This
          means that the chords in the sequence mat1 are repeated according to the length division
          value. For half-note chords (:len h) with ve pitches (:chd 5), each pitch is repeated
           ve times (:div 5). Similarly, for quarter-note chords (:len q), each pitch is repeated
          four times (:div 4).
                                      5               5

                                             2                  3
fi
     fi
             fi
                                                 fi
                                                                    fi
Opusmodus                                                                   chord-dictum   5

Applying CHORD-DICTUM with :grp:

(chord-dictum '((:len h :chd 5 :div 5 :grp 2 :mtd r)
                (:len q :chd 5 :div 4 :grp 2 :mtd r))
              mat1)

Here, the :grp placeholder is added with a value of 2. This modi es the chord size to
consist of 2 pitches, randomly selected from the original chord, for each division. The :mtd
r setting still applies, so these 2-pitch chords are then repeated according to the speci ed
division value (:div).
                            5

                                    2               3




                                          5




Applying CHORD-DICTUM with :var and :rhy:

(chord-dictum '((:len h :chd 5 :div 5 :grp 2 :var ? :mtd r :rhy t)
                (:len q :chd 5 :div 4 :grp 2 :var ? :mtd r :rhy t))
              mat1)

In this example example, we introduce :var set to ?, which means the variant is applied at
random. Additionally, :rhy t is used, indicating that the rhythm of the divisions will not be
uniform but will follow a rhythm series. The combination of these placeholders with :grp
2 and :mtd r results in a more complex and varied transformation of the original chords.
Each chord is reduced to 2 pitches, with these pitches being varied and repeated in a
rhythmically diverse manner.

                                   2                     3




                                                                  5

                                                                                            Opusmodus




Final Example with Complex Dictum:

(setf dictum1
      '((:len q :chd 5 :div 3 :vel p :grp 3 :int (0 13 1 11)
         :var ? :rhy t)
        (:len q :chd 5 :div 4 :vel mp :grp 2
         :int (0 13 1 11) :var ? :rhy t)
        (:len h :chd 5 :div 5 :vel mf :grp (2 3) :int (0 13 1 11)
         :var ? :rhy t)))

(chord-dictum dictum1 mat1)
                                                             fi
                                                                              fi
     Opusmodus                                                                    chord-dictum     6

     In this example, we de ne a complex dictum (dictum1) that includes multiple placeholders
     for each dictum within the list. The function CHORD-DICTUM is then applied to mat1 using
     this dictum. Each dictum contains speci c conditions for the length (:len), chord size
     (:chd), division (:div), velocity (:vel), group size (:grp), interval list (:int), variant
     (:var), and rhythm series (:rhy).

     The rst dictum applies to quarter-note chords (:len q) with ve pitches (:chd 5),
     divided into three (:div 3), with a piano velocity (:vel p), a group size of 3 pitches
     (:grp 3), speci c intervals (:int (0 13 1 11)), a random variant (:var ?), and
     non-uniform rhythm (:rhy t).

     The subsequent dictums adjust these properties, applying different velocities (mp, mf), group
     sizes, and division counts.

     The inclusion of :vel and :att in each dictum means that it becomes a condition for the
     application of that dictum. If an event in mat1 does not match the speci ed velocity, along
     with other properties like length and chord size, the dictum will not be applied, and the
     original event will be retained as is.


                                            2             3




                                                                                                       Opusmodus




     This example illustrates the versatility and complexity possible with the CHORD-DICTUM
     function. Through thoughtful experimentation, a wide range of musical transformations and
     variations can be achieved, allowing for creative and nuanced composition.



     Relevant Functions
     ---------------------------------------------------------
     GEN-CHORD-DICTUM
     MAKE-CHORD-DICTUM

     Relevant Examples
     ---------------------------------------------------------
     Documentation/How-to/Chord Dictum/
fi
                 fi
                      fi
                                      fi
                                                              fi
                                                                      fi
