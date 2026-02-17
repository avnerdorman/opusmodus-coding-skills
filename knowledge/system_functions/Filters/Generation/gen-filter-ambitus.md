Opusmodus                                                                     gen-filter-ambitus   1

gen-filter-ambitus ambitus pitch length &key velocity invert span
[Function]

Arguments and Values:
ambitus                  an integer (low high), a pitch symbol (low high) or instrument-name.
pitch                    list of pitches.
length                   length value or list of lengths.
velocity                 NIL or list of velocities.
invert                   NIL or T. If T the internal binary map in inverted. The default is NIL.
span                     :pitch or :length. The default is :pitch.


Description:

The function GEN-FILTER-AMBITUS is closely associated with GEN-FILTER-REMOVE.
It is invaluable as an additional and alternative editor enabling the creation of phrase
boundaries when processing long streams of data. Whereas GEN-FILTER-REMOVE selects
a listed pitch or pitches GEN-FILTER-AMBITUS chooses pitches to be removed by
applying a range or ambitus. Inside this range pitches are removed and become rest-
lengths. This is possible because the output of the function is an OMN list. The ambitus
range can be selected by instrument type such a 'flute or 'violin.

(setf mat (integer-to-pitch
           (vector-round -12 24 (gen-noise 30 :seed 12))))
=> (fs3 gs4 e3 a3 gs4 d4 eb4 a5 g4 c6 d4 a3 eb3 f5 fs5
    eb5 f5 fs4 d3 b5 b5 c4 d3 e4 c6 c3 eb3 eb3 eb3 gs5)

(gen-filter-ambitus '(c4 gs5) mat 's)
=> ((-s gs4) (-s - gs4 d4 eb4) (-s g4) (-s d4)
    (-s - f5 fs5 eb5 f5 fs4) (-s - - c4) (-s e4) (-s - - - - gs5))

Notice how sublists are formed by applying this function enabling intricate phrase collections
to be produced. If a single list is required then append the function FLATTEN to the head of
the expression.

(flatten (gen-filter-ambitus '(c4 gs5) mat 's))
=> (-s gs4 -s - gs4 d4 eb4 -s g4 -s d4 -s - f5
    fs5 eb5 f5 fs4 -s - - c4 -s e4 -s - - - - gs5)
One further feature of this function lies in the use of the keyword :invert. This is common
to all GEN-FILTER functions and is based on one of the building blocks of the ltering
process, conversion into a binary list. As a binary list can be inverted (1 0 0 1 1 0) can
become (0 1 1 0 0 1) the possibility of two outcomes can be realised giving the
composer a further possibility of variation.
                                                                                fi
Opusmodus                                                      gen-filter-ambitus   2

(gen-filter-ambitus '(c4 gs5) mat 's :invert t)
=> ((s fs3) (-s e3 a3) (-s - - a5) (-s c6) (-s a3 eb3)
    (-s - - - - d3 b5 b5) (-s d3) (-s c6 c3 eb3 eb3 eb3))


Examples:

The example below demonstrates who velocity can be included within a GEN-FILTER-
AMBITUS expression.

(omn-to-time-signature
 (gen-filter-ambitus '(g3 gs6)
  (vector-to-pitch 'violin (gen-noise 64 :seed 32))
  (vector-to-length 's 1 3 (gen-noise 64 :seed 12))
  :velocity (vector-to-velocity 'pp 'ff (gen-noise 64 :seed 43)))
 '(4 4))
