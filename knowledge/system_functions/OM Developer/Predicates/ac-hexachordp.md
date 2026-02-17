Opusmodus                                                     ac-hexachordp   1

ac-hexachordp hexachord
[Function]

Arguments and Values:
hexachord               six-tone series.


Description:

Return true if hexachord is one of the six prime form sets:

(0 1 2 3 4 5)
(0 2 3 4 5 7)
(0 2 4 5 7 9)
(0 1 2 6 7 8)
(0 1 4 5 8 9)
(0 2 4 6 8 10)

and NIL otherwise.

All-Combinatorial Hexachords in Forte notation:

(pcs-prime-form
 '((0 1 2 3 4 5) ; A
   (0 2 3 4 5 7) ; B
   (0 2 4 5 7 9) ; C
   (0 1 2 6 7 8) ; D
   (0 1 4 5 8 9) ; E
   (0 2 4 6 8 10) ; F
   ) :forte)
=> (6-1 6-8 6-32 6-7 6-20 6-35)


Examples:
(ac-hexachordp '(0 1 2 3 4 10))
=> nil

(ac-hexachordp '(6 8 10 11 1 3))
=> t

(pcs-prime-form '(6 8 10 11 1 3))
=> (0 2 4 5 7 9)
