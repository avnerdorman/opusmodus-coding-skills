Opusmodus                                                              expand-chord-name    1

expand-chord-name name &key type
[Function]

Arguments and Values:
name                     the name of the chord.
type                     display result as :integer, :interval or :pitch.
                         The default is :integer.


Description:

Musical material can be quickly developed and explored using OPUSMODUS library of
chords. Additional chords can also be de ned with CREATE-CHORD. EXPAND-CHORD-
NAME allows you to extract the composition of chords stored in the Opusmodus system as
either integers (chromatic steps from the tonic), pitches (ascending from a c4 tonic), or
intervals.


Examples:
(expand-chord-name 'maj)
=> (0 4 7)

(expand-chord-name 'maj :type :pitch)
=> (c4 e4 g4)

(expand-chord-name 'maj :type :interval)
=> (4 3)

(expand-chord-name '(7/b9/s11 9/s11) :type :pitch)
=> ((c4 e4 g4 bb4 cs5 fs5) (c4 e4 g4 bb4 d5 fs5))

(expand-chord-name '((7/b9/s11 9/s11) (7 9/s11)) :type :pitch)
=> (((c4 e4 g4 bb4 cs5 fs5) (c4 e4 g4 bb4 d5 fs5))
    ((c4 e4 g4 bb4) (c4 e4 g4 bb4 d5 fs5)))
                                 fi
