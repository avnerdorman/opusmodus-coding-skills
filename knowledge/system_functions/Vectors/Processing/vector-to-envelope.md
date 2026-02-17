Opusmodus                                                             vector-to-envelope   1

vector-to-envelope envelope values &key segment seed
[Function]

Arguments and Values:
envelope                 a list of oating-point numbers.
values                   a list of oating-point numbers or vector.
type                     1 (rnd-sum), 2 (rnd-sum-to-size) or 3 (sum-to-size).
                         The default is 1.
segment                  a list of numbers. The default is (prime 8)
                         => (2 3 5 7 11 13 17 19).
seed                     an integer or NIL. The default is NIL.


Description:

This function applies ambitus series derived from an envelope list into a list of
floating-point numbers.

Lets examine rst how envelope create the ambitus series (low high).
We interleave the envelope with a value 2 rst and then we apply a sort function:

(setf envelope '(-5.1 -2.3 1.5 -0.8 4.6 10.6))

(sort-asc (gen-interleave 2 envelope))
=> ((-5.1 -2.3) (-2.3 1.5) (-0.8 1.5) (-0.8 4.6) (4.6 10.6))

From the envelope above the function creates ve ambitus series each with two lists:
start (low high) and end (low high).

Start        End
((-5.1 -2.3) (-2.3 1.5))
((-2.3 1.5) (-0.8 1.5))
((-0.8 1.5) (-0.8 2.1))
((-0.8 2.1) (-0.8 4.6))
((-0.8 4.6) (4.6 10.6))

Next, the values list (floating-point numbers) is divided by the count of the
ambitus series. In our example the count is 5:

(sum-to-size 128 5)
=> (25 25 26 26 26)
        fi
                          fl
                          fl
                                       fi
                                            fi
     Opusmodus                                                          vector-to-envelope   2

     The nal process is to select randomly segment numbers for each of the 5 sublists:

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

     (list-plot (vector-to-envelope envelope (gen-noise 128)))
fi
Opusmodus                                                           vector-to-envelope   3



A slightly different result we can achieve with optional :type 2:

(list-plot (vector-to-envelope envelope (gen-noise 128) :type 2))




Most equal distribution of segments is achieved with :type 3:

(list-plot
 (vector-to-envelope envelope (gen-noise 128) :type 3))
Opusmodus                   vector-to-envelope   4

Examples:
(list-plot
 (vector-to-envelope
  (rndn 12 -10.0 40.0)
  (gen-noise 356)
  :segment '(1 2 3 4 5)))
Opusmodus              vector-to-envelope   5

(list-plot
 (vector-to-envelope
  (rndn 6 -1.0 4.0)
  (gen-noise 356)
  :segment '(1 2 3)
  :type 3))
Opusmodus                  vector-to-envelope   6

(list-plot
 (vector-to-envelope
  (rndn 4 -1.0 4.0)
  (gen-noise 356)
  :segment (primes 12)))
Opusmodus                                                vector-to-envelope   7

(setf env2 '(0.2 0.1 0.5 0.1 0.8 0.5 0.1 0.4 0.2 0.3))

(list-plot
 (vector-to-envelope
  (gen-tendency 4 env2)
  (gen-tendency 356 env2)
  :segment (primes 4)))
