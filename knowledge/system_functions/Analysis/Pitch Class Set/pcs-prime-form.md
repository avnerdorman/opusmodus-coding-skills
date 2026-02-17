Opusmodus                                                                    pcs-prime-form      1

pcs-prime-form set &optional type
[Function]

Arguments and Values:
set                      an integer set.
type                     :forte, :pitch and :vector. The default is :integer.


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

This function displays prime form of the chosen set.

It's important to have conventional naming scheme for set classes, so that all sets we might
assign to the same class - for example '(1 2 3 6 7), '(2 3 4 7 8), and '(10 11
2 3 4) - will be class-labeled identically. Since classes are de ned by axioms of
transpositional and inversional set equivalence, the conventional class name is one that
reduces the normal form names of all the sets in the class to one supra-normal form called
prime form. So the prime form of a set is made by putting it in a normal form, most
compact towards the left, that begins on pc 0. Here's how it's done.
   fl
                                   fl
                                                           fi
Opusmodus                                                              pcs-prime-form   2

Make sure your set is in normal form.

(pcs-normal-order '(3 2 4 7 8))
=> (2 3 4 7 8)

Now invert this set, and place the result also in normal form.

(pcs-invert '(2 3 4 7 8))
=> (10 9 8 5 4)

Transpose both normal forms to begin on 0:

(pcs-transpose -2 (pcs-normal-order '(2 3 4 7 8)))
=> (0 1 2 5 6)

(pcs-transpose 2 '(10 9 8 5 4))
=> (0 11 10 7 6)

Finally, compare the two 0-transposed sets. Which is more compact towards the left? That
one is taken as the prime form -- and the name of the class to which your original set
belongs.

(pcs-prime-form '(0 11 10 7 6))
(pcs-prime-form '(0 1 2 5 6))


Examples:
(pcs-prime-form '(1 4 7 8 10))
=> (0 1 3 6 9)

(pcs-prime-form '(1 4 7 8 10) :forte)
=> 5-31

(pcs-prime-form '((0 4 7) (0 3 7)) :forte)
=> (3-11b 3-11)

(pcs-prime-form '(3 8 9 6 1 2 0 10))
=> (0 2 3 4 6 7 8 9)

(pcs-prime-form '(3 8 9 6 1 2 0 10) :forte)
=> 8-z29b

(pcs-prime-form '(3 9 6 5))
=> (0 2 3 6)
(pcs-prime-form '(3 9 6 5) :forte)
=> 4-12
Opusmodus                                                pcs-prime-form   3

(pcs-prime-form '(0 3 4 5 10))
=> (0 2 5 6 7)

(pcs-prime-form '(0 3 4 5 10) :forte)
=> 5-14b

(pcs-prime-form '((3 9 6 5 0) (0 3 4 5 10)) :forte)
=> (5-31b 5-14b)

(pcs-prime-form '((3 9 6 5 0) (0 3 4 5 10)) :pitch)
=> ((c4 d4 eb4 fs4 a4) (c4 d4 f4 fs4 g4))

(pcs-prime-form '((10 11 1 3 4) (10 0 1 3 4)) :vector)
=> ((2 2 2 1 2 1) (2 2 3 1 1 1))
