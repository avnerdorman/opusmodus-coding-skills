Opusmodus                                                                              Random-om   1

random-om n &key seed
[Function]

Arguments and Values:
n                     a seed number.
:seed                 an integer. Ensures the same result each time the code is evaluated.
                      The default is NIL.


Description:

The OPUSMODUS RANDOM-OM function ensures the same result (seed) each time the code
is evaluated.


Examples:

COMMON LISP RANDOM function:
(random 1.0)
=> 0.704688

OPUSMODUS RANDOM-OM function:
(random-om 1.0)
=> 0.047675304

(random-om 1.0 :seed 45)
=> 0.27268404
