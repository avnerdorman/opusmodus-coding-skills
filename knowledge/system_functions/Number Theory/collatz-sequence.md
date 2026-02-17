Opusmodus                                                                  collatz-sequence    1

collatz-sequence n
[Function]

Arguments and Values:
n                         an integer.


Description:

The Collatz sequence is a conjecture in mathematics that concerns a sequence de ned as
follows: start with any positive integer n. Then each term is obtained from the previous term
as follows: if the previous term is even, the next term is one half of the previous term. If the
previous term is odd, the next term is 3 times the previous term plus 1. The conjecture is
that no matter what value of n, the sequence will always reach 1.

If n is 1 then the sequence ends.
If n is even then the next n of the sequence = n/2
If n is odd then the next n of the sequence = (3 * n) + 1


Examples:

For instance, starting with n = 12, one gets the sequence:

(collatz-sequence 12)
=> (12 6 3 10 5 16 8 4 2 1)

n = 19, for example, takes longer to reach:

(collatz-sequence 12)
=> (19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
                                                                            fi
Opusmodus                                                             collatz-sequence   2

The sequence for n = 27, takes 111 steps (41 steps through odd numbers), climbing to a
high of 9232 before descending to 1:

(collatz-sequence 27)
=> (27 82 41 124 62 31 94 47 142 71 214 107 322 161
    484 242 121 364 182 91 274 137 412 206 103 310
    155 466 233 700 350 175 526 263 790 395 1186 593
    1780 890 445 1336 668 334 167 502 251 754 377 1132
    566 283 850 425 1276 638 319 958 479 1438 719 2158
    1079 3238 1619 4858 2429 7288 3644 1822 911 2734
    1367 4102 2051 6154 3077 9232 4616 2308 1154 577
    1732 866 433 1300 650 325 976 488 244 122 61 184
    92 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1)

(list-plot (collatz-sequence 27) :join-points t)
