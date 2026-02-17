Opusmodus                                                                          cartesian     1

cartesian lists
[Function]

Arguments and Values:
lists                     lists of sets.


Description:

The CARTESIAN function will return all the combinatory possibilities drawn from two or
more sets.

(cartesian '((a b c d) (1 2 3 4)))
=> ((a 1) (a 2) (a 3) (a 4)
    (b 1) (b 2) (b 3) (b 4)
    (c 1) (c 2) (c 3) (c 4)
    (d 1) (d 2) (d 3) (d 4))

In mathematics, a Cartesian product is a mathematical operation which returns a set (or
product set) from multiple sets. That is, for sets A and B, the Cartesian product A × B is the
set of all ordered pairs (a,b) where a ∈ A and b ∈ B.

An illustrative example is the Standard 52-card deck. The standard playing card ranks {Ace,
King, Queen, Jack, 10, 9, 8, 7, 6, 5, 4, 3, 2} form a 13 element-set. The card suits {♠, ♥, ♦,
♣} form a 4-element set. The Cartesian product of these sets returns a 52-element set
consisting of 52 ordered pairs which correspond to all 52 possible playing cards.


Examples:
(cartesian '((4 5 -5) (2 3 5) (1 2 4)))
=> ((4 2 1) (4 2 2) (4 2 4) (4 3 1) (4 3 2) (4 3 4) (4 5 1) (4 5 2)
    (4 5 4) (5 2 1) (5 2 2) (5 2 4) (5 3 1) (5 3 2) (5 3 4)
    (5 5 1) (5 5 2) (5 5 4) (-5 2 1) (-5 2 2) (-5 2 4) (-5 3 1)
    (-5 3 2) (-5 3 4) (-5 5 1) (-5 5 2) (-5 5 4))
Opusmodus                                                               cartesian   2

Generate OMN fragments with CARTESIAN sets:

(cartesian '((e q) (c4 d4 e4 f4) (mp mf f pp)))
=> ((e c4 mp) (e c4 mf) (e c4 f) (e c4 pp)
      (e d4 mp) (e d4 mf) (e d4 f) (e d4 pp)
      (e e4 mp) (e e4 mf) (e e4 f) (e e4 pp)
      (e f4 mp) (e f4 mf) (e f4 f) (e f4 pp)
      (q c4 mp) (q c4 mf) (q c4 f) (q c4 pp)
      (q d4 mp) (q d4 mf) (q d4 f) (q d4 pp)
      (q e4 mp) (q e4 mf) (q e4 f) (q e4 pp)
      (q f4 mp) (q f4 mf) (q f4 f) (q f4 pp))

(mcflatten (cartesian '((e q) ((c4 d4) (e4 f4) (c4 cs5)))))
=> ((e c4 d4) (e e4 f4) (e c4 cs5)
    (q c4 d4) (q e4 f4) (q c4 cs5))

This preliminary example shows how the function CARTESIAN can be embedded within the
GEN-LENGTH function.

(setf rhy (gen-length (cartesian '((1 2 1 2) (4 8 2 4))) '(16 8 16 16)))
=> ((1/16 1/4) (1/8 1) (1/16 1/8) (1/16 1/4)
    (1/8 1/4) (1/4 1) (1/8 1/8) (1/8 1/4)
    (1/16 1/4) (1/8 1) (1/16 1/8) (1/16 1/4)
    (1/8 1/4) (1/4 1) (1/8 1/8) (1/8 1/4))

(setf ts-c (get-time-signature rhy))
=> ((5 16 1) (9 8 1) (3 16 1) (5 16 1)
    (3 8 1) (5 4 1) (1 4 1) (3 8 1)
    (5 16 1) (9 8 1) (3 16 1) (5 16 1)
    (3 8 1) (5 4 1) (1 4 1) (3 8 1))

(time-signature-length ts-c)
=> (5/16 9/8 3/16 5/16 3/8 5/4 1/4 3/8
    5/16 9/8 3/16 5/16 3/8 5/4 1/4 3/8)
