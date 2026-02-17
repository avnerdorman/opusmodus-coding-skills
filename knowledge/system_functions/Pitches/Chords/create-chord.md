Opusmodus                                                                  create-chord   1

create-chord name chord
[Macro]

Arguments and Values:
name                     the name of the chord (without tonic).
chord                    a list of chromatic integers de ning the chord.


Description:

Musical material can be quickly developed and explored using OPUSMODUS library of
chords. CREATE-CHORD quickly allows you to de ne chords to use in your own
compositions.


Examples:

For example the following chord might be one of the building-blocks of a composition:

cs4f4a4

Working from the tonic cs4, we can de ne these pitches as a chord object thus:

(create-chord my-chord '(0 4 8))

And create transpositions using EXPAND-CHORD:

(expand-chord '(cs4 my-chord))
=> (cs4f4a4)

(expand-chord '(as4 my-chord))
=> (as4d5fs5)

To extract information about chords see EXPAND-CHORD and EXPAND-CHORD-NAME.
                                 fi
                                              fi
                                              fi
