Opusmodus                                                                          a*x+y     1

a*x+y a x y
[Function]

Arguments and Values:
a                        a number.
x                        a sequence of numbers.
y                        a sequence of numbers.


Description:

This function returns a list of numbers obtained by multiplying each element of x by a and
adding the corresponding element of y.

(a*x+y 2 '(1 2 3) '(1 2 3))
=> (3 6 9)

(a*x+y 2 '(1/4 1/2 1/8) '(1/4 1/2 1/8))
=> (3/4 3/2 3/8)


Examples:

Sometimes such functions can produce interesting and surprising variations. Outline and
AUDITION with Cmd-1 key command the two pitch phrases p-phrase and p-phrase-1.

(setf phrase (rndn 20 0 12))
=> (2 11 8 3 5 8 11 2 10 9 5 9 4 8 9 9 9 10 1 11)

(setf p-phrase (integer-to-pitch phrase))
=> (d4 b4 gs4 eb4 f4 gs4 b4 d4 bb4 a4 f4 a4 e4 gs4 a4 a4 a4 bb4 cs4 b4)




(setf phrase-1 (a*x+y 2 phrase (rndn 20 -2 3)))
=> (6 22 17 9 12 18 21 3 20 19 9 20 7 18 19 17 19 22 5 21)

(setf p-phrase-1 (integer-to-pitch phrase-1))
=> (fs4 bb5 f5 a4 c5 fs5 a5 eb4 gs5 g5 a4 gs5 g4 fs5 g5 f5 g5 bb5 f4 a5)
