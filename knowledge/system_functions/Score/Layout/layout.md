Opusmodus                                                                                      layout    1

:layout
instrument-identifier
(group-type stave-form* option*)
(clef-type instrument-identifier* option*)

[keyword]

Arguments and Values:
instrument-identifier            symbol that matches an instrument name.

group-type                       :brace, :bracket and :square.

clef-type                        :treble, :bass, :alto, :tenor (you can append -up8
                                 or -down8 to any of those), :percussion, :blank,
                                 :6-string, :4-string, :tall6-string, :tall4-string.

options                          :name which is the label to put next to the staff or group at
                                 the beginning of the score. :abbr which is the label to put next to
                                 the staff or group at other points in the score. :lines is the number
                                 of lines to draw for the stave (5 is the default). :notehead
                                 speci es the type of notehead to use. Options are
                                 :standard, :cross, and :none. :note puts a textual
                                 annotation above the staff. :bar-adjustments allows you
                                 specify options for portions of the score.


Description:

The :layout parameter to DEF-SCORE is either a stave form or a list of stave forms.

A stave form has one of the following three shapes:

instrument-identifier
(group-type stave-form* option*)
(clef-type instrument-identifier* option*)

An instrument-identi er is just a symbol that matches an instrument name. If it’s not inside a
clef form, the clef is guessed (either treble or bass).

The group types are :brace, :bracket, and :square. Brackets are used for a family
of instruments (eg, brass or strings), brace is used for a single instrument across multiple
staves (piano), and square is used when multiple parts for the same instrument need more
than one staff (eg, if you have four oboe parts).
              fi
                            fi
     Opusmodus                                                                         layout   2

     The clef types are :treble, :bass, :alto, :tenor (you can append -up8 or -down8
     to any of those), :percussion, :blank, and some tabulature clefs: :6-string, :4-
     string, :tall6-string, and :tall4-string. Multiple instrument identi ers in a
     clef form are treated as multiple voices on a single staff.

     The options are:
     :name, which is the label to put next to the staff or group at the beginning of the
     score. :abbr which is the label to put next to the staff or group at other points in the
     score. :lines is the number of lines to draw for the staff (5 is the default). :notehead
     speci es the type of notehead to use. Options are :standard, :cross,
     and :none. :note puts a textual annotation above the staff. :bar-adjustments allows
     you specify options for portions of the score. The value is a list of CONS’es, where the CAR
     is a bar-specifier and the CDR is a plist of options to apply for those bars.

     A bar-specifier is either a single integer, a list containing each bar to apply the options
     to, or a CONS where the CAR is the rst bar and the CDR is the last bar to apply the options
     to. A list, eg (3 5 6) would apply the following options only to bars 3, 5, and 6. A CONS,
     eg (3 . 5) de nes a range and applies the following options to bars 3, 4, and 5.


     Examples:

     There are also some functions that can de ne layouts a bit more brie y.

     :layout (piano-layout 'right-hand 'left-hand))

     Piano layout:

     :layout (piano-layout '(right-hand-1 right-hand-2) 'left-hand)

     String ensemble:

     :layout
      (string-ensemble-layout '(violin-1 violin-2) 'viola 'cello ())

     These can be combined with other layouts as well:

     :layout (list
              '(:treble vox)
              (piano-layout '(right-hand-1 right-hand-2) 'left-hand)))
fi
                 fi
                                  fi
                                       fi
                                                                  fl
                                                                               fi
Opusmodus                                                                          layout   3

Piano with string ensemble:

:layout (list
         (piano-layout 'right-hand 'left-hand))
         (string-ensemble-layout '(violin-1 violin-2)
                                 'viola 'cello 'double-bass))

Small ensemble layout:

:layout (list
         (bracket-group
          (flute-layout 'flutesolo)
          (flute-layout 'flutes)
          (oboe-layout 'oboes)
          (clarinet-layout 'clarinets)
          (bassoon-layout 'bassoons))
         (string-ensemble-layout '(vn1 vn2) 'vla 'vlc 'ctb)
         (grand-layout 'harp :name "Harp" :abbr "Hrp.")
         (grand-layout 'choir :name "Choir" :abbr "Chr."))

Default split values:

(defparameter *flexible-bass-offset* -3)
(defparameter *flexible-treble-offset* 3)

Default score magni cation:

(setq *score-magnification* 0.6)

Other score magni cation (notation display) can be set in the Preferences/Notation panel.
            fi
                 fi
Opusmodus                                                          layout   4

Layout Options:

Accidentals:

(setf mat '((q c4 c4 db4 f4 ab4) (q db5 db5 db4 db5)
            (q g4 ab4 d5 c5) (q db5 db5 d5 db5)))

(def-score original
           (:key-signature 'atonal
            :time-signature '((5 4 1) (4 4))
            :tempo 120
            :layout (treble-layout 'inst))

  (inst :omn mat
        :sound 'gm
        :channel 1
        :program 'acoustic-grand-piano))




:natural

(def-score natural
           (:key-signature 'atonal
            :time-signature '((5 4 1) (4 4))
            :tempo 120
            :layout (treble-layout 'inst :accidentals :natural))

  (inst :omn mat
        :sound 'gm
        :channel 1
        :program 'acoustic-grand-piano))
Opusmodus                                                        layout   5

:cautionary

(def-score cautionary
           (:key-signature 'atonal
            :time-signature '((5 4 1) (4 4))
            :tempo 120
            :layout (treble-layout 'inst :accidentals :cautionary))

  (inst :omn mat
        :sound 'gm
        :channel 1
        :program 'acoustic-grand-piano))




:all

(def-score all
           (:key-signature 'atonal
            :time-signature '((5 4 1) (4 4))
            :tempo 120
            :layout (treble-layout 'inst :accidentals :all))

  (inst :omn mat
        :sound 'gm
        :channel 1
        :program 'acoustic-grand-piano))
