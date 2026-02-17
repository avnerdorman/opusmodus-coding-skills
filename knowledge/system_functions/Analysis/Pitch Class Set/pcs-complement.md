Opusmodus                                                                          Function      1

pcs-complement set &optional type
[Function]

Arguments and Values:
set                      an integer set.
type                     :forte, :pitch, :vector and :prime. The default is :integer.


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
hyphen is the ORDINAL NUMBER of the set, its position on the list of PRIME-FORMS.

The function PCS-COMPLEMENT returns a complement set to a given set. Two sets are
in the complement relation when one contains all the pcs that are excluded from the other.


Examples:
(pcs-complement '(0 5 6 2 4 7 9))
=> (1 3 8 10 11)

(pcs-complement '(0 5 6 2 4 7 9) :prime)
=> (0 2 3 5 7)
   fl
                                   fl
Opusmodus                                            Function   2


(pcs-complement '(0 5 6 2 4 7 9) :forte)
=> 5-23

(pcs-complement '(0 5 6 2 4 7 9) :pitch)
=> (cs4 eb4 gs4 bb4 b4)

(pcs-complement '(0 5 6 2 4 7 9) :vector)
=> (1 3 2 1 3 0)

The cardinality of the two sets must add up to 12:

(pcs-complement (pcs '4-13) :forte)
=> 8-13b
