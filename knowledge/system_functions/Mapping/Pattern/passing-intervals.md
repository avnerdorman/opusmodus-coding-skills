Opusmodus                                                                         passing-intervals        1

passing-intervals map sequence &key chord flat prob
                                   section exclude seed omn

[Function]

Arguments and Values:
map                       A list de ning the intervals and steps to insert between notes
                           (<interval><steps>). interval: An integer specifying the musical interval
                          between notes. steps: One or more integers representing the steps to insert
                          between notes at that interval. Multiple step sequences can be provided for
                          random selection.

sequence                  A sequence in OMN (Opusmodus Notation) format. This is a list
                          containing note durations, pitches, dynamics, and other attributes.

chord                     (default NIL): A boolean value (T or NIL). If T, chords in the sequence are
                          included in the processing. If NIL, chords are excluded.

flat                      (default NIL): A boolean value. If T, attens any sublists in sequence into
                          a single list for processing. If NIL, processes each sublist separately.

prob                      (default 0.5): A oating-point number between 0.0 and 1.0.
                          Determines the probability of selecting steps from the beginning or end of the
                          list when multiple step sequences are available.Values less than 0.5 bias
                          selection toward the earlier step sequences. Values greater than 0.5 bias
                          selection toward the later step sequences.

section                   (default NIL): An integer or list of integers specifying which sublists in
                          sequence to process.

exclude                   (default NIL): An integer or list of integers specifying which sublists to
                          exclude from processing.

omn                       (default NIL): A boolean value. If T, forces the output into OMN format.
                          If NIL, the output format matches the input.

seed                      An integer or NIL. If provided, sets the seed for random number generation to
                          ensure reproducible resultsThe default is NIL.


Description:

The PASSING-INTERVALS function inserts additional steps (notes) between existing notes
in a sequence based on speci ed intervals and steps in the map. The durations of the
original notes are proportionally divided to accommodate the inserted steps, ensuring that the
overall length and timing of the sequence remain unchanged.
              ￼
                         fi
                              fi
                                     fl
                                                         fl
    Opusmodus                                                    passing-intervals   2

    (setf omn '(q c4 d4 c4))

    (passing-intervals '(2 1) omn)
    => (q c4 cs4 b3)

    (passing-intervals '(2 (13 -13 13 0)) omn)
    => (s c4 cs5 c4 cs5 q q b4)

    (passing-intervals '((2 (1 1)) (-2 (-1 -1))) omn)
    => (e c4 cs4 d4 cs4 q c4)


    Examples:
    (setf omn1 '(q c4 d4 c4))

    intervals: (2 -2)

    (passing-intervals '((2 (1 1))
                         (-2 (-1 -1))) omn1)
    => (e c4 mf cs4 d4 cs4 q c4)

    (setf omn2 '(q c4 d4 d4f4 g4))

    intervals: (2 (0 3) 2)

    (passing-intervals '((2 (1 1))
                         (-2 (-1 -1))
                         (3 (1 1 1))) omn2)
    => (e c4 mf cs4 q d4 d4f4 g4)

    To add chords to the process, set the keyword :chord to T.

    (passing-intervals '((2 (1 1))
                         (-2 (-1 -1))
                         (3 (1 1 1))) omn2 :chord t)
    => (e c4 mf cs4 q d4 e d4f4 fs4 q g4)

    (setf map1 '((2 (1 1)) (-2 (-1 -1)) (3 (1 1 1))))
    (setf seq1 '(q c4 e4 g4 c5))
￼
                 ￼
    Opusmodus                                                              passing-intervals    3

    (passing-intervals map1 seq1)
    => (q c4 mf 3q e4 f4 fs4 q g4 c5)




    Example with sublists:

    (setf seq2
     '((q gs4 gs4 f4 f4) (q d4 f4 b4 d5) (q f5 e5 gs4 e5)
       (q b4 d5 e5 f5) (q g5 e5 e5 e5) (h d5 gs4)))




    (passing-intervals map1 seq2)
    => ((q gs4 mf gs4 f4 f4) (3q d4 mf eb4 e4 q f4 3q b4 c5 cs5 q d5)
        (q f5 mf e5 gs4 e5) (3q b4 mf c5 cs5 e d5 eb5 q e5 f5)
        (q g5 mf e5 e5 e5) (h d5 mf gs4))




    To make the sublists into one continuing list (internally) we set the keyword :flat to T.

    (passing-intervals map1 seq2 :flat t)
    => ((q gs4 mf gs4 f4 f4) (3q d4 eb4 e4 q f4 3q b4 c5 cs5 d5 eb5 e5)
        (q f5 e5 gs4 e5) (3q b4 c5 cs5 e d5 eb5 q e5 e f5 fs5)
        (q g5 e5 e5 e e eb5) (h d5 gs4))
￼
￼
￼
￼
                 ￼
    Opusmodus                                                               passing-intervals    4

    (setf map2 '((2 (1 1)) (-2 (-1 -1)) (3 (1 1 1)) (4 (1 1 1 1))))
    (setf seq3 '(q bb3 a3 g3 a3c4f4 a4 bb4 c5 b4 c5d5eb5 f5 eb5 d5 c5))




    (omn-to-time-signature
     (passing-intervals map2 seq3) '(4 4))
    => ((q bb3 mf e a3 gs3 g3 gs3 q a3c4f4)
        (q a4 e bb4 b4 q c5 b4)
        (q c5d5eb5 e f5 e5 q eb5 e d5 cs5)
        (q c5))




    (setf seq4 '((q c4 d4 e4 fs4 e a4 c5 q ds5 cs5)
                      (q cs5 ds5 c5 a4 e fs4 e4 q d4 c4)))




    In the example below we use nested step sets. The interval 2 has two sets of steps and the
    interval 3 has four sets of steps to choose from. The step set is selected at random.

    (setf map4 '((-2 (1 1))
                 (2 (-1 -1) (-1 1 1))
                 (3 (1 1 1) (-1 -1 -1) (2 1) (1 2))))

    (passing-intervals map4 seq4)
    => ((3q c4 mf b3 c4 cs4 c4 cs4 e d4 cs4 c4 cs4
          s eb4 e4 3e fs4 f4 e4 e eb4 e4 q f4)
        (3q cs5 mf c5 cs5 q d5 b4 gs4 s f4 fs4 g4 gs4 e a4 bb4 q b4))
￼
￼
￼
￼
                  ￼
    Opusmodus                                               passing-intervals   5


    (setf map5 '((-11 (6 -11) (-1 -1 -1 -1))
                 (-5 (1 1) (-1 1) (6 -11) (-1 -1 -1 -1))
                 (3 (1 2 1) (2 2 2) (2 1) (1 2 2 2))
                 (-3 (-1 -1 11) (2 2 2) (2 1) (1 2 2 2))
                 (20 (13 -11 13 -11))))

    (setf seq5 '((q f4 cs6 gs7 b7) (q c7 bb3 g3 e2) (e a0 fs4 d6 eb6)))




    (passing-intervals map5 seq5 :flat t)
    => ((s f4 mf fs5 g4 gs5 q a4 s e6 f6 g6 a6 b6 bb6 a6 gs6)
        (q g6 3q f3 e3 eb3 q d4 b2)
        (e e1 t cs5 d6 eb5 e6 e f5 fs5))
￼
￼
                ￼
