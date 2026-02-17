Opusmodus                                                                            gen-sieve   1

gen-sieve ambitus intervals &key type
[Function]

Arguments and Values:
ambitus               an integer (low high), a pitch symbol (low high) or instrument-name.
intervals             a list.
type                  :integer, :pitch and :interval. The default is :integer.


Description:

The function GEN-SIEVE generates a list of intervals of a given size. The ambitus
(range) determines the number of return intervals.


Examples:
(gen-sieve '(c4 g7) '(2 1))
=> (0 2 3 5 6 8 9 11 12 14 15 17 18 20 21 23
      24 26 27 29 30 32 33 35 36 38 39 41 42)

(gen-sieve '(c4 g7) '(2 1) :type :pitch)
=> (c4 d4 eb4 f4 fs4 gs4 a4 b4 c5 d5 eb5 f5 fs5 gs5
    a5 b5 c6 d6 eb6 f6 fs6 gs6 a6 b6 c7 d7 eb7 f7 fs7)

(gen-sieve '((c4 g7) (c1 g7)) '((2 1 12) (3 5)))
=> (-36 -33 -28 -25 -20 -17 -12 -9 -4 -1
    0 2 3 4 7 12 15 17 18 20 23 28 30 31 32 33 36 39)

(gen-sieve '((c3 g4) (a4 g5)) '((1 2 3) (1 2 3)) :type :pitch)
=> (c3 cs3 eb3 fs3 g3 a3 c4 cs4 eb4 fs4 g4 a4 bb4 c5 eb5 e5 fs5)

(gen-sieve '(violin (c1 g6) piccolo) '((2 1 12) (3 5) (3 6))
           :type :interval)
=> (3 5 3 5 3 5 3 4 1 1 1 1 5 3 3 2 1 2 5 1 2 1 1 2 1 2 1 2 6 1 2 1 5)
