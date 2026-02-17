Opusmodus                                                                             gen-chord2    1

gen-chord2 count chord-size pitches &key ambitus-chord
                offset transpose rnd-octaves ambitus seed

[Function]

Arguments and Values:
count                  an integer or list of integers (number of chords).
chord-size             an integer or list of integers (size of chords).
pitches                list or lists of pitches.
offset                 an integer or list of integers.
ambitus-chord          an integer or list of integers.
transpose              an integer or list of integers.
rnd-octaves            NIL or T. The default is NIL.
ambitus                instrument name or an integer or pitch list (low high). The default is 'piano.
seed                   NIL or number. The default is NIL.


Description:

The function GEN-CHORD2 enables the composer to generate chords from a list of
pitches. The count value sets the number of chords to be generated. The size of the
chord is determined by the chord-size parameters.

Keywords like :transpose, :ambitus-chord, :rnd-octaves, :ambitus
and :offset are further parameters used within the function.

(setf row (rnd-row :type :pitch :seed 245))
=> (c4 cs4 e4 eb4 b4 fs4 gs4 a4 bb4 d4 f4 g4)

(gen-chord2 4 '(3 3 3 3) row)
=> (c4cs4e4 eb4b4fs4 gs4a4bb4 d4f4g4)

(gen-chord2 4 '(2 2 3 4) row :offset '(2 2 -1 1))
=> (e4eb4 b4fs4 eb4b4fs4 b4fs4gs4a4)

(gen-chord2 4 '(2 2 3 4) row :offset '(2 0 -1 0))
=> (e4eb4 e4eb4 cs4e4eb4 cs4e4eb4b4)

(gen-chord2 4 '(4 3) row)
=> (b4fs4gs4a4 a4bb4d4 g4c4cs4e4 e4eb4b4)

(gen-chord2 '(12 6) '(3 4)
            '((c4 cs4 d4 ds4 e4 f4) (fs4 g4 gs4 a4 as4 b4)))
=> ((eb4e4f4 cs4d4eb4e4 e4f4c4 d4eb4e4f4 f4c4cs4 eb4e4f4c4
     c4cs4d4 e4f4c4cs4 cs4d4eb4 f4c4cs4d4 d4eb4e4 c4cs4d4eb4)
    (a4bb4b4 g4gs4a4bb4 bb4b4fs4 gs4a4bb4b4 b4fs4g4 a4bb4b4fs4))
Opusmodus                                                                 gen-chord2     2

Examples:

If :offset is NIL (the default) then the chord-size value determines the offset value.

(gen-chord2 4 '(4 3) row :offset '(2 3 -2))
=> (e4eb4b4fs4 fs4gs4a4 eb4b4fs4gs4 fs4gs4a4)

(gen-chord2 4 '(4 3) row
            :offset '(2 3 -2)
            :transpose '(0 6 1 13))
=> (e4eb4b4fs4 c5d5eb5 e4c5g4a4 g5a5bb5)

(gen-chord2 4 '(4 3) row
            :offset '(2 3 -2)
            :transpose '(0 6 1 13)
            :rnd-octaves t)
=> (e2eb2b1fs2 c2d2eb2 e2c2g2a1 g6a6bb6)
