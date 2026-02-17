Opusmodus                                                                           add-interval       1

add-interval range interval pitch length
[Function]

Arguments and Values:
range                    A list of two lengths values (min max) - length within min max to chordize.
interval                 A list of intervals.
pitch                    A list of pitches to chordize.
length                   A list of lengths (corresponding to pitches).


Description:

ADD-INTERVAL enables a series of note lengths to dictate which pitches in a series are
chordized, or rather augmented by an additional pitch of a speci ed interval or
intervals.

(add-interval
 '(q h) '(7)
 '(c4 c4 c4 c4 c4 c4)
 '(1/8 1/8 1/4 1/2 1/8 1/8))
=> (c4 c4 c4g4 c4g4 c4 c4)

(add-interval
 '(q h) '(7 (6 13))
 '(c4 c4 c4 c4 c4 c4)
 '(1/8 1/8 1/4 1/2 1/8 1/8))
=> (c4 c4 c4g4 c4fs4g5 c4 c4)

The list of intervals will be repeated once all the intervals therein have been exhausted:

(add-interval
 '(1/8 1/2) '(7 (6 13))
 '(c4 c4 c4 c4 c4 c4)
 '(1/16 1/8 1/4 1/2 1/8 1/16))
=> (c4 c4g4 c4fs4g5 c4g4 c4fs4g5 c4)

Existing chords will not be augmented:

(add-interval
 '(1/8 1/2) '(7 5)
 '(c4 c4e4 c4 c4 c4 c4)
 '(1/16 1/8 1/4 1/2 1/8 1/16))
=> (c4 c4e4 c4f4 c4g4 c4f4 c4)
                                                             fi
     Opusmodus                                                                add-interval   2

     Multiple length lists can be used to create variations:

     (add-interval
      '(1/8 1/2) '(7 5)
      '(c4 c4e4 c4 c4 c4 c4)
      '((1/16 1/8 1/4 1/2 1/8 1/16) (1/8 1/16 1/16 1/2 1/4 1/8)))
     => ((c4 c4e4 c4f4 c4g4 c4f4 c4) (c4g4 c4e4 c4 c4f4 c4g4 c4f4))

     Examples:

     The rst example below demonstrates how to augment each single note of duration 1/4 or
     1/2 with a note 7 semitones higher. This function works well in scoring for keyboard,
     mallet instrument or guitar where fast passages in 1/16s or 1/32s are punctuated by
     slower chordal material. See / hear this technique in action in bars 17-39 in the rst
     movement of Nigel Morgan's Dreaming Aloud for solo guitar.

     (setf sl-row (rnd-sample 24 '(c4 cs4 c4 fs4 g4 gs4)))

     (setf rhy
           '(s = = =
             q = e =
             e = = =
             s = = =
             s = = =
             e = = =))

     (add-interval '(e q) '(7 7 2 3 4 5 7 8) sl-row rhy)
     => (c4 g4 c4 c4 c4g4 fs4db5 c4d4 fs4a4
         fs4bb4 gs4db5 c4g4 c4ab4 cs4 c4 gs4
         c4 c4 fs4 gs4 g4 g4d5 g4d5 gs4bb4 g4bb4)
fi
                                                                         fi
