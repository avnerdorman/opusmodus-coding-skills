Opusmodus                                                             gen-direction-series      1

gen-direction-series size position direction sequence
                                      &key encode seed

[Function]

Arguments and Values:
size                    an integer or list of integers.
position                an integer or list of integers.
direction               a list of items: 'a (ascending) 'd (descending) or '? (at random).
sequence                a sequence.
encode                  T or NIL. With :encode T (the default) the function transforms OMN repeat
                        symbols (=) into its values, while :encode NIL returns selections
                        unchanged.
seed                    NIL or an integer (random seed). The default is NIL.


Description:

This function returns a list of items speci ed by size, position and direction
values. The following examples demonstrate just how many options the play of argument
parameters allow.

(gen-direction-series '(3 3 3) '(0 0 0) '(d a d)
                      '(c4 d4 e4 f4 g4 a4 b4))
=> ((c4 b4 a4) (c4 d4 e4) (c4 b4 a4))

(gen-direction-series '(3 3 3) '(0 0 6) '(a a d)
                      '(c4 d4 e4 f4 g4 a4 b4))
=> ((c4 d4 e4) (c4 d4 e4) (b4 a4 g4))


Examples:
(gen-direction-series '(3 3 3) '(1 1 1) '(d a d)
                      '(c4 d4 e4 f4 g4 a4 b4))
=> ((d4 c4 b4) (d4 e4 f4) (d4 c4 b4))

(gen-direction-series '(3 3 3) '(-1 1 2) '(d a ?)
                      '(c4 d4 e4 f4 g4 a4 b4))
=> ((b4 a4 g4) (d4 e4 f4) (e4 f4 g4))

(gen-direction-series '(4 4 4) '(-1 0 -2) '(? d ?)
                      '(c4 d4 e4 f4 g4 a4 b4))
=> ((b4 a4 g4 f4) (c4 b4 a4 g4) (a4 g4 f4 e4))
                                 fi
Opusmodus                                                           gen-direction-series   2

(gen-direction-series
 (rndn 6 3 7) (rndn 6 0 9) (rnd-sample 6 '(d a d))
'(c4 d4 e4 f4 g4 a4 b4))
=> ((d4 c4 b4) (d4 c4 b4 a4 g4) (b4 c4 d4 e4 f4 g4)
    (c4 b4 a4 g4) (c4 b4 a4 g4 f4 e4 d4) (b4 a4 g4 f4))

In the nal example above it's possible to see just how a composer might use this function to
generate multi-directional patterns to create Ligeti like textures within an ensemble piece.

(gen-direction-series
 '(4 4 4) '(-1 0 -2) '(? d ?)
 '(s c4 mp e4 d4 g4 e a4 p fs4 gs4 b4 s ds4 mf cs4 f4 bb4) :seed 45)
=> ((s bb4 mf f4 cs4 ds4)
    (s c4 mp bb4 mf f4 cs4)
    (s f4 mf cs4 ds4 e b4 p))


Score Example:
(progn
 (setf size (rnd-sample 36 '(3 4 5)))
 (setf position (rnd-sample 36 '(0 -1 2 -3 4 -5 6 -7 8 -9 10 -11)))
 (setf mat '(5q c4 mp leg e4 leg d4 leg g4 leg+fermata-s a4 s fs4 f
             gs4 b4 leg+fermata ds4 3e cs4 p leg f4 leg bb4))

     (setf series (gen-direction-series size position '? mat))
     (setf chords (pitch-chordize
                   series
                   :section (rnd-sample 18 (gen-integer 0 (length series))
                             :norep t)))

     (setf split (split-lengths chords :type :tuplet))
     (setf fit (length-fit split :type :rest))
     (setf omn (rnd-octaves '(c1 c7) fit))

     (def-score series
                (:composer "OPMO"
                 :copyright "Copyright © 2017 Opusmodus"
                 :key-signature 'chromatic
                 :time-signature (get-time-signature omn)
                 :tempo 112
                 :layout (grand-layout 'piano))
      (piano
       :omn omn :channel 1 :sound 'gm :program 0 :volume 127))
)
fi
