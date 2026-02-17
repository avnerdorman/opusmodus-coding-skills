Opusmodus                                                                  happy-numbers   1

happy-numbers n
[Function]

Arguments and Values:
n                        an integer.


Description:

Generate the 'happy numbers' of the value N. A happy number is de ned by the following
process: Starting with any positive integer, replace the number by the sum of the squares of
its digits, and repeat the process until the number equals 1. Those numbers for which this
process ends in 1 are happy numbers, while those that do not end in 1 are unhappy numbers.

All powers of 10 are happy numbers. Reversing the digits of a happy number produces
another happy number. Multiplying a happy number by any power of ten yields another
happy number. By rearranging the digits of a happy number, we get another happy number.

(setf mat (happy-numbers 500))
=> (1 7 10 13 19 23 28 31 32 44 49 68 70 79 82
      86 91 94 97 100 103 109 129 130 133 139
      167 176 188 190 192 193 203 208 219 226
      230 236 239 262 263 280 291 293 301 302
      310 313 319 320 326 329 331 338 356 362
      365 367 368 376 379 383 386 391 392 397
      404 409 440 446 464 469 478 487 490 496)


Examples:

Generating 12 tone happy-row:

(setf happy-row
        (find-unique
         (interval-modus (happy-numbers 2000) :mod 12)))
=> (1 7 10 11 4 8 2 9 0 3 5 6)
                                                            fi
Opusmodus                         happy-numbers   2

(list-plot happy-row
 :join-points t :point-radius 2
 :line-width 0.5 :zero-based t)
