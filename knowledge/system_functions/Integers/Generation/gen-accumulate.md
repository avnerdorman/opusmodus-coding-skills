Opusmodus                                                                    gen-accumulate       1

gen-accumulate numbers &key start count decf
[Function]

Arguments and Values:
numbers                   a list of numbers.
start                     an integer or NIL. The default is NIL.
count                     an integer, T or NIL. The default is NIL.
decf                      T or NIL. The default is NIL.


Description:

This function returns the result of accumulating all the values in a list. It can be used to
produce effective ascending sequences of pitches in conjunction with GEN-INTERLEAVE.

(gen-accumulate '(2 3 4))
=> (2 5 9)

(gen-accumulate '(2 3 4) :start 1)
=> (1 3 6 10)

(gen-accumulate '(2 3 4) :start 1 :count t)
=> (1 3 6)

(gen-accumulate '(2 3 4) :count 8)
=> (2 5 9 11 14 18 20 23)

(gen-accumulate '(2 3 4) :start 2 :count 8)
=> (2 4 7 11 13 16 20 22)


Examples:

In the example below this integer series is used to produce an ascending series of pitch lists.

(gen-accumulate '(2 3 4 7) :count 8)
=> (2 5 9 16 18 21 25 32)

(gen-accumulate '(2 3 4 7) :count 8 :decf t)
=> (-2 -5 -9 -16 -18 -21 -25 -32)

(integer-to-pitch
 (gen-interleave 4 (gen-accumulate '(2 3 4 7) :count 8)))
=> ((d4 f4 a4 e5) (f4 a4 e5 fs5) (a4 e5 fs5 a5)
    (e5 fs5 a5 cs6) (fs5 a5 cs6 gs6))
Opusmodus                                                                     gen-accumulate   2

In this example the resultant pitch series has descent and ascent through the use of the GEN-
PALINDROME function. Note the use of the LISP primitive REVERSE.

(setf descent (reverse (gen-accumulate '(2 3 4) :start 2 :count 8)))
=> (22 20 16 13 11 7 4 2)

(integer-to-pitch (gen-palindrome descent))
=> (bb5 gs5 e5 cs5 b4 g4 e4 d4 e4 g4 b4 cs5 e5 gs5 bb5)

(gen-accumulate (rndn 10 -1.0 1.0))
=> (-0.6251934 -0.27731746 -0.3338067 -0.03803557
    0.32762462 -0.6398358 -0.9451078 -1.6821501
    -2.3007154 -2.1600227)

(gen-accumulate (rndn 10 -1.0 1.0) :decf t)
=> (0.6251934 0.27731746 0.3338067 0.03803557
    -0.32762462 0.6398358 0.9451078 1.6821501
    2.3007154 2.1600227)

(list-plot (gen-accumulate (rndn 200 -1.0 1.0)))


         4.4.



         2.2.



         0.0.
                 20
                  20     40
                          40    60
                                 60    80
                                        80    100
                                                100   120
                                                        120   140
                                                                140   160
                                                                        160   180
                                                                                180   200
                                                                                        200


        -2.-2.



        -4.-4.



        -6.-6.



        -8.-8.
Opusmodus                                                        gen-accumulate   3

(list-plot
 (list
  (gen-accumulate (rndn 400 -1.0 1.0))
  (gen-accumulate (rndn 400 -1.0 1.0))
  (gen-accumulate (rndn 400 -1.0 1.0))
  (gen-accumulate (rndn 400 -1.0 1.0))))


       30.30.

       25.25.

       20.20.

       15.15.

       10.10.

        5.5.

        0.0.
                 50
                  50   100
                         100   150
                                 150   200
                                         200   250
                                                 250   300
                                                         300   350
                                                                 350   400
                                                                         400
       -5.-5.

      -10.-10.

      -15.-15.
