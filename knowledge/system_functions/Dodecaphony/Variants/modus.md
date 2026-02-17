Opusmodus                                                                                  modus   1

modus sequence &key mod assoc type
[Function]

Arguments and Values:
sequence                  an integer or a pitch, a list or lists of integers or pitches.
mod                       an integer or list of integers. The default is 12.
assoc                     an integer or list of integers. The default is 12.
type                      :integer or :pitch. The default is :integer.


Description:

This is a very general function that enables an integer list to be brought into line with a series
of 12 used in serial composition. Modular arithmetic can be handled mathematically by
introducing a congruence relation on the integers that is compatible with the operations of the
ring of integers: addition, subtraction, and multiplication. For a positive integer N, two
integers a and b are said to be congruent modulo N.


Examples:
(modus '(0 1 3 8 11 9 5 0 4 10 7 2 6 12))
=> (0 1 3 8 11 9 5 0 4 10 7 2 6 0)

(modus '(0 41 33 87 11 9 5 4 10 74 2 67))
=> (0 5 9 3 11 9 5 4 10 2 2 7)

(modus '((q c6 cs4 e a4 e3 d6 f4) (q b4 gs3 e bb4 eb4 g5 fs6)))
=> ((0 1 9 4 2 5) (11 8 10 3 7 6))

(modus '(0 41 33 87 11 9 5 4 10 74 2 67) :mod 14)
=> (0 13 5 3 11 9 5 4 10 4 2 11)

(modus '((0 41 33 87 11 9 5 4 10 74 2 67)
         (0 1 3 8 11 9 5 0 4 10 7 2 6 12)) :mod '(6 12))
=> ((0 5 3 3 5 3 5 4 4 2 2 1) (0 1 3 8 11 9 5 0 4 10 7 2 6 0))

(modus '(eb4 cs5 e5) :mod 14 :assoc 12)
=> (3 13 4)

(modus '(eb4 cs5 e5) :mod 14 :assoc 12 :type :pitch)
=> (eb4 cs5 e4)
