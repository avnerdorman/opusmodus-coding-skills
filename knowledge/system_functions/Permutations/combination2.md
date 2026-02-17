Opusmodus                                                                       combination2      1

combination2 n items
[Function]

Arguments and Values:
n                         an integer.
sequence                  list of items.


Description:

This function returns a list of all combinations of length N of the elements of list. n must be
greater than 0.

(combination2 2 '(1 0))
=> ((0 0) (1 0) (0 1) (1 1))


Examples:

This can be invaluable for exploring both rhythmic and melodic combinations, and building
libraries. Here's an example of the latter - building a binary-rhythmic library based on
4-bit-binary.

(setq c-rhy (combination2 4 '(1 0)))
=> ((0 0 0 0) (1 0 0 0) (0 1 0 0) (1 1 0 0) (0 0 1 0) (1 0 1 0)
     (0 1 1 0) (1 1 1 0) (0 0 0 1) (1 0 0 1) (0 1 0 1) (1 1 0 1)
     (0 0 1 1) (1 0 1 1) (0 1 1 1) (1 1 1 1))
Opusmodus                                                         combination2   2

(create-library 'binary-rhythmics '4-bit-binary 'binr
                (combination2 4 '(1 0)))

The print out in the LISTENER is as follows:

=> (def-library binary-rhythmics
                (:section 4-bit-binary
                          binr0 '(0 0 0 0)
                          binr1 '(1 0 0 0)
                          binr2 '(0 1 0 0)
                          binr3 '(1 1 0 0)
                          binr4 '(0 0 1 0)
                          binr5 '(1 0 1 0)
                          binr6 '(0 1 1 0)
                          binr7 '(1 1 1 0)
                          binr8 '(0 0 0 1)
                          binr9 '(1 0 0 1)
                          binr10 '(0 1 0 1)
                          binr11 '(1 1 0 1)
                          . . .))


Score Example:

Let's go on to see how this might be used in a percussion solo:

(setf c-rhys (gen-divide 4 (binary-map (flatten c-rhy) 1/16)))
=> ((-1/16 -1/16 -1/16 1/16) (-1/16 -1/16 -1/16 -1/16)
    (-1/16 1/16 -1/16 1/16) (1/16 -1/16 -1/16 -1/16)
    (1/16 -1/16 -1/16 1/16) (1/16 -1/16 -1/16 -1/16)
    (-1/16 -1/16 1/16 -1/16) (-1/16 1/16 -1/16 1/16)
    (1/16 -1/16 1/16 1/16) (-1/16 -1/16 1/16 1/16))

(setf c-pitches (span c-rhys '(c4 cs4))) ; GM conga pitches
=> ((c4 cs4) nil (c4 cs4) (c4) (cs4 c4) (cs4)
    (c4) (cs4 c4) (cs4 c4 cs4) (c4 cs4))

(setf perc (make-omn :length c-rhys
                     :pitch c-pitches
                     :velocity '(ff)))
=> ((s c4 - - cs4) (-s - - -) (-s c4 - cs4) (s c4 - - -)
    (s cs4 - - c4) (s cs4 - - -) (-s - c4 -) (-s cs4 - c4)
    (s cs4 - c4 cs4) (-s - c4 cs4))

(def-score p-solo
           (:key-signature 'chromatic
            :time-signature '(2 8)
            :tempo '(q 90))

 (congas :omn perc :channel 10 :sound 'gm))
