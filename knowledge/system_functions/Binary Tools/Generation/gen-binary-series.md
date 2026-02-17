Opusmodus                                                                    gen-binary-series      1

gen-binary-series size count level &key rotate variant seed
[Function]

Arguments and Values:
size                    an integer (list length).
count                   an integer (binary number).
level                   an integer (unit size).
rotate                  an integer (1 forwards and -1 backwards). The default is 0.
variant                 'p (prime), 'r (retrograde), 'i (inversion) 'ri (retrograde inversion)
                        and '? (at random).
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

This function returns a binary list series of a given size. A random seed may be given
with variant arguments. This is a good function to use to create an instant beat/space
rhythm as found in much traditional / world music.

binary 1 = (1)
with level 2 = (0 1)
with internal retrograde = (1 0)

(gen-binary-series 24 1 2)
=> (1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)

binary 2 = (1 0)
with level 5 = (0 0 0 1 0)
with internal retrograde = (0 1 0 0 0)

(gen-binary-series 24 2 5)
=> (0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0)


Examples:
(gen-binary-series 24 1 '(3 2 4))
=> ((1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)
    (1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0))
                                               fi
Opusmodus                                                       gen-binary-series   2

(gen-binary-series 24 '(1 3 4) '(3 5 4) :rotate -2)
=> ((0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0)
    (0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 1 1)
    (1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0))

(gen-binary-series '(8 12 16) '(1 3 4) '(3 5 4) :rotate '(1 -1 0))
=> ((0 1 0 0 1 0 0 1)
    (1 0 0 0 1 1 0 0 0 1 1 1)
    (0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0))

Example with :variant option:

(gen-binary-series '(8 12 16) '(1 3 4) '(3 5 4)
                   :rotate '(1 -1 0) :variant '? :seed 786)
=> ((0 1 0 0 1 0 0 1)
    (1 0 0 0 1 1 0 0 0 1 1 1)
    (1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1))

(gen-binary-series '(8 12 16) '(1 3 4) '(3 5 4)
                   :rotate '(1 -1 0) :variant '(? r ri) :seed 786)
=> ((0 1 0 0 1 0 0 1)
    (1 1 1 0 0 0 1 1 0 0 0 1)
    (1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1))

(setf bin (gen-binary-series
          '(8 8 8 8 8 8 8 8) '(1 2 3) '(3 3 4)
          :variant '? :seed 62))
=> ((1 0 0 1 0 0 1 0)
    (1 0 0 1 0 0 1 0)
    (0 0 1 1 0 0 1 1)
    (0 1 0 0 1 0 0 1)
    (0 1 0 0 1 0 0 1)
    (1 1 0 0 1 1 0 0)
    (0 1 1 0 1 1 0 1)
    (0 1 1 0 1 1 0 1))

Mapping the bin variable to lengths with BINARY-MAP function:

(binary-map bin 's :omn t)
=> ((s - - = - - = -)
    (s - - = - - = -)
    (-s - = = - - = =)
    (-s = - - = - - =)
    (-s = - - = - - =)
    (s = - - = = - -)
    (-s = = - = = - =)
    (-s = = - = = - =))
