Opusmodus                                                                                pcs     1

pcs name &optional type
[Function]

Arguments and Values:
name                     pitch-class-set name (Forte).
type                     :pitch and :vector. The default is :integer.


Description:

Allen Forte's unique notation system commonly known as Forte Notation in which he
extrapolates from the serial theory of Milton Babbitt, proposes a musical SET THEORY of
pitch-class-set analysis analogous to mathematical set theory. This has the avowed intention
of providing a method for the analysis of serial or non-serial atonal music. Forte's system is
equally at home describing Ives and Stravinsky as it is Schoenberg and Webern.

In the integer model of pitch, all pitch classes and intervals between pitch classes are
designated using the numbers 0 through 11. It is a common analytical and compositional
tool when working with chromatic music, including twelve tone, serial, or otherwise atonal
music. Such a system able to deal with intervallic relationships from pitch class
extrapolations of material has a potential within Opusmodus to be itself a generator of pitch
series.

Pitch-class, one of the 12 pitch-classes designated by integers 0 11. Pitch-class 0 refers to
all notated pitches C, B-sharp, D-double- at. Pitch-class 1 refers to all notated pitches C-
sharp, D- at, B-double-sharp, and so on.

The name of PCS consisting of two numerals separated by a hyphen. The numeral to the left
of the hyphen is the CARDINAL-NUMBER of the set, the numeral to the right of the
hyphen is the ORDINAL-NUMBER of the set, its position on the list of PRIME-FORMS.


Examples:
(pcs '6-Z10)
=> (0 1 3 4 5 7)

(pcs '9-7 :pitch)
=> (c4 cs4 d4 eb4 e4 f4 g4 gs4 bb4)

(pcs '9-7 :vector)
=> (6 7 7 6 7 3)
   fl
                                   fl
     Opusmodus                                                                          pcs   2

     The nal parameter is an PCS name list and expects the composer to make explicit reference
     to the Forte Notation name for a particular pitch-class set. Thus, the name 3-1 denotes a
     pitch class set of 0,1,2 and the interval vector, 210000, an ordered array of numerals
     representing the interval content of the pitch class set.

     (pcs '(3-1 3-8))
     => ((0 1 2) (0 2 6))

     (pcs '(3-1 3-8) :pitch)
     => ((c4 cs4 d4) (c4 d4 fs4))

     (pcs '(3-1 3-8) :vector)
     => ((2 1 0 0 0 0) (0 1 0 1 0 1))
fi
