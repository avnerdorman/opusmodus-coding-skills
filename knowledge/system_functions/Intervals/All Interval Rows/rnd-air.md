     Opusmodus                                                                            rnd-air   1

     rnd-air &key group type seed
     [Function]

     Arguments and Values:
     group                     NIL, :all, :symmetric or :asymmetric. The default is NIL.
     type                      :integer :pitch or :interval. The default is :integer.
     seed                      an integer or NIL. The default is NIL.


     Description:

     In music, an all-interval twelve-tone row is a twelve-tone tone row arranged so that it
     contains one instance of each interval within the octave, 1 through 11: a "twelve-note spatial
     set made up of the eleven intervals [between consecutive pitches]. There are 1,928 distinct
     all-interval twelve-tone rows."Distinct" in this context means in transpositionally and
     rotationally normal form (yielding 3856 such series), and disregarding inversionally related
     forms.

     The rst all-interval row, devised by Fritz Heinrich Klein: F, E, C, A, G, D, Ab, Db, Eb, Gb,
     Bb, Cb. '(0 11 7 4 2 9 3 8 10 1 5 6) This row was also used by Alban Berg in
     his Lyric Suite (1926).

     Related to this is THE GRANDMOTHER CHORD. It is an eleven-interval, twelve-note,
     invertible chord with all of the properties of the Mother chord. Additionally, the intervals are
     so arranged that they alternate odd and even intervals (counted by semitones) and that the
     odd intervals successively decrease by one while the even intervals successively increase by
     one. It was invented by Nicolas Slonimsky. The sum of numbers 1 through 11 = 66 and thus
     the chord contains a tritone between its outer notes and as its sixth (middle) interval, and
     between the two notes directly outside of those, etc... All-interval series can be found in
     many works including Luigi Nono's Il canto sospeso and Night Fantasies by Eliott Carter.

     Random selection of an all-interval-row of a given group. If group is not given NIL
     then :symmetric or :asymmetric group will be chosen at random. To understand
     fully the context of this function see the function AIR.

     The composer Elliott Carter employed all-interval sets to create chord sequences. The sets
     were derived from lists made by Bauer-Mendelberg and Ferentz and were used to give his
     music 'a "tonic" sonority’.
fi
Opusmodus                                                       rnd-air   2

Let's make some chords from an all-interval set.

(setf my-rnd-air (rnd-air :seed 45))
=> (0 1 8 5 7 10 9 3 11 4 2 6)

(setf my-rnd-air-p (rnd-air :type :pitch :seed 45))
=> (c4 cs4 gs4 f4 g4 bb4 a4 eb4 b4 e4 d4 fs4)

(setf diads-1 (chordize-list (gen-divide 2 my-rnd-air-p)))
=> (c4cs4 gs4f4 g4bb4 a4eb4 b4e4 d4fs4)

(setf diads-2
     (chordize-list (gen-divide 2 (gen-rotate -1 my-rnd-air-p))))
=> (cs4gs4 f4g4 bb4a4 eb4b4 e4d4 fs4c4)

(setf all-diads-seq (gen-combine diads-1 diads-2))
=> ((c4cs4 cs4gs4) (gs4f4 f4g4) (g4bb4 bb4a4)
    (a4eb4 eb4b4) (b4e4 e4d4) (d4fs4 fs4c4))


Examples:
(rnd-air)
=> (0 1 11 8 4 9 3 10 2 5 7 6)

(rnd-air :group :symmetric :type :pitch)
=> (c4 e4 g4 gs4 eb4 f4 b4 a4 d4 cs4 bb4 fs4)

(rnd-air :group :symmetric :type :interval)
=> (1 8 -5 -2 3 6 -3 2 -7 4 -1)

Assettare un :seed per assicurare un output coerente:

(rnd-air :group :asymmetric :type :pitch :seed 72)
=> (c4 cs4 bb4 f4 g4 b4 a4 d4 gs4 e4 eb4 fs4)
