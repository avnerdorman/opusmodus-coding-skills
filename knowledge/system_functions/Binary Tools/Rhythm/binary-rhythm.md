Opusmodus                                                                         binary-rhythm     1

binary-rhythm level binary-number ratio
                       &key type rotate variant seed omn

[Function]

Arguments and Values:
level                   an integer (the unit count).
binary-number           an integer.
ratio                   a ratio or length symbol.
type                    1 (regular), 2 (extended), 3 (complex) and '? (at random).
                        The default is 1 (1 is a note and 0 is a rest).
rotate                  an integer (1 forwards and -1 backwards). The default is 0.
variant                 'p (prime), 'r (retrograde), 'i (inversion) 'ri (retrograde inversion)
                        and '? (at random).
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.
omn                     NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function returns a list of rhythm patterns devised from a binary stream. The BINARY-
RHYTHM function comes with three types of transformations and an additional set of
options.

Type 1, a sequence of (0 1 0 0) with a length ratio of 1/8 will output (-1/8 1/8
-1/4) — 1 is a note and 0 is a rest.

(-3/8 1/8)                    = (0 0 0 1)
(-1/4 1/8 -1/8)               = (0 0 1 0)
(-1/4 1/8 1/8)                = (0 0 1 1)
(-1/8 1/8 -1/4)               = (0 1 0 0)
(-1/8 1/8 -1/8 1/8)           = (0 1 0 1)
(-1/8 1/8 1/8 -1/8)           = (0 1 1 0)
(-1/8 1/8 1/8 1/8)            = (0 1 1 1)
(1/8 -3/8)                    = (1 0 0 0)




Type 2, a sequence of (0 1 0 0) with a length ratio of 1/8 will output (-1/8 3/8)
— 1 is a note and 0 is an extension of 1.

(-3/8 1/8)                    = (0 0 0 1)
                                               fi
Opusmodus                                                                  binary-rhythm   2

(-1/4 1/4)                    = (0 0 1 0)
(-1/4 1/8 1/8)                = (0 0 1 1)
(-1/8 3/8)                    = (0 1 0 0)
(-1/8 1/4 1/8)                = (0 1 0 1)
(-1/8 1/8 1/4)                = (0 1 1 0)
(-1/8 1/8 1/8 1/8)            = (0 1 1 1)
(1/2)                         = (1 0 0 0)

Type 3, the same sequence and length ratio as above, will output (1/8 3/8) — 1 is a
note and 0 is an extension of 1, and if the sequence starts with 0 then the 0 is a note.

(3/8 1/8)                    = (0 0 0 1)
(1/4 1/4)                    = (0 0 1 0)
(1/4 1/8 1/8)                = (0 0 1 1)
(1/8 3/8)                    = (0 1 0 0)
(1/8 1/4 1/8)                = (0 1 0 1)
(1/8 1/8 1/4)                = (0 1 1 0)
(1/8 1/8 1/8 1/8)            = (0 1 1 1)
(1/2)                        = (1 0 0 0)

Binary numbers 1-8 with corresponding rhythms :type 1:

(binary-rhythm 4 '(1 2 3 4 5 6 7 8) 1/8)




Binary numbers 1-8 with corresponding rhythms :type 2:

(binary-rhythm 4 '(1 2 3 4 5 6 7 8) 1/8 :type 2)




Binary numbers 1-8 with corresponding rhythms :type 3:
Opusmodus                                                             binary-rhythm   3




Examples:

Binary numbers 2, 3, 5, 8 and 13.

Type 1:

(binary-rhythm 8 '(2 3 5 8 13) 1/8)




Type 2:

(binary-rhythm 8 '(2 3 5 8 13) 1/8 :type 2)




Type 3:

(binary-rhythm 8 '(2 3 5 8 13) 1/8 :type 3)




Binary numbers 2, 3, 5, 8 and 13 each with a different ratio value:
Opusmodus                                     binary-rhythm   4

Type 1:

(binary-rhythm '(8 16 12 10 8)
               '(2 3 5 8 13)
               '(e s 3q e 5q))




Type 2:

(binary-rhythm '(8 16 12 10 8)
               '(2 3 5 8 13)
               '(e s 3q e 5q)
               :type 2)




Type 3:

(binary-rhythm '(8 16 12 10 8)
               '(2 3 5 8 13)
               '(e s 3q e 5q)
               :type 3)




FIBONACCI series, level 16 with ratio 1/16:
Opusmodus                                  binary-rhythm   5

(setf fib (fibonacci 8 23))
=> (21 34 55 89 144 233 377 610 987 1597
       2584 4181 6765 10946 17711 28657)

Type 1:

(binary-rhythm 16 fib 1/16)




Type 2:
Opusmodus                             binary-rhythm   6

(binary-rhythm 16 fib 1/16 :type 2)




Type 3:
Opusmodus                                                            binary-rhythm     7

(binary-rhythm 16 fib 1/16 :type 3)




More Examples:

In the next example we generate binary numbers using the MAGIC-SQUARE function 6 and
an optional :variant '? (at random: r, i and ri).

(setf msq6 (magic-square 6))
=> ((26 34 6 8 16 24)
    (33 5 7 15 23 25)
    (4 12 14 22 30 32)
    (11 13 21 29 31 3)
    (18 20 28 36 2 10)
    (19 27 35 1 9 17))




(binary-rhythm '(16 12 8 4 8 8 12) (flatten msq6)
               '(s e s e s s 3e e)
               :type 2
Opusmodus                                                                   binary-rhythm   8

                   :variant '?
                   :seed 46)




In the following example we use a list of all three types within a single expression:

(binary-rhythm '(16 12 8 4 8 8 12) (flatten msq6)
Opusmodus                                                           binary-rhythm   9

                 '(s e s e s s 3e e)
                 :type '(1 2 2 1 3 2 3)
                 :variant '?
                 :seed 46)




In the example below we have added the optional :rotate function:

(binary-rhythm '(16 12 8 4 8 8 12) (flatten msq6)
Opusmodus                               binary-rhythm   10

            '(s e s e s s 3e e)
            :type '(1 2 2 1 3 2 3)
            :variant '?
            :rotate '(1 0 2 1 -1 2 1)
            :seed 46)
