Opusmodus                                                                     pcs-transpose      1

pcs-transpose n set &optional type
[Function]

Arguments and Values:
n                        an integer - transposition value.
set                      a list of integers - a set.
type                     :integer and :pitch. The default is :integer.


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

The function PCS-TRANSPOSE enables an intervallic statement in pitches or integers to be
transposed in accordance with the protocol attached to the transposition of pitch class
sets. The following guidance is courtesy of Gary Tucker's excellent Basic Introduction to
PITCH CLASS SETS.

When sets are transposed Tn or inverted and transposed TnI, their pc content may do one of
three things. Completely change. Transposing set '(3 5 6 9) up by 5 semitones T5
yields set '(8 10 11 2). This new set shares none of its PCS with '(3 5 6 9); it is
   fl
                                   fl
Opusmodus                                                                  pcs-transpose      2

wholly variant rom '(3 5 6 9). Likewise T1I of '(3 5 6 9) yields set '(4 7 8
10), also completely variant from the original set.

Partly change. T3 of '(3 5 6 9) yields set '(6 8 9 0), preserving PCS 6 and 9.
T10I of '(3 5 6 9) yields set '(1 4 5 7), this time preserving just pcs 5. Both of
these new sets are partly invariant from the original set (though they vary completely from
each other).

Remain completely the same. Both T0 (of course) and T6 of set '(2 3 8 9) yield '(2
3 8 9) again. And both T5I and T11I of '(2 3 8 9) return those same four PCS.
Set '(2 3 8 9) happens to remain wholly invariant under these four operations.


Examples:
(pcs-transpose 3 (pcs '6-z10))
=> (3 4 6 7 8 10)

(pcs-transpose 3 (pcs '6-z10) :pitch)
=> (eb4 e4 fs4 g4 gs4 bb4)

(pcs-transpose '(3 11) (pcs '(5-1 5-8)))
=> ((3 4 5 6 7) (11 1 2 3 5))

(pcs-transpose 4 '(0 1 2 4 5 7 8))
=> (4 5 6 8 9 11 0)

(pcs-transpose '(0 7) (pcs '(5-1 5-8)) :pitch)
=> ((c4 cs4 d4 eb4 e4) (g4 a4 bb4 b4 cs4))

(pcs-transpose '(0 6 11) (pcs '(5-1 5-8 6-z10)))
=> ((0 1 2 3 4) (6 8 9 10 0) (11 0 2 3 4 6))
