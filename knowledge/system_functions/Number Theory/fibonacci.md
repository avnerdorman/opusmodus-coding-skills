     Opusmodus                                                                   fibonacci     1

     fibonacci n &optional n2
     [Function]

     Arguments and Values:
     n                        an integer.
     n2                       an integer.


     Description:

     The FIBONACCI function will generate either the nth FIBONACCI number, or a series of
     FIBONACCI numbers.

     In mathematics, the FIBONACCI numbers are a sequence of numbers named after Leonardo
     of Pisa, known as FIBONACCI (a contraction of lius Bonaccio, 'son of Bonaccio').
     Fibonacci's 1202 book 'Liber Abaci' introduced the sequence to Western European
     mathematics, although the sequence had been previously described in Indian
     mathematics.

     The rst number of the sequence is 0, the second number is 1, and each subsequent number
     is equal to the sum of the previous two numbers of the sequence itself. For example, to
     generate the rst ten FIBONACCI numbers we can evaluate this function:

     (fibonacci 0 9)
     => (0 1 1 2 3 5 8 13 21 34)

     To get only the tenth number:

     (fibonacci 9)
     => 34
fi
            fi
                                              fi
Opusmodus                                            fibonacci   2

Examples:
(setf fib (fibonacci 0 23))
=> (0 1 1 2 3 5 8 13 21 34 55 89 144 233 377
    610 987 1597 2584 4181 6765 10946 17711 28657)

(list-plot fib
 :join-points t :point-radius 2.5
 :line-width 0.5 :zero-based t)
