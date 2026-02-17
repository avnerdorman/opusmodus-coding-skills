Opusmodus                                                                             ambitus-chord     1

ambitus-chord size sequence &key unique section exclude
[Function]

Arguments and Values:
size                    An integer or a list of integers representing the outer interval sizes in
                        semitones. This parameter sets the maximum span for each chord to make
                        them more playable. If size is provided as a list, each value is applied
                        consecutively to the corresponding sublist in the sequence. This means the rst
                        value in the size list applies to the rst sublist in the sequence, the second
                        value to the second sublist, and so on, allowing for distinct ambitus
                        adjustments across different parts of the sequence.

sequence                An OMN (Opusmodus Notation) form list or a list of pitch sequences.

unique                  (optional): A boolean value (NIL or T). When set to T (default), the function
                        ensures that each chord contains unique pitches by removing duplicates.

section                 (optional): An integer or a list of integers specifying the sections of the
                        sequence to which the ambitus adjustment should be applied. If not provided,
                        the function processes the entire sequence.

exclude                 (optional): An integer or a list of integers indicating the sections of the
                        sequence that should be excluded from processing. By default,
                        all sections are included.


Description:

The AMBITUS-CHORD function adjusts a sequence of chords to make them more playable.
It limits the span of each chord based on the provided size parameters, ensuring the tones
are within a manageable distance for a player. Additionally, it can remove duplicate tones
from each chord when the unique ag is set. This function is particularly useful in
chromatic tonality compositions, where chord tones might be too widely spread or contain
duplicates.


Examples:

Basic usage with a single size parameter:

(ambitus-chord 13 '(eb4c4c6 d4))
=> (eb4c4c5 d4)

(ambitus-chord 14 '(eb4c6 c4fs4c4))
=> (eb4c5 c4fs4)
                             fl
                                                       fi
                                                                                                fi
Opusmodus                                                     ambitus-chord   2

(ambitus-chord 14 '((eb4c6 c4fs4 b4) (c4b4 b3eb5b3)))
=> ((eb4c5 c4fs4 b4) (c4b4 b3eb4))

Adjusting a sequence with different sizes for each chord:

(ambitus-chord '(16 6) '(c3g3e4 c3g3e4))
=> (c3g3e4 c4g3gs3)

Adjusting a sequence with different sizes for each sublist:

(ambitus-chord '(14 6) '((eb4c6 c4fs4 b4) (c4b4 b3eb5b3)))
=> ((eb4c5 c4fs4 b4) (c4b3 b3eb4))

(ambitus-chord '(16 6 6) '((c3g3e4 c3g3e4 c3g3e4) (c3g3e4) (c3g3e4)))
=> ((c3g3e4 c3g3e4 c3g3e4) (c4g3gs3) (c3g3e4))

(ambitus-chord '(16 6) '(c3g3e4 c3g3e4 c3g3e4 c3g3e4 c3g3e4))
=> (c3g3e4 c4g3gs3 c3g3e4 c4g3gs3 c3g3e4)

(ambitus-chord '((16 6 11) (6) (6))
               '((c3g3e4 c3g3e4 c3g3e4) (c3g3e4) (c3g3e4)))
=> ((c3g3e4 c4g3gs3 c3g3e3) (c4g3gs3) (c4g3gs3))

Applying adjustment to speci c sections of a sequence:

(ambitus-chord '(13 6) '((eb4c6 c4fs4 b4)
                         (c4b4 b3eb5b3)
                         (eb4c6 c4fs4 b4))
               :section '(0 2))
=> ((eb4c5 c4fs4 b4) (c4b4 b3eb5b3) (eb4c4 c4fs4 b4)

Contextual example using generated chords:

(setf chords
      (gen-chord2 12 '(4 3)
                  (vector-to-pitch '(c2 c5)
                                    (gen-noise 150 :seed 3))))
=> (g2eb2fs4bb2 a3gs2c3 bb3f3f3a4 a3b4e3 c3g2fs4fs4 e4f4gs3
    fs2b4b4eb3 fs2fs3b4 e2g2fs2g2 gs4gs2c4 cs3eb3g3cs3 b3b2bb4)

(ambitus-chord '(13 6 6 6 13 6) chords)
=> (g2eb2fs2bb2 a2gs2c3 bb3f3a3 a3b3gs3 c4g3fs4 e4f4gs4
    fs4b4eb4 fs3b3 e2g2fs2 gs3c4 cs3eb3g3 b3bb3)

OMN:

(ambitus-chord 14 '((q eb4c6 e c4fs4 b4)
                    (e c4b4 s b3ds5b3 =)))
=> ((q eb4c5 e c4fs4 b4) (e c4b4 s b3eb4 b3eb4))
                       fi
