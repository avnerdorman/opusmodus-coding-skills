Opusmodus                                                                                   def-score      1

def-score name &key title subtitle composer writer copyright
                key-signature time-signature merge-rests rewrite-lengths
                ignore—velocity ignore-tempo octave-shift accidentals
                flexible-clef ignore-time-signature tempo file start end
                layout &body instruments

[Macro]

Arguments and Values:
SCORE instance for DEF-SCORE:

name                   The name of the score. A symbol. Not evaluated.
title                  The title of this score. A string or NIL.
subtitle               The subtitle of this score. A string or NIL.
composer               The composer of this score. A string or NIL.
writer                 The writer of the text of this score. A string or NIL.
copyright              The copyright of this score. A string or NIL.

key-signature         is either a two-list of the form (g maj) or a list of three-lists, of the form
                      ((g maj 3) (e maj 1) (c m 1)), where the rst two elements of
                      each 3-list are the key signature and the third element is the number of bars.
                      The bar count maybe omitted from the nal key signature. Optional key
                      signatures: 'atonal and ‘chromatic.

time-signature        is either a two list, e.g. (4 4), or a list of three-lists, e.g.
                      ((4 4 3) (4 8 1) (3 4 1)), where the rst two element of each list
                      are the numerator and denominator of the time signature, and the element is
                      the number of bars. The bar count maybe omitted from the nal time signature.
tempo                 is either an integer, e.g. 120, or a list or a list of lists. The list or each list in
                      the list of lists is of the form: ([<tempo-name>] [<beat-note>] [<:rit/:accel>]
                      <bpm> [<bpm2> <delta>] [<:bars/:length>] <count>) <tempo-name> is
                      a string for the tempo to be printed by MusicXML, e.g. \"Allegro\".
                      <beat-note> is an OMN note symbol denoting the note that gets a beat, e.g.
                      q or e. <:bars/:length>, if included, determines whenter <count> is a number
                      of bars or a length (number of quarter notes). Defaults to :bars. Sticky.
                      If <:rit/:accel>, <bpm2>, and <delta are included, then this represents
                      a gradual ritard or accelerando, from <bpm> to <bpm2> over <count> bars
                      or length in time increments of <delta>, which can be a rational number or
                      a length symbol. <count> is the duration, in bars or length, of this tempo.
                      May be omitted for the nal tempo spec.

rewrite-lengths     NIL or T. The default is T.
merge-rests         NIL or T. The default is T.
ignore—velocity     NIL or T. The default is NIL
ignore-tempo        NIL or T. The default is NIL.
octave-shift        NIL, T or range i.e. (c2 c6). The default is NIL.
accidentals         :all :natural or :cautionary. The default is :natural.
flexible-clef       NIL or T. The default is NIL.
ignore-time-signature    NIL or T. The default is NIL.
                                       fi
                                                        fi
                                                                   fi
                                                                         fi
                                                                              fi
Opusmodus                                                                                   def-score     2

file                    is the default for the le keyword arg to COMPILE-SCORE.
start                   is the starting bar for COMPILE-SCORE output.
end                     is the ending bar for COMPILE-SCORE output.
layout                  The LAYOUT arg for MusicXML output.

INSTRUMENT instance for DEF-SCORE:

span                     is :length, :pitch, or :velocity. Default :length.

omn                      is a Opusmodus Notation list. Will be used for length, pitch, velocity
                         and articulation.

text                     The lyrics (if any), in OMN-like nested lists used with this instrument.
length                   is a length spec as output from (omn :length ...).
pitch                    is a pitch spec as output from (omn :pitch ...).
velocity                 is a velocity spec as output from (omn :velocity ...).
channel                  is a midi channel number, 1-based.
port                     is the instrument port name through which to play (via meta event 09).
sound                    is null or the name of a DEF-SOUND sound de nition.

program                  is a midi program number, a list of (LSB MSB) for a midi bank select
                         and program number, or a program name in DEF-SOUND sound de nition.

volume                   is a midi main-volume setting.
pan                      is a midi pan setting.

tuning                   is deltas to the tuning, integers in 100/4096 cents or oats
                         where 1.0 is 100 cents (a semitone). max: +-200 cents.

duration                 is the note duration to use in place of the corresponding length,
                         rationals in length units. Must include place-holders for the rests in length.

duration-add             may be used instead of duration to denote deltas in length instead
                         of absolute lengths.


Description:

This function de nes a SCORE. It is a instance that can be lled with material in the DEF-
SCORE template slots. The DEF-SCORE instance DEFAULT options must have at least
the :title, :key-signature, :tempo and :time-signature values:

(:title "score title"
 :key-signature 'atonal
 :time-signature '(4 4)
 :tempo 72)
            fi
                                      fi
                                                          fi
                                                                  fi
                                                                        fl
                                                                                       fi
Opusmodus                                                               def-score   3

The other keywords are optional:

:rewrite-lengths
:merge-rests
:ignore—velocity
:ignore-tempo
:octave-shift
:accidentals
:flexible-clef
:ignore-time-signature

The INSTRUMENT instance:

(instrument
 :omn mat
 :channel 1
 :sound 'gm
 :program 'acoustic-grand-piano))

The complete DEF-SCORE instance with default options and INSTRUMENT instance:

(def-score score-name
           (:title "score title"
            :key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 72)

 (instrument
  :omn mat
  :channel 1
  :sound 'gm
  :program 'acoustic-grand-piano))

There are two METHODS to input material in to the DEF-SCORE instance:

OMN list method:

(setf mat
      '((5q c4 p cs5 pp d4 p ds5 pp e4 p)
        (s f5 pp fs4 mf g4 pp gs5 mf)
        (5q a4 p as5 mf b4 mp c4 pp cs5 d4 p ds5 mf e4 mp f5 pp fs4)
        (e g4 gs5 s a4 pp e as5 mf s b4 e c4 pp s cs5 mf e d4 -q)
        (s ds5 pp e4 p f5 mp fs4 pp 3q g4 p gs5 mp
           a4 pp q as5 p 5q b4 mp c4 pp cs5 p d4 mp ds5 pp)
        (s e4 p f5 pp fs4 p g4 pp)))
Opusmodus                                                      def-score   4

(def-score score-name
           (:title "score title"
            :key-signature 'atonal
            :time-signature '(4 4)
            :tempo 72)

 (instrument
  :omn mat
  :channel 1
  :sound 'gm
  :program 'acoustic-grand-piano))

Parametric list method:

(setf length-pat '((5q = = = =) (s = = =) (5q = = = = = = = = =)
                   (e = s e s e s e -q) (s = = = 3q = = q 5q = = = =)
                   (s = = =)))

(setf pitch-pat '(c4 cs5 d4 ds5 e4 f5 fs4 g4 gs5 a4 as5 b4))
(setf velocity-pat '((p pp) (pp mf) (p mf mp pp pp)
                     (mf mf pp) (pp p mp)))

(def-score myscore
           (:title "score title"
            :key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 72)

 (instrument
  :length length-pat
  :pitch pitch-pat
  :velocity velocity-pat
  :channel 1
  :sound 'gm
  :program 'acoustic-grand-piano))
Opusmodus                                    def-score   5

Examples:

Score example for a composition for piano.

(def-score myscore
           (:title "score title"
            :composer "composer name"
            :copyright "copyright © 2015"
            :key-signature 'chromatic
            :time-signature '(4 4)
            :tempo tempo)

 (rhand
  :omn right-hand
  :port 0
  :channel 1
  :sound 'gm
  :program 'acoustic-grand-piano)

 (lhand :omn left-hand))
Opusmodus                                                       def-score   6

Score example for a composition for REAKTOR with controllers:

(def-score reaktor
           (:title "Reaktor Control"
            :composer "OPMO"
            :copyright "Copyright © 2012 Opusmodus"
            :key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 120
            :start 1 :end 8)

 (bass
  :length length
  :pitch pitch
  :velocity velocity
  :port 0
  :channel 1
  :sound 'reaktor
  :program 8
  :pan '((:desc-asc 127 0 1/32 5) (:asc 34 127 1/32 5) (127 1) (0 1))
  :volume 127
  :controllers (9 '((4 1) (3 1/2) (65 1/2))
                12 '((0 2) (80 1/2) (65 1/2))
                45 '((78 1/2) (3 3) (32 1/2))
                 46 '((54 1) (87 1/2) (88 1/2))
                13 '((:desc-asc 76 23 1/32 3)
                      (:asc 34 127 1/32 2) (0 2))
                52 (rnd-sample 100 '(23 45 12 89 94 2 57 21))
                53 (rnd-sample 100 '(23 45 12 89 94 2 57 21))
                54 (rnd-sample 100 (gen-integer 12 99))
                55 (rnd-sample 100 (gen-integer 45 99))
                51 '((:desc-asc 127 0 1/32 3)
                      (:asc 34 127 1/32 5) (127 2))
                73 '((67 1) (7 1/2) (64 1/2))
                75 '((2 1) (67 1/2) (65 1/2))
                70 '((98 1) (3 1/2) (99 1/2)))))

Pan on every event:

(def-score pan1
           (:key-signature 'chromatic
             :time-signature '(4 4)
             :tempo 60)
 (vn
  :omn '(q c4 d4 e4 f4 g4 a4 b4)
  :tuning '(.5 .33 0 -.5 0 .5 0 0)
  :pan '(1 127 1 127 1 127 64)
  :channel 1
  :program 'violin
  :sound 'gm))
Opusmodus                                                def-score   7

Pan with time values:

(def-score pan2
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 60)
  (vn
   :omn '(h c4 d4 e4 f4 g4 a4 b4)
   :tuning '(.5 .33 0 -.5 0 .5 0 0)
   :pan '((:desc-asc 127 0 1/32 1)
          (:asc 34 127 1/32 1) (127 1) (0 1/2))
   :channel 1
   :program 'violin
   :sound 'gm))

Example with merge-rests keyword.

(setf rh '(-3q c4 = -e - -s. -t -q.))
(setf lh '(-q g3 = fs3))

(def-score mr-T
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 120
            :layout (piano-solo-layout 'rhand 'lhand))

  (rhand :omn rh
         :channel 1
         :sound 'gm
         :program 0)

  (lhand :omn lh
         :channel 2))
Opusmodus                                                def-score   8

(def-score mr-NIL
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 120
            :merge-rests nil
            :layout (piano-solo-layout 'rhand 'lhand))

  (rhand :omn rh
         :channel 1
         :sound 'gm
         :program 0)

  (lhand :omn lh
         :channel 2))




System ports setup:

(midi-destinations)
=> ((0 . "Bus 1") (1 . "Bus 2") (2 . "Bus 3")
    (3 . "Bus 4") (4 . "Session 1") (5 . "vPacarana"))
