Opusmodus                                                                               gen-chord    1

gen-chord ambitus-chord chord-low chord-high
                transpose-low transpose-high pitches
                &key count rnd-octaves ambitus remove seed

[Function]

Arguments and Values:
ambitus-chord           an integer.
chord-low               an integer.
chord-high              an integer.
transpose-low           an integer.
transpose-high          an integer.
pitches                 list or lists of pitches.
count                   an integer.
remove                  an integer or list of integers.
rnd-octaves             NIL or T. The default is NIL.
ambitus                 instrument name or an integer or pitch list (low high). The default is 'piano.
seed                    NIL or number. The default is NIL.


Description:

The function GEN-CHORD enables the composer to generate chords from a list of pitches.

(gen-chord 11 2 2 0 0 '(c4 cs4 fs4 g4 c5 f5 fs5 b5))
=> (c4db4 gb4g4 c5f5 gb5b5)

(gen-chord 11 2 2 -5 7 '(c4 cs4 fs4 g4 c5 f5 fs5 b5))
=> (f4gb4 ab4a4 a4d5 a5d6)

(gen-chord 11 2 3 -5 7 '(c4 cs4 fs4 g4 c5 f5 fs5 b5) :count 12)
=> (f4fs4b4 bb4eb5gs5 bb5eb6e5 a3d4eb4 bb4eb5e5
    a4bb3b3 cs5d5 fs5b5c6 fs6g5 gs3cs4 cs5fs5 cs5d5)

The size of the chord generated will lie between chord-low and chord-high
parameters. The transposition of pitch values can also be set to lie between transpose-
low and transpose-high parameters. In the rst preliminary example the list of pitches
is 'bundled', a common device in serial music. In the second, the same bundling takes place
but with transpositions between a perfect fourth below and a perfect fth above.
                                            fi
                                                                   fi
Opusmodus                                                                     gen-chord      2

Examples:
(gen-chord
 11 1 2 0 0
 '(c4 cs4 d4 ds4 = = e4 f4 fs4 g4 gs4 = = a4 as4 b4))
=> (c4db4 d4 eb4 eb4e4 f4gb4 g4ab4 ab4 ab4a4 bb4 b4)

(gen-chord
 13 1 5 0 1
 '((c4 cs4 d4 ds4 e4) (f4 fs4 g4 gs4 a4 as4 b4)) :remove 3)
=> ((db4d4eb4e4 e4) (gb4g4 ab4a4bb4b4 b4))

(gen-chord
 13 1 3 0 1
 (gen-repeat
  4 (list '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4)))
 :rnd-octaves t)
=> ((db3d3 eb1 e7f7 f6gb6g6 ab4a4bb4 b2)
    (c6db6 eb4e4 e3f3gb3 ab6 a4bb4b4 b1)
    (c5db5d5 eb6 f1gb1g1 g2ab2 bb2b2c3)
    (db7 d3eb3e3 e1 gb6g6 g3 a2bb2b2 c2))

This example is taken from part of the rst of Fifteen Images for keyboard by Nigel Morgan
In this 'image' two tonalities are mixed together like two colours on a painter's palette.

(setf p1 (gen-chord
          24 2 4 -5 7
          (gen-repeat 10 '(e4 f4 a4 ds5 e5)) :seed 78))

(setf p2 (gen-chord
          24 2 4 -7 5
          (gen-repeat 10 '(f4 b4 ds5 e5 a5)) :seed 78))

(setf chords (flatten (gen-combine p1 p2)))
=> (c4db4f4 b3f4a4 e5f5f4gb4 eb5ab5e4bb4 ab4d5
    c5db5 g5g4 bb5gb4 f4a4 a4db5 bb4b4 a4d5
    f4gb4bb4e5 e4bb4d5eb5 eb5eb4 gb5d4 ab4c5gb5g5
    c5e5f5bb5 b4c5e5 bb4e5ab5 a5bb5bb4 ab5db6a4
    g4b4f5 b4eb5e5 db5db4d4 e5c4gb4 f4b4c5
    a4bb4eb5 a4bb4 ab4d5 c5gb5g5g4
    e5f5bb5gb4 eb4g4db5 g4b4c5 eb5 gb5)
                               fi
Opusmodus                                                                         gen-chord    3

(pitch-list-plot chords)




The essence of this function lies in the effect of changing chord size and the transposition
possibilities afforded by the range set in the two transpose arguments.

(setf selection
      (sort-asc
       (find-unique
        (rnd-sample 12
         (gen-integer (length chords)) :seed 67))))
=> (1 6 9 12 14 24 32 34 35)

(setf arpeggiate-some
      (sort-asc
       (pitch-melodize (mclist chords) :section selection)
       :section selection))
=> ((c4db4f4) (b3 f4 a4) (e5f5f4gb4) (eb5ab5e4bb4)
    (ab4d5) (c5db5) (g4 g5) (bb5gb4) (f4a4) (a4 db5)
    (bb4b4) (a4d5) (f4 gb4 bb4 e5) (e4bb4d5eb5)
    (eb4 eb5) (gb5d4) (ab4c5gb5g5) (c5e5f5bb5) (b4c5e5)
    (bb4e5ab5) (a5bb5bb4) (ab5db6a4) (g4b4f5) (b4eb5e5)
    (db4 d4 db5) (e5c4gb4) (f4b4c5) (a4bb4eb5) (a4bb4)
    (ab4d5) (c5gb5g5g4) (e5f5bb5gb4) (eb4 g4 db5)
    (g4b4c5) (eb5) (gb5))
