Opusmodus                                                                           midi-to-omn   1

midi-to-omn midi-file &key type instrument bars quantize
                   dissolve-voices

[Function]

Arguments and Values:
midi-file              path to midi- le.
type                   :pitch, :length or :velocity. The default is omn-form.
instrument             a number (midi track number).
bars                   a number or list of numbers.
quantize               a list of integers. The default is '(1 2 4).
dissolve-voices        T or NIL. The T returns a single voice sequence. The default is NIL.

Quantize Values:

1 = 1/4
2 = 1/8
3 = 1/12
4 = 1/16
5 = 1/20
7 = 1/28
8 = 1/32


Description:

This function will extract omn-form events from a given midi-file.


Examples:
(setf 000504b "~/Opusmodus/Media/MIDI/Bach/Chorals/000504b_.mid")

In the following example we extract the 1st midi instrument from the 000504b_.mid
midi-file:

(midi-to-omn 000504b :instrument 1)
=> ((-e g4 ff e. b4 s c5 e d5 f4 ab4 g4)
    (q e4 -s e4 g4 c4 e f4 ab4 ab4 f4)
    (e db4 db4 - c4 bb4 bb4 db5 c5)
    (e ab4 ab4 -s c4 f4 g4 e ab4 f4 e. b4 s c5)
    (q d5 -e g4 c5 a4 e. gb4 s g4) (e g4 d4 -h -e bb4)
    (e. bb4 s f4 e e g4 ab4 f4 d5 f4) (e eb4 c4 - c4 bb4 s c5 db5 -e c5)
    (q a4 -e bb4 bb4 g4 eb4 g4) (q ab4 -e eb4 s db5 bb4 e c5 - eb4)
    (e eb4 bb3 -q. e g4 bb4 eb4) (e ab4 -s f4 e d5 f4 q eb4 -e c4)
    (e. g4 s a4 bb4 bb4 bb4 c5 q db5 -e c5)
    (e a4 a4 c5 f4 ab4 ab4 b3 d4)
    (e f4 f4 - d4 g4 c4 e. b4 s c5) (e c5 g4))
                            fi
Opusmodus                                                                midi-to-omn   2

In the example below the function returns the 2nd midi instrument with pitches only:

(midi-to-omn 000504b :type :pitch :instrument 2)
=> ((c5 c5 d5) (eb5 f5 g5) (g5) (g5 f5 eb5 eb5) (d5) (d5) (eb5 f5 g5 g5)
    (f5 g5 g5) (eb5 f5 g5 g5) (f5 eb5) (g5) (bb5 g5 g5 g5) (f5 f5 f5)
    (g5 f5 eb5 f5) (d5 c5))

The 2nd midi instrument with optional :type :length:

(midi-to-omn 000504b :type :length :instrument 2)
=> ((-1) (-1/4 1/4 1/4 1/4) (1/4 1/4 1/2) (-3/4 1/4)
   (1/4 1/4 1/4 1/4) (1/2 -1/2) (-3/4 1/4) (1/4 1/4 1/4 1/4)
   (1/2 1/4 1/4) (1/4 1/4 1/4 1/4) (1/2 1/4 -1/4) (-3/4 1/4)
   (1/4 1/4 1/4 1/4) (1/2 1/4 1/4) (1/4 1/4 1/4 1/4) (1/2 1/2))

A list of pitches with all midi instruments:

(midi-to-omn 000504b :type :pitch)
=> (((g4 b4 c5 d5 f4 ab4 g4) (e4 e4 g4 c4 f4 ab4 ab4 f4)
     (db4 db4 c4 bb4 bb4 db5 c5) (ab4 ab4 c4 f4 g4 ab4 f4 b4 c5)
     (d5 g4 c5 a4 gb4 g4) (g4 d4 bb4) (bb4 f4 f4 g4 ab4 f4 d5 f4)
     (eb4 c4 c4 bb4 c5 db5 c5) (a4 bb4 bb4 g4 eb4 g4)
     (ab4 eb4 db5 bb4 c5 eb4) (eb4 bb3 g4 bb4 eb4) (ab4 f4 d5 f4 eb4 c4)
     (g4 a4 bb4 bb4 bb4 c5 db5 c5) (a4 a4 c5 f4 ab4 ab4 b3 d4)
     (f4 f4 d4 g4 c4 b4 c5) (c5 g4))
    ((c5 c5 d5) (eb5 f5 g5) (g5) (g5 f5 eb5 eb5) (d5) (d5)
     (eb5 f5 g5 g5) (f5 g5 g5) (eb5 f5 g5 g5) (f5 eb5) (g5)
     (bb5 g5 g5 g5) (f5 f5 f5) (g5 f5 eb5 f5) (d5 c5))
    ((b2) (bb2 ab2 f2) (g2 ab2 e2) (d2) (b2 c3) (d3 g2) (d3 b2)
     (c3 ab3 e3) (eb3 d3 db3) (c3 b2 bb2 a2) (bb2 eb2) (b2 c3) (db3 e2)
     (eb2 d2) (b2 c3 ab2) (gb2 g2 c2)))
Opusmodus                                                                  midi-to-omn     3

In the following example the function will return a list of all midi instruments in omn-
form:

(midi-to-omn 000504b)
=> (((-e g4 ff e. b4 s c5 e d5 f4 ab4 g4)
     (q e4 -s e4 g4 c4 e f4 ab4 ab4 f4)
     (e db4 db4 - c4 bb4 bb4 db5 c5)
     (e ab4 ab4 -s c4 f4 g4 e ab4 f4 e. b4 s c5)
     (q d5 -e g4 c5 a4 e. gb4 s g4) (e g4 d4 -h -e bb4)
     (e. bb4 s f4 e e g4 ab4 f4 d5 f4)
    (e eb4 c4 - c4 bb4 s c5 db5 -e c5)
     (q a4 -e bb4 bb4 g4 eb4 g4) (q ab4 -e eb4 s db5 bb4 e c5 - eb4)
     (e eb4 bb3 -q. e g4 bb4 eb4) (e ab4 -s f4 e d5 f4 q eb4 -e c4)
     (e. g4 s a4 bb4 bb4 bb4 c5 q db5 -e c5)
     (e a4 a4 c5 f4 ab4 ab4 b3 d4)
     (e f4 f4 - d4 g4 c4 e. b4 s c5) (e c5 g4))
    ((-w) (-q c5 ff c5 d5) (q eb5 f5 h g5) (-h. q g5) (q g5 f5 eb5 eb5)
     (h d5 -) (-h. q d5) (q eb5 f5 g5 g5) (h f5 q g5 g5)
     (q eb5 f5 g5 g5) (h f5 q eb5 -) (-h. q g5) (q bb5 g5 g5 g5)
     (h f5 q q) (q g5 f5 eb5 f5) (h d5 c5))
    ((w b2 ff) (h bb2 q ab2 f2) (q g2 ab2 h e2) (w d2) (h b2 c3)
     (-q d3 h g2) (h d3 b2) (q c3 ab3 h e3) (q eb3 d3 h db3)
     (q c3 b2 bb2 a2) (-q bb2 h eb2) (h b2 c3) (h db3 e2) (h eb2 d2)
     (h b2 q c3 ab2) (q gb2 g2 h c2)))

Here we ask to return a list of bars from 1 to 6:

(midi-to-omn 000504b :instrument 1 :bars '(1..6))
=> ((-e g4 ff e. b4 s c5 e d5 f4 ab4 g4)
    (q e4 -s e4 g4 c4 e f4 ab4 ab4 f4)
    (e db4 db4 - c4 bb4 bb4 db5 c5)
    (e ab4 ab4 -s c4 f4 g4 e ab4 f4 e. b4 s c5)
    (q d5 -e g4 c5 a4 e. gb4 s g4) (e g4 d4 -h -e bb4))

Example with quantize:

(midi-to-omn "~/Opusmodus/Media/MIDI/Bach/GV/bach-gv-aria.mid"
             :instrument 1
             :bars '(1..8)
             :quantize '(1 2 4 8))
