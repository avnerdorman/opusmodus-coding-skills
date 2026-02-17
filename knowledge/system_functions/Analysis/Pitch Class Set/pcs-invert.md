Opusmodus                                                                        pcs-invert      1

pcs-invert set transpose &optional type
[Function]

Arguments and Values:
set                      pitch class set.
transpose                an integer.
type                     :integer or :pitch. The default is :integer.


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

The function PCS-INVERT enables an intervallic statement in pitches or integers to be
inverted.
   fl
                                   fl
Opusmodus                                                    pcs-invert   2

Examples:
(pcs '6-z10)
=> (0 1 3 4 5 7)

(pcs-invert (pcs '6-z10) 0)
=> (0 11 9 8 7 5)

(pcs-invert (pcs '6-z10) 0 :pitch)
=> (c4 b4 a4 gs4 g4 f4)

(pcs-invert (pcs '9-7) 0)
=> (0 11 10 9 8 7 5 4 2)

(pcs-invert '((6 7 9 11 0 2 3) (1 3 6 9 0 11 4 7)) 0)
=> ((6 5 3 1 0 10 9) (11 9 6 3 0 1 8 5))

(pcs-invert '((6 7 9 11 0 2 3) (1 3 6 9 0 11 4 7)) 5)
=> ((11 10 8 6 5 3 2) (4 2 11 8 5 6 1 10))

(pcs-invert '((6 7 9 11 0 2 3) (1 3 6 9 0 11 4 7)) '(5 8))
=> ((11 10 8 6 5 3 2) (7 5 2 11 8 9 4 1))

(pcs-invert (pcs '(5-1 5-8)) 0 :pitch)
=> ((c4 b4 bb4 a4 gs4) (c4 bb4 a4 gs4 fs4))
