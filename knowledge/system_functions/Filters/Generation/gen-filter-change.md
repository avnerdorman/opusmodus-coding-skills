Opusmodus                                                                       gen-filter-change   1

gen-filter-change pitch length &key velocity invert span
[Function]

Arguments and Values:
pitch                     list of pitches.
length                    length value or list of lengths.
velocity                  NIL or list of velocities.
invert                    NIL or T. If T the internal binary map in inverted. The default is NIL.


Description:

This function is one of a pair with GEN-FILTER-ANACRUSIS. The two functions are at
their most useful as an editor when generating long streams of data; to create phrase
boundaries and turn a single list into a ‘play’ of sublists. One of the problems of using such
data for the composition of music for human performance is partitioning such streams into
phrases. Even instrumental music has to breath and good instrumental music often has a
similar temporal phrase structure as poetry or prose.

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 234))
=> (fs4 c4 fs4 gs4 d4 c4 c4 fs4 c4 c4
    c4 fs4 c4 fs4 e4 gs4 c4 e4 d4 c4)

(gen-filter-change mat 's)
=> ((s fs4 c4 fs4 gs4 d4 c4) (-s fs4 c4)
    (-s - fs4 c4 fs4 e4 gs4 c4 e4 d4 c4))

Notice in the output of the reference stream of pitches that at the beginning there are two
occurrences of the e4. In ANACRUSCIS mode the rst of the two pitches is erased to form a
rest-length supplying a pick-up effect. In CHANGE-mode it would be the second of the two
pitches to be erased.

One further feature of this function lies in the use of the keyword :invert. This is common
to all GEN-FILTER functions and is based on one of the building blocks of the ltering
process, conversion into a binary list. As a binary list can be inverted (1 0 0 1 1 0) can
become (0 1 1 0 0 1) the possibility of two outcomes can be realised giving the
composer a further possibility of variation.

(gen-filter-change mat 's :invert t)
=> ((-s - - - - - c4) (-s - c4 c4))
                                                fi
                                                                                 fi
Opusmodus                                                               gen-filter-change      2

Examples:

This function is a very ef cient way of making effective phrases from long streams of data.
You’ll see that the function mechanism takes the stream and automatically creates sublists.
This can be most valuable should you want to structure a composition around irregular
phrase lengths.

(setf stream
      (integer-to-pitch
       (vector-round 0 7 (gen-noise 30 :seed 12))))
=> (cs4 e4 cs4 d4 e4 eb4 eb4 fs4 e4 g4
    eb4 d4 cs4 fs4 fs4 f4 fs4 e4 c4 g4
    g4 d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4)

(gen-filter-change stream 's)
=> ((s cs4 e4 cs4 d4 e4 eb4)
    (-s fs4 e4 g4 eb4 d4 cs4 fs4)
    (-s f4 fs4 e4 c4 g4)
    (-s d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4))

If a single list is required then append the function FLATTEN to the head of the expression.

(flatten (gen-filter-change stream 's))
=> (s cs4 e4 cs4 d4 e4 eb4 -s fs4 e4 g4 eb4 d4 cs4 fs4
    -s f4 fs4 e4 c4 g4 -s d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4)

The output list is written in OMN in order to be able to show both Pitch and Note-Length.
Should you want to retain these parameters as separate lists for further processing use the
DISASSEMBLE-OMN function.
                  fi
Opusmodus                                               gen-filter-change   3

(omn-to-time-signature
 (gen-filter-change
  (vector-to-pitch '(g4 g5) (gen-noise 64 :seed 43))
  (vector-to-length 's 1 5 (gen-noise 64 :seed 58))
  :velocity (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 23)))
 '(4 4))
