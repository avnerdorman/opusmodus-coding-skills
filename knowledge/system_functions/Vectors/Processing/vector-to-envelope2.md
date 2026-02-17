Opusmodus                                                              vector-to-envelope2      1

vector-to-envelope2 env1 env2 values &key segment seed
[Function]

Arguments and Values:
env1                       a list of oating-point numbers.
env2                       a list of oating-point numbers.
values                     a list of oating-point numbers or vector.
type                       1 (rnd-sum), 2 (rnd-sum-to-size) or 3 (sum-to-size).
                           The default is 1.
segment                    a list of numbers. The default is (prime 8)
                           => (2 3 5 7 11 13 17 19).
seed                       an integer or NIL. The default is NIL.


Description:

This function applies ‘ambitus series’ derived from two envelope lists into a list of oating-
point numbers.

Lets examine rst how env1 and env2 create the ambitus series (low high).
We mix the two envelopes rst and then we apply a sort function:

(setf env1 '(-5.1 -2.3 1.5 -0.8 4.6 10.6))
(setf env2 '(1.0 1.2 -1.1 2.1 -0.3 -2.5))

(sort-asc (gen-mix env1 env2))
=> ((-5.1 1.0) (-2.3 1.2) (-1.1 1.5) (-0.8 2.1) (-0.3 4.6) (-2.5 10.6))

From the two envelopes above the function creates ve ambitus series each with two lists:
start (low high) and end (low high).

Start      End
((-5.1 1.0) (-2.3 1.2))
((-2.3 1.2) (-1.1 1.5))
((-1.1 1.5) (-0.8 2.1))
((-0.8 2.1) (-0.3 4.6))
((-0.3 4.6) (-2.5 10.6))

Next, the values list ( oating-point numbers) is divided by the count of the ambitus series.
In our example the count is 5:

(sum-to-size 128 5)
=> (25 25 26 26 26)
        fi
                 fl
                      fi
                           fl
                           fl
                           fl
                                             fi
                                                                             fl
     Opusmodus                                                         vector-to-envelope2   2

     The nal process is to select randomly :segment numbers for each of the 5 sublists:

     With :type 1

     (rnd-sum 25 '(2 3 5 7 11 13 17 19))
     => (7 3 2 2 11)

     With :type 2 (length segments)

     (rnd-sum-to-size 25 8 '(2 3 5 7 11 13 17 19))
     => (2 5 3 3 3 3 3 3)

     With :type 3 (length segments) - with equal or plus/minus 1 equal numbers.

     (sum-to-size 25 8)
     => (3 3 3 3 3 3 3 4)

     Lets see the result:

     (list-plot
      (vector-to-envelope2 env1 env2 (gen-noise 128 :seed 256)))
fi
Opusmodus                                                           vector-to-envelope2   3

A slightly different result we can achieve with optional :type 2:

(list-plot
 (vector-to-envelope2 env1 env2 (gen-noise 128 :seed 256) :type 2))




Most equal distribution of :segments is achieved with :type 3:

(list-plot
 (vector-to-envelope2 env1 env2 (gen-noise 128 :seed 256) :type 3))
Opusmodus                                             vector-to-envelope2   4

Examples:
(list-plot (vector-to-envelope2
            '(-7.1 1) '(-0.1 10)
            (gen-noise 356) :segment (primes 3)))




(list-plot (vector-to-envelope2
            '(-7.1 1) '(-0.1 10)
            (gen-noise 356) :segment (primes 3) :type 2))
Opusmodus                                             vector-to-envelope2   5

(list-plot (vector-to-envelope2
            '(-7.1 1) '(-0.1 10)
            (gen-noise 356) :segment (primes 3) :type 3))




(list-plot (vector-to-envelope2
            '(4.2456284 7.2268248 6.4440737)
            '(3.682579 8.78879 10.000002)
            (gen-noise 356) :segment (primes 12)))
Opusmodus                                             vector-to-envelope2   6

(list-plot (vector-to-envelope2
            '(4.2456284 7.2268248 6.4440737)
            '(3.682579 8.78879 10.000002)
            (gen-noise 356) :segment (primes 12) :type 2))




(list-plot (vector-to-envelope2
            '(4.2456284 7.2268248 6.4440737)
            '(3.682579 8.78879 10.000002)
            (gen-noise 356) :segment (primes 12) :type 3))
Opusmodus                                         vector-to-envelope2   7

(list-plot (vector-to-envelope2
            (rndn 12 -1.0 4.0)
            (rndn 12 -1.0 4.0)
            (gen-noise 356) :segment '(1 2 3)))




(setf env3 '(.2 .1 .5 .1 .8 .5 .1 .4 .2 .3))

(list-plot (vector-to-envelope2
            (gen-tendency 24 env3)
            (gen-tendency 24 env3)
            (gen-tendency 356 env3)
           :segment (primes 6) :type 3))
