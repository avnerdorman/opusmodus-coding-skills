Opusmodus                                                                      percent   1

percent total percent
[Function]

Arguments and Values:
total              an integer.
percent            an integer.


Description:

The PERCENT function is able to scale an integer.

(percent 100 10)
=> 10

(percent 75 50)
=> 38


Examples:

In the example below a series of numbers have been generated between two high values. To
scale these numbers down to be useful as a dynamic contour of velocity values a gure of 15
percent is chosen.

(setf r-numbers (rndn 32 192 384))
=> (227 376 320 243 270 323 375 217 358 342 280 344
    256 320 330 329 338 349 209 362 262 222 374 347
    266 351 331 294 332 296 240 239)

(setf mp-velocity (get-velocity (percent 15 r-numbers)))
=> (0.27 0.44 0.38 0.28 0.31 0.38 0.44 0.26 0.43 0.4
    0.33 0.41 0.3 0.38 0.39 0.39 0.4 0.41 0.24 0.43
    0.31 0.26 0.44 0.41 0.31 0.42 0.39 0.35 0.39 0.35
    0.28 0.28)
                                                                        fi
