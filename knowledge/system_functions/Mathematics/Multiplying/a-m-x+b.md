Opusmodus                                                                           a*x+b    1

a*x+b a x b
[Function]

Arguments and Values:
a                        a number.
x                        a sequence of numbers.
b                        a number.


Description:

This function returns a list of numbers obtained by multiplying each element of x by a and
adding b.

(a*x+b 2 '(1 2 3) 2)
=> (4 6 8)

(a*x+b 2 '(1 2 3) -1)
=> (1 3 5)

(a*x+b 2 '(1/4 1/2 1/8) 2)
=> (5/2 3 9/4)


Examples:

Sometimes such functions can produce interesting and surprising variations. Listen to the
difference between p-phrase and p-phrase-1 with AUDITION tool.

(setf phrase (rndn 20 0 12))
=> (4 4 12 3 6 0 1 7 5 11 5 3 2 1 4 11 11 11 5 0)

(setf p-phrase (integer-to-pitch phrase))
=> (e4 e4 c5 eb4 fs4 c4 cs4 g4 f4 b4
    f4 eb4 d4 cs4 e4 b4 b4 b4 f4 c4)
Opusmodus                                               a*x+b   2

(setf phrase-1 (a*x+b 2 phrase -1))
=> (7 7 23 5 11 -1 1 13 9 21 9 5 3 1 7 21 21 21 9 -1)

(setf p-phrase-1 (integer-to-pitch phrase-1))
=> (g4 g4 b5 f4 b4 b3 cs4 cs5 a4 a5
    a4 f4 eb4 cs4 g4 a5 a5 a5 a4 b3)
