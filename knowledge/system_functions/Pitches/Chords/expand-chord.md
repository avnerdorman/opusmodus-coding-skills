Opusmodus                                                                             expand-chord   1

expand-chord chord-form
[Function]

Arguments and Values:
chord-form                 (root chord &key variant rotate add
                            remove mod assoc seed row)

Chord Form:

root                       pitch symbol.
chord                      chord or tonality name.
add                        an integer (additional intervals).
remove                     an integer (remove intervals from the chord).
rotate                     and integer (chordal inversion).
variant                    a variant symbol: o, r, i, ri, 4, r4, 5, r5 or ? (at random).
mod                        an integer. The default is 12.
assoc                      an integer. The default is 12.
row                        NIL or T. If true then the output is melodize. The default is NIL.
seed                       NIL or an integer. The default is NIL.


Description:

Musical material can be quickly developed and explored using OPUSMODUS library of
chords. Additional chords can also be de ned with create-chord. EXPAND-CHORD allows
you to quickly construct chords for any pitch, using any chord de ned in the
OPUSMODUS library.


Examples:

Retrieve pitch values for a given chord:

(expand-chord '(c4 maj))
=> (c4e4g4)

(expand-chord '(cb3 messiaen-mode6))
=> (b3db4eb4e4f4g4a4bb4)

(expand-chord '(as5 11))
=> (as5d6f6gs6c7ds7)

Rotate (invert) a chord:

(expand-chord '(c4 maj :rotate 1))
=> (e4g4c5)
                                    fi
                                                                  fi
Opusmodus                                                                expand-chord   2

(expand-chord '(c messiaen-mode6 :rotate 1))
=> (d4e4f4fs4gs4as4b4c5)

Melodize a chord:

(expand-chord '(cs5 7/b9/s11 :row t))
=> (cs5 f5 gs5 b5 d6 g6)

(expand-chord '(cb4 chromatic :row t))
=> (b3 c4 db4 d4 eb4 e4 f4 gb4 g4 ab4 a4 bb4)

(expand-chord '(ds5 maj :row t))
=> (ds5 g5 as5)

Add intervals:

(expand-chord '(c4 maj :row t :add (1 3)))
=> (c4 cs4 ds4 e4 g4)

Variants (? = at random):

(expand-chord '(c4 m/maj13 :variant ?))
=> (c4a4f4cs4as4g4ds4)

(expand-chord '((c4 maj7) (f4 maj7) (f4 m7) (g4 7) (c4 maj7)))
=> (c4e4g4b4 f4a4c5e5 f4gs4c5ds5 g4b4d5f5 c4e4g4b4)

To extract information about chords in terms of integer and intervals, see EXPAND-CHORD-
NAME.
