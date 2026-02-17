     Opusmodus                                                                        expand-tonality   1

     expand-tonality tonality-form &key type chord
     [Function]

     Arguments and Values:
     tonality-form             (root chord-or-tonality &key variant
                                rotate add remove mod assoc seed)

     type                      :pitch, :integer and :interval. The default is :pitch.
     chord                     T or NIL. The default is NIL. (row output).

     Tonality Form:

     root                      pitch symbol.
     chord                     chord or tonality name.
     add                       an integer (additional intervals).
     remove                    an integer (remove intervals from the chord).
     rotate                    and integer (chordal inversion).
     variant                   a variant symbol: p, r, i, ri, 4, r4, 5, r5 or ? (at random).
     mod                       an integer. The default is 12.
     assoc                     an integer. The default is 12.
     row                       NIL or T. If true then the output is melodize. The default is NIL.
     seed                      NIL or an integer. The default is NIL.


     Description:

     The function EXPAND-TONALITY allows you to expand the tonalities/scales and chords
     de ned in the OPUSMODUS library. Musical material can be quickly developed and
     explored using OPUSMODUS library of scales. Additional tonalities can also be de ned
     with CREATE-TONALITY.


     Examples:

     Retrieve pitch values for a given tonality:

     (expand-tonality '(b3 chromatic))
     => (b3 c4 db4 d4 eb4 e4 f4 gb4 g4 ab4 a4 bb4)

     (expand-tonality '(b3 messiaen-mode6))
     => (b3 db4 eb4 e4 f4 g4 a4 bb4)

     Retrieve pitch values for a given chord:

     (expand-tonality '(c4 maj))
     => (c4 e4 g4)
fi
                                                                                          fi
Opusmodus                                                   expand-tonality   2

(expand-tonality '(as5 11))
=> (as5 d6 f6 gs6 c7 ds7)

(expand-tonality '(cs5 7b9s11))
=> (cs5 f5 gs5 b5 d6 g6)

(expand-tonality '(ds5 maj))
=> (ds5 g5 as5)

Rotate (invert) a scale:

(expand-tonality '(c4 maj :rotate 1))
=> (e4 g4 c5)

Getting chord:

(expand-tonality '(c4 messiaen-mode6 :rotate 1) :chord t)
=> (d4e4f4fs4gs4as4b4c5)

Add intervals:

(expand-tonality '(c4 maj :add (1 3)))
=> (c4 cs4 ds4 e4 g4)

Variants (? = at random):

(expand-tonality '(c4 m/maj13 :variant ?))
=> (c4 a4 f4 cs4 as4 g4 ds4)

Getting integers:

(expand-tonality '(b3 chromatic) :type :integer)
=> (-1 0 1 2 3 4 5 6 7 8 9 10)

Getting intervals:

(expand-tonality '(b3 messiaen-mode6) :type :interval)
=> (2 2 1 1 2 2 1)
