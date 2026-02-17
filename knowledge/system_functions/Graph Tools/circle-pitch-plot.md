Opusmodus                                                                       circle-pitch-plot          1

circle-pitch-plot sequence &key type point-radius line-width
                               join-first sort remove-duplicates
                               style file if-exists new-index

[Function]

Arguments and Values:
sequence                 a sequence (pitches, chords, chord names, forte names, integers or tonalities).
type                     :intervals, :pitches or :fifths. The default is :intervals.
point-radius             an integer or NIL. The default is NIL.
line-width               an integer. The default width is 2.
join-first               T or NIL. The default is T.
sort                     T or NIL. The default is T.
remove-duplicates        T or NIL. The default is T.
style                    :line or :fill. The default is :line.
file                      le name.
if-exists                :supersede, :error or :new-index
new-index                NIL or T. The default is NIL.

Description:

The function CIRCLE-PITCH-PLOT returns a geometrical representation of relationships
among the 12 pitch classes of the chromatic scale in pitch class space and provides an easy
way to identify certain patterns and similarities between harmonic structures.

Clockwise motion represents ascending pitch motion, and counterclockwise motion
represents descending pitch motion.
                   fi
Opusmodus                        circle-pitch-plot   2

Examples:

Major Triad:

(circle-pitch-plot '(c4e4g4))




Minor Triad:

(circle-pitch-plot '(c4f4ab4))
Opusmodus                                                 circle-pitch-plot   3

Augmented Triad:

(circle-pitch-plot '(c4e4gs4))




All 4 augmented triads:

(circle-pitch-plot '(c4e4gs4 db4f4a4 d4fs4bb4 eb4g4b4))
Opusmodus                                               circle-pitch-plot   4

With :style :fill

(circle-pitch-plot '(c4e4gs4 db4f4a4 d4fs4bb4 eb4g4b4) :style :fill)




Example with chord names.
Fully-Diminished 7th Chord:

(circle-pitch-plot 'dim7)
Opusmodus                                               circle-pitch-plot   5

All 3 fully-diminished 7th chords:

(circle-pitch-plot '((c4 dim7) (cs4 dim7) (d4 dim7)))




Whole-Tone Scale:

(circle-pitch-plot '(0 2 4 6 8 10))
Opusmodus                                               circle-pitch-plot   6

The complex of 2 Whole-Tone Scale:

(circle-pitch-plot '((0 2 4 6 8 10) (1 3 5 7 9 11)) :style :fill)




Chromatic Scale:

(circle-pitch-plot 'chromatic :point-radius 6)
Opusmodus                                               circle-pitch-plot   7

The complex of 6 tritones:

(circle-pitch-plot '((0 6) (1 7) (2 8) (3 9) (4 10) (5 11))
                   :point-radius 6)




Tonalities:

(circle-pitch-plot 'mixolydian-greek :point-radius 6)
Opusmodus                                             circle-pitch-plot   8

(circle-pitch-plot 'bartok :point-radius 6)




(circle-pitch-plot 'messiaen-mode3 :point-radius 6)
Opusmodus                                         circle-pitch-plot   9

(circle-pitch-plot 'hyojo :point-radius 6)




Contrary Motion:

(circle-pitch-plot '(0 1 11 2 10 3 9 4 8 5 7 6)
                   :sort nil
                   :join-first nil)
Opusmodus                                              circle-pitch-plot   10

(circle-pitch-plot '((0 1) (0 2) (0 3) (0 4) (0 5) (0 6)
                     (0 7) (0 8) (0 9) (0 10) (0 11)))




Example with Forte notation:

(circle-pitch-plot '(6-32 6-7))
Opusmodus                                                 circle-pitch-plot   11

Example with omn-form sequence and :type :pitches:

(circle-pitch-plot
 '(((leg s g2 p dbow+sul d3 sul b3 dig1 a3 b3 d3 b3 d3)
    (leg g2 d3 b3 a3 b3 d3 b3 d3)))
 :type :pitches)




Circle types:

(circle-pitch-plot '((4 9 11) (3 5 10) (0 3 6 9)) :style :fill))
Opusmodus                                           circle-pitch-plot   12

(circle-pitch-plot '((4 9 11) (3 5 10) (0 3 6 9))
                   :type :pitches
                   :style :fill)




(circle-pitch-plot '((4 9 11) (3 5 10) (0 3 6 9))
                   :type :fifths
                   :style :fill)
Opusmodus                                               circle-pitch-plot   13

Examples with :sort and :remove-duplicates set to nil

(circle-pitch-plot '(0 2 6 0 3 7 0 4 8) :point-radius 6)




(circle-pitch-plot '(0 2 6 0 3 7 0 4 8)
                   :sort nil
                   :point-radius 6)
Opusmodus                                   circle-pitch-plot   14

(circle-pitch-plot '(0 2 6 0 3 7 0 4 8)
                   :sort nil
                   :remove-duplicates nil
                   :point-radius 6)




(circle-pitch-plot '(0 2 6 0 3 7 0 4 8)
                   :sort nil
                   :remove-duplicates nil
                   :join-first nil
                   :point-radius 6)
Opusmodus                                       circle-pitch-plot   15

(circle-pitch-plot '(8 4 2 0 10 2 8 10 4 6 8)
                   :sort nil
                   :remove-duplicates nil)
