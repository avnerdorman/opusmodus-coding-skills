Opusmodus                                                                    interval-modus      1

interval-modus intervals &key mod assoc
[Function]

Arguments and Values:
intervals                 list of intervals
mod                       interval size. The default is 12.
assoc                     row size. The default is 12.


Description:

This function allows modi cation of an existing row by interval size.

(interval-modus '(0 1 -13 8 -11 19 -5 0 14 10 -7 2 16 12) :mod 7)
=> (0 1 -6 1 -4 5 -5 0 0 3 0 2 2 5)

Remember in PITCH-CLASS composition the transposition of a pc integer i means that
some integer t is added to i to make a pc integer j. If j is greater than or equal to 12, j is
replaced by the remainder of j divided by 12. This is called addition modulo 12,
abbreviated to mod 12. For example:

2 + 10 = 12 = 0 (mod 12)
3 + 10 = 13 = 1 (mod 12)
7 + 12 = 17 = 5 (mod 12)
and so on . . .


Examples:

In the rst two examples an integer representing interval size is followed by a row of
intervals. If the :mod is 13 there will be no intervals present in the new row outside
that interval. Similarly with the second and more extreme row having a :mod of 5.

(interval-modus '(0 1 -13 8 -11 19 -5 0 14 10 -7 2 16 12) :mod 13)
=> (0 1 0 8 -11 6 -5 0 1 10 -7 2 3 12)

(interval-modus '(0 1 -13 8 -11 19 -5 0 14 10 -7 2 16 12)
                  :mod 15 :assoc 14)
=> (0 1 -13 8 -11 5 -5 0 14 10 -7 2 2 12)

(interval-modus '(0 41 33 87 11 9 5 4 10 74 2 67) :mod 14)
=> (0 13 5 3 11 9 5 4 10 4 2 11)
fi
                    fi
Opusmodus                                                 interval-modus   2

(interval-modus '(0 1 6 8 -12 23 -32 35 -43 50 -60 -66)
                  :mod 14 :assoc 12)
=> (0 1 6 8 -12 11 -8 11 -7 2 0 -6)
