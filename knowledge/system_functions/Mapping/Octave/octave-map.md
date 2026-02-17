     Opusmodus                                                                                     octave-map   1

     octave-map map pitches &key flatten section exclude
     [Function]

     Arguments and Values:
     map                        a list of pitches or octave numbers.
     pitches                    a list of pitches.
     flatten                    T or NIL. The default is NIL.
     section                    an integer or list of integers. Selected list or lists to process.
                                The default is NIL.
     exclude                    an integer or list of integers. Excluded list or lists from process.
                                The default is NIL.


     Description:

     OCTAVE-MAP will map a series of pitch octave values to a list or lists of pitches.

     (octave-map '(c3 cs3 e5 f5 fs6 g5 gs4 a4 as3 b3)
                 '(c3 d3 e3 f3 g4 f4 e4 d4 c4 cs4))
     => (c3 d3 e5 f5 g6 f5 e4 d4 c3 cs3)

     (octave-map '(3 3 5 5 6 5 4 4 3 3)
                 '(c3 d3 e3 f3 g4 f4 e4 d4 c4 cs4))
     => (c3 d3 e5 f5 g6 f5 e4 d4 c3 cs3)

     This function is useful when you have a composed or generated material that has a wide
     compass, a passage for piano that moves between two hands. You want to create variations
     on this passage changing the pitches and rhythms but retain the distinctive octave
     positioning.


     Examples:
     (octave-map
      '(c3 cs3 e5 f5 fs6 g5 gs4 a4 as3 b3)
      '((c3 d3 e3 f3) (g4 f4 e4 d4) (c4 cs4)) :flatten t)
     => ((c3 d3 e5 f5) (g6 f5 e4 d4) (c3 cs3))

     In the example above the use of flatten T makes it possible to spread the octave mapping
     across a series of lists. This is important if the pitch material is already organised into lists to
      t a changing metres.
fi
Opusmodus                                                                  octave-map    2

(octave-map
 '(c3 cs3 e5 f5 fs6 g5 gs4 a4 as3 b3)
 '((e c3 d3 e3 f3) (s g4 f4 - e4 d4 -) (q c4 cs4))
 :flatten t)
=> ((e c3 d3 e5 f5) (s g6 f5 - e4 d4 -) (q c3 cs3))

(octave-map
 '((s c3 cs3 e7 - f5 fs6 g6 = gs7 a4 as7 = b3))
 '((e c3 d3 e3 f3) (s g4 f4 - e4 d4 -) (q c4 cs4))
 :section 1)
=> ((e c3 d3 e3 f3) (s g3 f3 - e7 d5 -) (q c4 cs4))

(octave-map
 '((s c3 cs3 e7 - f5 fs6 g6 = gs7 a4 as7 = b3))
 '((e c3 d3 e3 f3) (s g4 f4 - e4 d4 -) (q c4 cs4))
 :section 1 :flatten t)
=> ((e c3 d3 e3 f3) (s g6 f6 - e6 d7 -) (q c4 cs4)))

In this nal example one list :section 1 follows the octave mapping. This increases the
opportunities further for more variation.
fi
