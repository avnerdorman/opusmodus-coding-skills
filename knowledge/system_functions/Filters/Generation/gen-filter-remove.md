Opusmodus                                                                       gen-filter-remove   1

gen-filter-remove remove pitch length &key velocity invert span
[Function]

Arguments and Values:
remove                   pitch or list of pitches to remove.
pitch                    list of pitches.
length                   length value or list of lengths.
velocity                 NIL or list of velocities.
invert                   NIL or T. If T the internal binary map in inverted. The default is NIL.
span                     :pitch or :length. The default is :pitch.


Description:

This function is associated with GEN-FILTER-ANACRUSIS and GEN-FILTER-CHANGE.
GEN-FILTER-REMOVE is invaluable as an additional and alternative editor when
processing long streams of data. Instead of the function searching for repeated pitches from
which to create phrases boundaries a pitch or pitches can ful l the same role, and repeated
pitches can be retained. When such phrases are in place and divided into sublists you can
remove further and speci c pitches to create fascinating rhythmic articulations and highlight
particular intervalic features or tonalities in the process.

(setf pitches '(c4 d4 e4 c4 d4 e4 c4 d4 e4))

(gen-filter-remove '(c4) pitches 'e)
=> ((-e d4 e4) (-e d4 e4) (-e d4 e4))

You’ll see that the function mechanism takes a stream of pitch data and automatically creates
sublist divisions based on the position of removed symbols. This can be most valuable should
you want to structure a composition around irregular phrase lengths.

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 6))
=> (c4 gs4 d4 e4 d4 d4 e4 e4 e4 gs4 e4
    gs4 e4 d4 c4 gs4 gs4 fs4 fs4 e4)

(gen-filter-remove '(c4 gs4) mat 's)
=> ((-s - d4 e4 d4 d4 e4 e4 e4) (-s e4)
    (-s e4 d4) (-s - - fs4 fs4 e4))

However, if a single list is required then append the function FLATTEN to the head of the
expression.

(flatten (gen-filter-remove '(c4 gs4) mat 's))
=> (-s - d4 e4 d4 d4 e4 e4 e4 -s e4
    -s e4 d4 -s - - fs4 fs4 e4)
                  fi
                                                          fi
Opusmodus                                                             gen-filter-remove   2

One further feature of this function lies in the use of the keyword :invert. This is common
to all GEN-FILTER functions and is based on one of the building blocks of the ltering
process, conversion into a binary list. As a binary list can be inverted (1 0 0 1 1 0) can
become (0 1 1 0 0 1) the possibility of two outcomes can be realised giving the
composer a further possibility of variation.

(gen-filter-remove '(c4 gs4) mat 's :invert t)
=> ((s c4 gs4) (-s - - - - - - gs4)
    (-s gs4) (-s - c4 gs4 gs4))



Examples:
(gen-filter-remove '(c4 gs4) mat 's :velocity '(f f mp mp mp))
=> ((-s - d4 mp e4 d4 d4 f e4 e4 mp e4)
    (-s e4 f) (-s e4 mp d4) (-s - - fs4 fs4 e4))

(gen-filter-remove '(c4 gs4) mat 's :velocity '(f f mp mp mp) :invert t)
=> ((s c4 f gs4) (-s - - - - - - gs4 mp)
    (-s gs4 f) (-s - c4 mp gs4 f gs4))

(setf stream
      (integer-to-pitch
       (vector-round 0 7 (gen-noise 30 :seed 12))))
=> (cs4 e4 cs4 d4 e4 eb4 eb4 fs4 e4 g4
    eb4 d4 cs4 fs4 fs4 f4 fs4 e4 c4 g4
    g4 d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4)

(gen-filter-remove '(e4 g4) stream 's)
=> ((s cs4) (-s cs4 d4) (-s eb4 eb4 fs4)
    (-s - eb4 d4 cs4 fs4 fs4 f4 fs4) (-s c4)
    (-s - d4 c4 eb4) (-s c4 cs4 c4 cs4 fs4))

(gen-filter-remove '(c4 fs4) stream 's)
=> ((s cs4 e4 cs4 d4 e4 eb4 eb4)
    (-s e4 g4 eb4 d4 cs4) (-s - f4)
    (-s e4) (-s g4 g4 d4) (-s eb4 g4)
    (-s cs4) (-s cs4))
                                                                       fi
Opusmodus                                               gen-filter-remove   3

(setf mat2
     (gen-filter-remove
      '(c5 cs5 g5)
      (vector-to-pitch '(g4 g5) (gen-noise 64 :seed 246))
      (vector-to-length 's 1 5 (gen-noise 64 :seed 456))
      :velocity (vector-to-velocity
                 'mp ‘ff (gen-noise 64 :seed 546))))

(omn-to-time-signature mat2 '(4 4))
