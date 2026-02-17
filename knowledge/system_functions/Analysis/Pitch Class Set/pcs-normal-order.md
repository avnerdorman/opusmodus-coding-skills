Opusmodus                                                                   pcs-normal-order     1

pcs-normal-order set &optional type
[Function]

Arguments and Values:
set                       an integer set.
type                      :integer or :pitch. The default is :integer.


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

The function PCS-NORMAL-ORDER enables a particular circular permutation of PITCH
CLASS SET in ascending order.

Here's how it works.

One of the abstractions of pc sets is that they are unordered, that is, the pcs may be embodied
in any order in the musical segments. Segments in which pcs 1, 2, 3, 6, and 7 appear in the
order 2, 1, 3, 7, 6 or 6, 3, 1, 2, 7 or 3, 1, 6, 1, 2, 3, 7, 2, are all classi ed as belonging to
the same set. As we usually name a set by citing its pc content, it will help to have a
standard order for listing the pcs; then all examples of the set will have the same name.This
   fl
                                    fl
                                                                     fi
Opusmodus                                                          pcs-normal-order    2

standard order is called normal form. By convention, the NORMAL-FORM is the one that
lists the PCS in ascending order and in the intervallically most compact form.

(pcs-normal-order '(1 4 7 8 10))
=> (7 8 10 1 4)

(pcs-normal-order '(2 4 8 10))
=> (2 4 8 10)


Examples:
(pcs-normal-order '(3 8 9 6 1 2 0 10))
=> (6 8 9 10 0 1 2 3)

(pcs-normal-order '(3 9 6 5))
=> (3 5 6 9)

(pcs-normal-order '(0 3 4 5 10))
=> (10 0 3 4 5)

(pcs-normal-order '((3 9 6 5 0) (0 3 4 5 10)) :pitch)
=> ((eb4 f4 fs4 a4 c4) (bb4 c4 eb4 e4 f4))
