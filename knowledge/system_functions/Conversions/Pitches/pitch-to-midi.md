Opusmodus                                                                        pitch-to-midi   1

pitch-to-midi list &key quantize remain
[Function]

Arguments and Values:
list                     a list or lists of pitches.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

This function converts a list of pitches to midi values.


Examples:
(pitch-to-midi '(bb3 b3 c4 cs4 d4))
=> (58 59 60 61 62)

Chords will be rendered as sublists:

(pitch-to-midi '(bb3 b3f4 c4g4 db4 d4))
=> (58 (59 65) (60 67) 61 62)

(pitch-to-midi '(bb3+ b3. c4 db4. d4+))
=> (117/2 237/4 60 243/4 125/2)

(pitch-to-midi '(bb3+ b3. c4 db4. d4+) :quantize 1/2)
=> (58 59 60 61 62)
