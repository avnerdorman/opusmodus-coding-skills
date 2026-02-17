Opusmodus                                                                       pitch-mix   1

pitch-mix lists
[Function]

Arguments and Values:
lists                     lists of pitches.


Description:

The function PITCH-MIX enables a series of lists to be mixed in a vertical alignment.

(pitch-mix '((c4 d4 e4 gb4) (c4 b3 gb4 c4) (c4 b3 g4 ab4)))
=> (c4 d4b3 e4gb4g4 gb4c4ab4)


Examples:

Here's a contextual example where PITCH-MIX is used to test and sound out the pitch
element in a rhythmic unison.

(ambitus-rhythmic-unison
 7
 (list
   '(c4 d4 e4 fs4) ; oboe
   '(c5 b4 fs4 c4) ; flute
   '(c3 b4 g4 gs4)) ; bass-clarinet
   (list
    '(1/4 1/4 1/8 1/8)
    '(1/4 1/8 1/4 1/8)
    '(1/4 1/8 1/8 1/4)))
=> ((c4 d4 e4 gb4) (c4 b3 gb4 c4) (c4 b3 g4 ab4))

If we mix each list together this is how it would sound:

(pitch-mix '((c4 d4 e4 gb4) (c4 b3 gb4 c4) (c4 b3 g4 ab4)))
=> (c4 d4b3 e4gb4g4 gb4c4ab4)

(setf part-1 '(c4 cs4 fs4 g4 c5 f5 fs5 b5)
      part-2 (pitch-invert-start 'bb4 part-1))

(pitch-mix (list part-1 part-2))
=> (c4ab5 cs4g5 fs4d5 g4db5 c5ab4 f5eb4 fs5d4 b5a3)

A common use for PITCH-MIX is when a keyboard part needs to be made from the product
of instrumental lines. In this example below of a fanfare for three trumpets a keyboard part
has been added by using PITCH-MIX.
Opusmodus                                                      pitch-mix   2

Score Example:
(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 24))
(setf phrase-3 (x-y phrase-2 phrase-1))
(setf t-1 (integer-to-pitch phrase-1))
(setf t-2 (integer-to-pitch phrase-2))
(setf t-3 (integer-to-pitch phrase-3))
(setf k-part (pitch-mix (list t-1 t-2 t-3)))

(setf fanfare-rhy
 (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))

(def-score fanfare
           (:key-signature '(c maj)
            :time-signature '(2 4)
            :tempo '(q 60))

       (trumpet1
        :length fanfare-rhy
        :pitch t-1
        :velocity '(ff)
        :channel 1
        :sound 'gm
        :program 'trumpet)

       (trumpet2
        :length fanfare-rhy
        :pitch t-2
        :velocity '(f)
        :channel 2
        :program 'trumpet)

       (trumpet3
        :length fanfare-rhy
        :pitch t-3
        :velocity '(mf)
        :channel 3
        :program 'trumpet)

       (organ
        :length fanfare-rhy
        :pitch k-part
        :velocity '(f)
        :channel 3
        :program 'reed-organ))

(display-midi (compile-score 'fanfare))
