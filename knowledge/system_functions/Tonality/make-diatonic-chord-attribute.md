Opusmodus                                                              make-diatonic-chord-attribute             1

make-diatonic-chord-attribute sequence
[Function]

Arguments and Values:
sequence                     (list or list of lists): A list (or nested lists) representing a sequence of chords in
                             diatonic-chord format. Each chord in the sequence should follow the
                             diatonic-chord structure, specifying the key and the chord degrees.

Description:

MAKE-DIATONIC-CHORD-ATTRIBUTE is a utility function designed to generate
articulation symbols for each chord degree within a given diatonic chord sequence. It serves
as a companion to the DIATONIC-CHORD function, facilitating the creation of properly
formatted chord attributes for both major and minor keys.

In major keys, the function pre xes chord symbols with a dot (.). For minor keys, it pre xes
with a dot followed by a minus sign (.-). Additionally, when manually specifying chord
degrees, any slash (/) characters in the chord symbols are removed to maintain consistency.

Major Keys:
Chord symbols are pre xed with a dot (.). For example:

V13/iii becomes .V13iii
V7/IV becomes .V7IV

Minor Keys:
Chord symbols are pre xed with a dot and a minus sign (.-). For example:

VI6/9 becomes .-VI69
V7/viio becomes .-V7viio


Examples:

Major Key Chords:

(make-diatonic-chord-attribute '(:c I IV V))
=> (.i .iv .v)

(make-diatonic-chord-attribute '(:g I V vi IV))
=> (.i .v .vi .iv)
                fi
                fi
                        fi
                              ￼
                                                                                                    fi
    Opusmodus                                                                 make-diatonic-chord-attribute   2

    Minor Key Chords:

    (make-diatonic-chord-attribute '(:em i iv V i))
    => (.-i .-iv .-v .-i)

    Nested Chord Sequences:

    (make-diatonic-chord-attribute '((:e i = = =)
                                      (:e vi7 = = =)
                                      (:e imaj7 = = =)
                                      (:e v11 = = =)))
    => ((.i .i .i .i)
        (.vi7 .vi7 .vi7 .vi7)
        (.imaj7 .imaj7 .imaj7 .imaj7)
        (.v11 .v11 .v11 .v11))



    Integrating with MAKE-OMN:

    (setf dc '(:c I IV viio iii vi ii V I))
    (setf chords (diatonic-chord dc))
    (setf art (make-diatonic-chord-attribute dc))

    (make-omn :pitch chords
              :length '(h)
              :articulation art
              :span :pitch)

                                      IV       vii° iii       vi ii       V   I
                                  I        2              3           4




    Song Progression:

    (setf intro '(:c I vi IV V))
    (setf verse '(:c I V vi IV ii V7/vi vi IV I V))
    (setf chorus '(:am i iv VI III iv i V7))
    (setf bridge '(:eb IV V7/V V7 I vi ii V7 I))
    (setf outro '(:c vi IV I ii V7 I IV I))

    (setf song-progression
          (append intro verse chorus bridge chorus outro))

    (setf attr (make-diatonic-chord-attribute song-progression))
￼
                              ￼
    Opusmodus                                                                                                  make-diatonic-chord-attribute                                    3

    (setf song-chords
          (diatonic-chord
            song-progression
            :inv '(0 -1 0 -1                                                                  ; Introduction inversions
                    2 0 -1 0 -1 0 -1 0 -1 -2                                                  ; Verse inversions
                    0 -1 2 0 -1 2 0                                                           ; Chorus inversions
                    0 0 -1 0 -1 2 0 -1                                                        ; Bridge inversions
                    0 -1 2 0 -1 2 0                                                           ; Chorus inversions
                    0 0 0 -1 0 -1 -1 -2)                                                      ; Outro inversions
            :sort t
            :drop 1)
          )

    (make-omn
     :pitch song-chords
     :length '(q q h q q h q q q q q q h q q q q q q q h
               q h q q h q q h  q q q q q q h h h h q q h h w)
     :articulation attr
     )

                                                                                                                     VI                       i   v7
                                                                                                           i                                                          V7/V
                                            V                           V7/vi                                   iv                III   iv                     IV
                          IV       V    I                     IV   ii                IV
                     vi                                  vi                     vi        I            V
                I              2                    3                      4                       5                      6                            7




                                                                                V7                                        i                        VI
                    V7                                             ii                                                                    iv                     III
                               I            vi                                                         I
      8                                                 9                                                      10




                          i
            iv                         v7                                                                  V7
                                                        vi         IV                         ii
                                                                                 I                                            I              IV            I
      11                                    12                            13                                        14                             15




                                                                                                                                                                    Opusmodus
￼
                                                ￼
