Opusmodus                                                                       primes-to      1

primes-to n
[Function]

Arguments and Values:
n                        an integer.


Description:

A prime number (or a prime) is a natural number greater than 1 that has no positive divisors
other than 1 and itself. The PRIMES-TO will calculate all the primes up to the value of n.

(primes-to 34)
=> (2 3 5 7 11 13 17 19 23 29 31)

(primes-to 200)
=> (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67
    71 73 79 83 89 97 101 103 107 109 113 127 131 137 139
    149 151 157 163 167 173 179 181 191 193 197 199)


Examples:

Prime numbers can be useful in creating expanding series of phrase lengths or proportional
structures.

(setf white-series (vector-to-pitch
                    '(g3 b4) (gen-noise 41 :seed 23)))

(sum (primes-to 13)) ;(2 3 5 7 11 13)
=> 41

(setf white-series-phrases (gen-divide (primes-to 13) white-series))
=> ((eb4 c4) (c4 b4 b3) (eb4 g3 gs3 e4 d4) (bb4 d4 bb3 a3 gs3 c4 a4)
    (bb4 bb4 cs4 g3 cs4 bb3 b4 fs4 b3 cs4 fs4)
    (bb4 a3 a4 gs4 d4 gs4 c4 fs4 g4 g4 g4 gs4 gs3))
