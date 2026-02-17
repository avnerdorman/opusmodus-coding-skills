Opusmodus                                                           ambitus-rhythmic-unison   1

ambitus-rhythmic-unison size pitch length
[Function]

Arguments and Values:
size                     an integer (outer interval-size).
pitch                    a list of pitches.
length                   a list of lengths.


Description:

This function is used when working with a two or more instruments or voices (on a single
instrument). What it does is test each chord that occurs when instruments come together
either in synchronisation or through overlapping. If the chord exceeds a speci ed interval
size the second or more of the instruments / voices with jump an octave or invert.


Examples:

The score example below demonstrates how the AMBITUS-RHYTHMIC-UNISON works on
a single bar of an instrumental trio. The ambitus size is 7 (a perfect fth). The second bar
shows the result of compressing the pitch compass to this interval in changes to ute and
clarinet parts. Examine the code example to see exactly how this is achieved.




         oboe          (q c4 d4 e e4 fs4)     => (q c4 d4 e e4 fs4)
         alto- ute     (q c5 e b4 q fs4 e c4) => (q c4 e b3 q fs4 e c4)
         bass-clarinet (q c3 e b4 g4 q gs4)   => (q c4 e b3 g4 q gs4)
    fl
                                                               fi
                                                                         fi
                                                                              fl
Opusmodus                                                          ambitus-rhythmic-unison     2

(ambitus-rhythmic-unison
 7
 (list
   '(c4 d4 e4 fs4) ; oboe
   '(c5 b4 fs4 c4) ; alto-flute
   '(c3 b4 g4 gs4)) ; bass-clarinet
 (list
   '(q = e =)
   '(q e q e)
   '(q e = q)))
=> ((c4 d4 e4 fs4) (c4 b3 fs4 c4) (c4 b3 g4 gs4))

If we mix each list together this is how it would sound:

(pitch-mix '((c4 d4 e4 fs4) (c4 b3 fs4 c4) (c4 b3 g4 gs4)))
=> (c4 d4b3 e4fs4g4 fs4c4gs4)

But the size of nal chord is 8 not 7 semitones. Why? This is because the oboe's list is the
master list and the ute and bass-clarinet lists test for a perfect fth (7 semitones) against the
master, c4 to fs4 and gs4 to fs4.

Notice in the second example how the content of the length lists changes the pitch
contours of the three lists.

(ambitus-rhythmic-unison
 7
 (list
   '(c4 d4 e4 fs4) ; oboe
   '(c5 b4 fs4 c4) ; alto-flute
   '(c3 b4 g4 gs4)) ; bass-clarinet
 (list
   '(q - e = q)
   '(q -e q e q)
   '(-q e = = =)))
=> ((c4 d5 e4 fs4) (c4 b4 fs4 c4) (c3 b4 g4 gs4))

If we mix each list together this is how it would sound:

(pitch-mix '((c4 d5 e4 fs4) (c4 b4 fs4 c4) (c3 b4 g4 gs4)))
=> (c4c3 d5b4 e4fs4g4 fs4c4gs4)
            fi
                 fl
                                                           fi
