Opusmodus                                                                          primes      1

primes n &optional start
[Function]

Arguments and Values:
n                        an integer.
start                    the default is 2.


Description:

A prime number (or a prime) is a natural number greater than 1 that has no positive divisors
other than 1 and itself.


Examples:
(primes 4)
=> (2 3 5 7)

(primes 34)
=> (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67
    71 73 79 83 89 97 101 103 107 109 113 127 131 137 139)

(primes 4 5)
=> (5 7 11 13)

(primes 34 100)
=> (101 103 107 109 113 127 131 137 139 149 151 157 163 167
    173 179 181 191 193 197 199 211 223 227 229 233 239
    241 251 257 263 269 271 277)
