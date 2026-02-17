     Opusmodus                                                                       pcs-sub-sets     1

     pcs-sub-sets n set &optional type
     [Function]

     Arguments and Values:
     n                         an integer or list of integers (cardinal).
     sets                      two sets of integers.
     type                      :forte, :integer, :pitch and :vector. The default is :integer.


     Description:

     Allen Forte's unique notation system commonly known as Forte Notation in which he
     extrapolates from the serial theory of Milton Babbitt, proposes a musical SET THEORY of
     pitch-class-set analysis analogous to mathematical set theory. This has the avowed intention
     of providing a method for the analysis of serial or non-serial atonal music. Forte's system is
     equally at home describing Ives and Stravinsky as it is Schoenberg and Webern.

     In the integer model of pitch, all pitch classes and intervals between pitch classes are
     designated using the numbers 0 through 11. It is a common analytical and compositional tool
     when working with chromatic music, including twelve tone, serial, or otherwise atonal
     music. Such a system able to deal with intervallic relationships from pitch class
     extrapolations of material has a potential within Opusmodus to be itself a generator of pitch
     series.

     Pitch-class, one of the 12 pitch-classes designated by integers 0 11. Pitch-class 0 refers to all
     notated pitches C, B-sharp, D-double- at. Pitch-class 1 refers to all notated pitches C-sharp,
     D- at, B-double-sharp, and so on.

     The name of PCS consisting of two numerals separated by a hyphen. The numeral to the left
     of the hyphen is the CARDINAL-NUMBER of the set, the numeral to the right of the
     hyphen is the ORDINAL-NUMBER of the set, its position on the list of PRIME-FORMS.

     The function PCS-SUB-SETS is similar to PCS-SUPER-SETS. The output is more
     constrained but it will allow for interval-vector output. Use this function to explore Z-related
     classes which share interval-class content.

     The cardinal number needs to be lower then the set count.
fl
                                     fl
Opusmodus                                                   pcs-sub-sets   2

Examples:
(pcs-sub-sets '(2 3) '(1 7 0 2 6 8))
=> ((0 1) (0 2) (0 4) (0 5) (0 6) (0 1 2) (0 1 5)
   (0 4 5) (0 1 6) (0 5 6) (0 2 6) (0 4 6) (0 2 7))

(pcs-transpose 1 (pcs-sub-sets '(2 3) '(1 7 0 2 6 8)))
=> ((1 2) (1 3) (1 5) (1 6) (1 7) (1 2 3) (1 2 6)
   (1 5 6) (1 2 7) (1 6 7) (1 3 7) (1 5 7) (1 3 8))

(pcs-invert (pcs-sub-sets '(2 3) '(1 7 0 2 6 8)))
=> ((0 11) (0 10) (0 8) (0 7) (0 6) (0 11 10) (0 11 7)
    (0 8 7) (0 11 6) (0 7 6) (0 10 6) (0 8 6) (0 10 5))

(pcs-sub-sets 3 '(1 7 0 2 6 8) :forte)
=> (3-1 3-4 3-4b 3-5 3-5b 3-8 3-8b 3-9)

(pcs-sub-sets '(4 5) '(1 7 0 2 6 8))
=> ((0 1 2 6) (0 4 5 6) (0 1 2 7) (0 1 5 6) (0 1 6 7)
    (0 1 5 7) (0 2 6 7) (0 2 6 8) (0 1 2 6 7) (0 1 5 6 7)
    (0 1 2 6 8)

(setf subsets
      (assemble-seq
       (pcs-sub-sets '(2 4) '(1 7 0 2 6 8))
       (pcs-sub-sets '(2 4) '(10 3 5 11 4 9))))
=> ((0 1) (0 2) (0 4) (0 5) (0 6) (0 1 2 6) (0 4 5 6) (0 1 2 7)
    (0 1 5 6) (0 1 6 7) (0 1 5 7) (0 2 6 7) (0 2 6 8) (0 1) (0 2)
    (0 4) (0 5) (0 6) (0 1 2 6) (0 4 5 6) (0 1 2 7) (0 1 5 6)
    (0 1 6 7) (0 1 5 7) (0 2 6 7) (0 2 6 8))

(setf transp
      (rnd-sample (length subsets) '(6 7 8 9 10 11) :seed 752))

(rnd-octaves '(-24 24) (pcs-transpose transp subsets :pitch) :seed 43)
=> ((gs2 a3) (bb4 c5) (fs4 bb4) (g2 c4) (fs5 c4) (gs4 a4 bb2 d3)
    (a5 cs4 d3 eb3) (gs4 a3 bb3 eb4) (b4 c5 e3 f4) (g4 gs4 cs5 d5)
    (fs4 g3 b4 cs3) (g2 a2 cs4 d5) (fs4 gs4 c4 d3) (b3 c5) (fs5 gs3)
    (fs5 bb4) (g3 c3) (gs2 d5) (b3 c5 cs2 f5) (fs4 bb4 b2 c5)
    (bb2 b3 c5 f3) (a4 bb5 d5 eb4) (gs2 a4 d4 eb5) (a4 bb4 d4 e3)
    (fs3 gs4 c4 cs4) (g4 a4 cs5 eb5))
