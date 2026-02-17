Opusmodus                                                                       euclidean-rhythm      1

euclidean-rhythm level low high ratio &key type rotate
                            variant prob seed omn

[Function]

Arguments and Values:
level                    an integer (the unit count).
low                      an integer. Lowest pulse count.
high                     an integer. Highest pulse count.
ratio                    a ratio or length symbol.
type                     1 (regular), 2 (extended), 3 (complex) and '? (at random).
                         The default is 1 (1 is a note and 0 is a rest).
rotate                   an integer (1 forwards and -1 backwards). The default is 0.
variant                  'p (prime), 'r (retrograde), 'i (inversion) 'ri (retrograde inversion)
                         and '? (at random).
prob                     Optional parameter with a default value of 0.5. This is a oating-point
                         number ranging between 0.0 and 1.0, which affects the distribution
                         of the generated random number within the speci ed range. A lower value for
                         this parameter increases the likelihood of selecting a lower number within
                         the given range, while a higher value favours the selection of higher numbers.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function is based on the Euclidean algorithm. This computes the greatest common
divisor of two given integers. It has been demonstrated that the structure of this algorithm
can generate a large family of ostinato-like rhythms. The unique feature of such ostinatos is
the even distribution of their patterns. The EUCLIDEAN-RHYTHM function comes with three
types of transformations and an additional set of options.

Type 1, a sequence of (0 1 0 0) with a length ratio of 1/8 will output (-1/8 1/8
-1/4) — 1 is a note and 0 is a rest.

(-3/8 1/8)                     = (0 0 0 1)
(-1/4 1/8 -1/8)                = (0 0 1 0)
(-1/4 1/8 1/8)                 = (0 0 1 1)
(-1/8 1/8 -1/4)                = (0 1 0 0)
(-1/8 1/8 -1/8 1/8)            = (0 1 0 1)
(-1/8 1/8 1/8 -1/8)            = (0 1 1 0)
(-1/8 1/8 1/8 1/8)             = (0 1 1 1)
(1/8 -3/8)                     = (1 0 0 0)
                                                 fi
                                                                  fi
                                                                           fl
Opusmodus                                                               euclidean-rhythm   2

Type 2, a sequence of (0 1 0 0) with a length ratio of 1/8 will output (-1/8 3/8)
— 1 is a note and 0 is an extension of 1.

(-3/8 1/8)                    = (0 0 0 1)
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

Example with level 8 and ratio 1/16:

Type 1:

(euclidean-rhythm '(8 8 8 8 8 8 8 8) 1 8 1/16 :seed 26)
Opusmodus                                                       euclidean-rhythm   3

Type 2 and :type 3 without a rotation or variant option, will output the same
result:

(euclidean-rhythm '(8 8 8 8 8 8 8 8) 1 8 1/16 :seed 26 :type 2)
(euclidean-rhythm '(8 8 8 8 8 8 8 8) 1 8 1/16 :seed 26 :type 3)




Examples:

With the :rotate function:

Type 1:

(euclidean-rhythm '(8 8 4 8 8 4 8 8) 1 8
                  '(s e s e e 3e s s)
                  :rotate '(1 0 1 0 1 0 1 0)
                  :seed 968)
Opusmodus                                      euclidean-rhythm   4

Type 2:

(euclidean-rhythm '(8 8 4 8 8 8 8 8) 1 8
                  '(s e s e e 3e s s)
                  :rotate '(1 0 1 0 1 0 1 0)
                  :type 2
                  :seed 968)




Type 3:

(euclidean-rhythm '(8 8 4 8 8 4 8 8) 1 8
                  '(s e s e e 3e s s)
                  :rotate '(1 0 1 0 1 0 1 0)
                  :type 3
                  :seed 968)
Opusmodus                                                       euclidean-rhythm   5

An example with level 16 and a ratio 1/16 plus a low and high list, and a
random :variant:

Type 1:

(euclidean-rhythm '(16 16 16 16 16 16)
                  '(1 4 8 9 8 4)
                  '(4 6 10 12 10 7) 's
                  :variant '?
                  :seed 675)
Opusmodus                                euclidean-rhythm   6

Type 2:

(euclidean-rhythm '(16 16 16 16 16 16)
                  '(1 4 8 9 8 4)
                  '(4 6 10 12 10 7) 's
                  :type 2
                  :variant '?
                  :seed 675)




Type 3:

(euclidean-rhythm '(16 16 16 16 16 16)
                  '(1 4 8 9 8 4)
                  '(4 6 10 12 10 7) 's
                  :type 3
                  :variant '?
                  :seed 675)
Opusmodus                                         euclidean-rhythm   7

More Examples:

Type 1:

(euclidean-rhythm '(16 12 8 4 8 8 12) 1 8
                  '(s e s 5e s s 3e e)
                  :variant '?
                  :rotate '(-2 -1 1 0 1 2 -1 1)
                  :seed 46)




Type 2:

(euclidean-rhythm '(16 12 8 4 8 8 12) 1 8
                  '(s e s 5e s s 3e e)
                  :type 2
                  :variant '?
                  :rotate '(-2 -1 1 0 1 2 -1 1)
                  :seed 46)
Opusmodus                                         euclidean-rhythm   8

Type 3:

(euclidean-rhythm '(16 12 8 4 8 8 12) 1 8
                  '(s e s 5e s s 3e e)
                  :type 3
                  :variant '?
                  :rotate '(-2 -1 1 0 1 2 -1 1)
                  :seed 46)
Opusmodus                                                            euclidean-rhythm   9

In the following example we use all three types at random '? within a single expression:

(euclidean-rhythm
 (gen-repeat 4 '(16 12 8 4 8 8 12 16)) 1 8
 '(s e s 5e s s 3e e s)
 :type '?
 :variant '?
 :seed 46)
