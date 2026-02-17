Opusmodus                                                                                       dechord   1

dechord sequence &key pitch type section exclude seed
[Function]

Arguments and Values:
sequence                    A list of pitches or an OMN (Opusmodus Notation) form sequence.

pitch                       Speci es which pitch of the chord to select. Possible values are:
                            1: Selects the 1st pitch of the chord.
                            2: Selects the 2nd pitch of the chord.
                            3: Selects the 3rd pitch of the chord.
                            4: Selects the 4th pitch of the chord.
                            root: Selects the root pitch of the chord in ascending order.
                            top: Selects the highest pitch of the chord.
                            low: Selects the lowest pitch of the chord.
                            high: Selects the highest pitch of the chord.
                            ?: Selects a pitch at random.
                            The default is root.

type                        Determines the type of pitch collection:
                            NIL: The default, which returns the pitch as is.
                            'pcs: Returns the pitch in normal-order (Pitch Class Set).

section                     An integer or a list of integers specifying which sections to process.
                            The default is NIL.

exclude                     An integer or a list of integers specifying which sections to exclude from
                            processing. The default is NIL.

seed                        An integer or NIL. Provides a seed for random selection, ensuring the same
                            result each time the function is evaluated. The default is NIL.


Description:

The DECHORD function extracts a speci c note from each chord found within a given
sequence. The user can specify which pitch to select from each chord, with various options
such as the root, top, lowest, highest, or a random pitch. The function also
supports normal-order pitch collections when the type argument is set to 'pcs.
Additionally, sections of the sequence can be included or excluded from processing.
                       fi
                                    fi
Opusmodus                                                                    dechord     2

Examples:

Extracts the root pitch from each chord by default:

(dechord '(q c4 f4a4d5 e fs5))
=> (q c4 mf f4 e fs5)

Extracts the root pitch but returns it in normal-order (Pitch Class Set):

(dechord '(q c4 f4a4d5 e fs5) :type 'pcs)
=> (q c4 mf d5 e fs5)

Selects the 2nd pitch from each chord:

(dechord '(q c4 f4a4d5 e fs5) :pitch 2)
=> (q c4 mf a4 e fs5)

Selects the 2nd pitch and returns it in normal-order:

(dechord '(q c4 f4a4d5 e fs5) :pitch 2 :type 'pcs)
=> (q c4 mf f4 e fs5)

Applies the default pitch selection to a sequence of chords:

(dechord '((q c4 f4a4d5 e fs5) (s cs4 d4 fs4 q c4e4gs4)))
=> ((q c4 mf f4 e fs5) (s cs4 mf d4 fs4 q c4))

Selects the highest pitch from each chord and returns it in normal-order:

(dechord '((q c4 f4a4d5 e fs5) (s cs4 d4 fs4 q c4e4gs4))
         :pitch 'top :type 'pcs)
=> ((q c4 mf a4 e fs5) (s cs4 mf d4 fs4 q gs4))

Selects the lowest pitch from each chord:

(dechord '((q c4 f4a4d5 e fs5) (s cs4 d4 fs4 q c4e4gs4)) :pitch 'low)
=> ((q c4 mf f4 e fs5) (s cs4 mf d4 fs4 q c4))

Selects the highest pitch from each chord:

(dechord '((q c4 f4a4d5 e fs5) (s cs4 d4 fs4 q c4e4gs4)) :pitch 'high)
=> ((q c4 mf d5 e fs5) (s cs4 mf d4 fs4 q gs4))

Each example demonstrates a speci c use case of the DECHORD function, highlighting how
to select various pitches from chords in a sequence.
                              fi
