Opusmodus                                                                    length-chordize-map   1

length-chordize-map map pitch length &key unique otherwise seed
[Function]

Arguments and Values:
map                      a list (<old> <new>).
pitch                    a list or lists of pitches
length                   a list or lists of length.
unique                   NIL or T (unique pitches in a chord). The default is T.
otherwise                an integer (chord size). The default is 1.
seed                     NIL or an integer. The default is NIL.


Description:

LENGTH-CHORDIZE-MAP creates chords from a pitch series from a set of maps
(<length><chord-size>).

(length-chordize-map
 '(1/8 3)
 '(c4 e4 g4 bb4 c5 e5 g5)
 '(1/4 1/8 -1/8 1/16 1/16 1/16 -1/16 1/8 1/8 1/2))
=> (c4 e4g4bb4 c5 e5 g5 c4e4g4 bb4c5e5 g5)

Any length in a sequence that has not been mapped, a single note is used
(default :otherwise).


Examples:

In the preliminary examples the contents of a chromatic scale are chordized in a variety of
different ways.

Here the chord size 2 is activated to 1/8:

(length-chordize-map
 '(1/8 2)
 '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4 c5)
 '(1/8 1/16 1/16 -1/16 1/16 1/4 1/4 1/2))
=> (c4cs4 d4 ds4 e4 f4 fs4 g4)
Opusmodus                                                        length-chordize-map    2

Notice that the output is trimmed to the length of the rhythm.

(length-chordize-map
 '((1/16 1) (1/8 (1 2)))
 '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4 c5)
 '(1/8 1/16 1/16 -1/16 1/16 1/4 1/4 1/2))
=> (c4cs4 d4 ds4 e4 f4 fs4 g4)

Examples with length symbols:

Here, :otherwise is activated with chord size 3 on lengths that have not been mapped:

(length-chordize-map
 '((s 1) (e (1 2)))
 '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4 c5)
 (1/8 1/16 1/16 -1/16 1/16 1/4 1/4 1/2) :otherwise 3)
=> (c4cs4 d4 ds4 e4 f4fs4g4 gs4a4bb4 b4c5c4)

In the following example the :otherwise value is chosen at random:

(length-chordize-map
 '((s 1) (e (1 2)))
 '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4 c5)
 '(1/8 1/16 1/16 -1/16 1/16 1/4 1/4 1/2) :otherwise '(2 3))
=> (c4cs4 d4 ds4 e4 f4fs4 g4gs4 a4bb4b4)

Example with sublists:

(setf pitches
      '((ds5 d5 g5 fs5 g5 g5 g5 c5 a5 fs5)
        (c5 g5 ds5 d5 fs5 a5 g5 as4 c5 d5)
        (ds5 as4 d5 a4 f5 ds5 f5 gs4 ds5 g4)
        (d5 g5 b4 f5 g5 ds5 f5 c5)
        (c5 ds5 as4 gs5 d5 f5 ds5 g4 gs4 f4 g5)
        (f5 c5 d5 b4 b4 ds5 g5 d5 c5)))

(setf lengths
      '((s = e) (q) (s = q) (q.)
        (s = = = = = = =) (h)
        (e = q) (q. e)))

(length-chordize-map
 '((s 1) (e 2)) pitches lengths :otherwise '(2 3))
=> ((ds5 d5 g5fs5) (g5c5a5) (c5 a5 fs5c5g5)
    (ds5d5fs5) (a5 g5 as4 c5 d5 ds5 as4 d5)
    (a4f5ds5) (f5gs4 ds5g4 d5g5b4) (f5g5 ds5f5))
