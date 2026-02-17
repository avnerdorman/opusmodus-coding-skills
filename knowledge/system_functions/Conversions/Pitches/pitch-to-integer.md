Opusmodus                                                                     pitch-to-integer   1

pitch-to-integer list &key quantize remain
[Function]

Arguments and Values:
list                     a list or lists of pitches.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

This function converts a list of pitches to integers, based on c4 = 0. It is particularly
useful when a series of motifs have been composed through improvisation. Using the various
sequence and number functions found in the "Integers & Numbers" menu pitch motifs may
be manipulated in surprising ways by converting the pitches rst into integers.


Examples:
(pitch-to-integer '(bb3 b3 c4 db4 d4))
=> (-2 -1 0 1 2)

(pitch-to-integer '(bb3. b3 c4+ db4 d4))
=> (-9/4 -1 1/2 1 2)

(pitch-to-integer '(bb3. b3 c4+ db4 d4) :quantize 1/2)
=> (-2 -1 0 1 2)

Chords will be rendered as sublists:

(pitch-to-integer '(bb3 b3f4 c4g4 db4 d4))
=> (-2 (-1 5) (0 7) 1 2)

(setf motif-n
      (gen-divide 6
       (a*x 2 (flatten
               (pitch-to-integer
                '((bb3 b3 c4 db4 d4 d5)
                  (ds4 e4 gs4 fs4 c4 d3)))))))
=> ((-4 -2 0 2 4 28) (6 8 16 12 0 -20))

(integer-to-pitch motif-n)
=> ((gs3 bb3 c4 d4 e4 e6) (fs4 gs4 e5 c5 c4 e2))
                                                         fi
