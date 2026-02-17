     Opusmodus                                                                                   pcs-rhythm   1

     pcs-rhythm sequence &key points invert rotate value legato omn
     [Function]

     Arguments and Values:
     sequence                  atom or sequence (Forte name, intervals, chord symbols or pitches).
     points                    an integer (points count).
     invert                    T or NIL. The default is NIL.
     rotate                    an integer. The default is 0.
     value                     a ratio. The default is 1/16.
     legato                    T or NIL. The default is NIL.
     omn                       NIL or T. If true force OMN style output. The default is NIL.


     Description:

     This function transforms Forte name, intervals, chord symbols or pitches into rhyth
     (lengths) sequence.

     Allen Forte's unique notation system commonly known as Forte Notation in which he
     extrapolates from the serial theory of Milton Babbitt, proposes a musical SET THEORY of
     pitch-class-set analysis analogous to mathematical set theory. This has the avowed intention
     of providing a method for the analysis of serial or non-serial atonal music. Forte's system is
     equally at home describing Ives and Stravinsky as it is Schoenberg and Webern.

     In the integer model of pitch, all pitch classes and intervals between pitch classes are
     designated using the numbers 0 through 11. It is a common analytical and compositional tool
     when working with chromatic music, including twelve tone, serial, or otherwise atonal
     music.

     Pitch-class, one of the 12 pitch-classes designated by integers 0 11. Pitch-class 0 refers to all
     notated pitches C, B-sharp, D-double- at. Pitch-class 1 refers to all notated pitches C-sharp,
     D- at, B-double-sharp, and so on.


     Examples:

     Forte:

     (pcs-rhythm '3-11 :omn t)
fl
                                      fl
                                                                                    a﻿
                                                                                            m﻿
Opusmodus                                                    pcs-rhythm   2

(pcs-rhythm '3-11 :invert t :omn t)




(pcs-rhythm '3-11 :invert t :points 9 :rotate 7 :omn t)




(pcs-rhythm '3-11 :points 9 :legato t :omn t)




(pcs-rhythm '(3-11 6-5) :points '(8 9) :omn t)




(pcs-rhythm '3-11 :rotate '(0 1 2 3 4 5 6 7 8 9 10 11) :omn t)
Opusmodus                                     pcs-rhythm   3

Intervals:

(circle-rhythm-plot
 (pcs-rhythm '(2 5 7 11) :omn t))




(circle-rhythm-plot
 (pcs-rhythm '(2 5 7 11) :rotate 7 :omn t))
Opusmodus                                                   pcs-rhythm   4

(circle-rhythm-plot
 (pcs-rhythm '((2 5 7 11) (1 6 3 9 2)) :omn t :legato t))




Pitches:

(pcs-rhythm '(c4ds4e4bb4 eb4fs4e4g4eb4d4cs4) :omn t)
=> ((s - = - - = = - - - - -) (s = = = - = = - - - - -))

Chord symbols:

(pcs-rhythm '(7/b9/s11 9/s11 7) :omn t)
=> ((s - = = - - = - = = - -)
    (s - = - = - = - = = - -)
    (s - - = - - = - = - - -))
Opusmodus                                                                                    pcs-rhythm     5

Score Example:
(setf rhythm (pcs-rhythm '(6-z39 5-13 4-24 6-9)
                         :rotate '(0 3 9 2) :omn t))

(def-score pcs-rhythm
            (:key-signature
             'chromatic
             :time-signature (get-time-signature rhythm)
             :tempo 120
             :ignore-tempo t
             :ignore-time-signature nil
             :layout (rhythm-layout
                      'rhythm
                      :bar-adjustments
                      '((1 :note "6-z39/s")
                        (2 :note "5-13/s/R3")
                        (3 :note "4-24/s/R9")
                        (4 :note "6-9/s/R2"))))
  (rhythm
    :length rhythm
    :pitch '(e4)
    :sound 'gm
    :channel 1)
  )

(display-musicxml *last-score*)


Thanks to Julio Herrlein and his doctoral dissertation “Das alturas ao ritmo : teoria dos conjuntos rítmicos
como ferramenta composicional” (From pitches to rhythm: rhythmic set theory as a compositional tool) for
inspiration. The dissertation presents a system of rhythmic organisation parallel to the musical set theory
pitch class organisation FORTE (1973), as well as an adaptation of the time-point-system (BABBITT, 1962).
From the standpoint of the traditional set theory, and also from the diatonic set theory, this uni ed approach
allows to establish a connecting tissue of basic aspects: from the harmony and chords symbols to the
rhythmic organisation
              .﻿
                                                                                       fi
