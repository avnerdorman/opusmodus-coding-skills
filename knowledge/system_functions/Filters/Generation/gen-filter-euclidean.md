Opusmodus                                                                  gen-filter-euclidean   1

gen-filter-euclidean n size low high pitch length
                                     &key velocity invert rotate span seed

[Function]

Arguments and Values:
n                        an integer (number of return lists).
size                     an integer (list length).
low                      an integer.
high                     an integer.
pitch                    list of pitches.
length                   length symbol or list of lengths.
velocity                 NIL or list of velocities.
invert                   NIL or T. If T the internal binary map in inverted The default is NIL.
rotate                   an integer or list. The default is 0.
span                     :pitch or :length. The default is :pitch.
seed                     an integer or NIL. The default is NIL.


Description:

This function is based on the Euclidean algorithm. This computes the greatest common
divisor of two given integers. It has been demonstrated that the structure of this algorithm
can generate a large family of ostinato-like rhythms. The unique feature of such ostinatos is
the even distribution of their patterns.

In Traditional World Music a common method for representing musical rhythms is as a
binary sequence, sometimes known as 'beat / space'. In the literature of ethnomusicology the
usual representation of the beat/space is "x" and ".". In OPUSMODUS we shall use 1 and 0.
So a rhythm such as E(5,13=[x . . x . x . . x . x . . ] would look like this '(1 0 0 1 0 1 0
0 1 0 1 0 0). This rhythm is a cyclic rhythm with a time span of 13 units.

(gen-binary-euclidean 1 13 5 5)
=> (1 0 0 1 0 1 0 0 1 0 1 0 0)

The function GEN-FILTER-EUCLIDEAN uses the binary mechanism described above to
produce a binary list from which the ltering process works.

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 234))
=> (gs4 e4 e4 d4 e4 gs4 d4 c4 fs4 gs4
    e4 e4 c4 e4 gs4 d4 gs4 fs4 fs4 d4)

(gen-filter-euclidean 3 8 1 7 mat 's :seed 46)
=> ((s gs4 - - - e4 - - -)
    (s fs4 gs4 e4 e4 c4 e4 gs4 -)
    (s gs4 - fs4 - gs4 - e4 -))
                               fi
Opusmodus                                                            gen-filter-euclidean      2

If a single list is required then append the function FLATTEN to the head of the expression.

(flatten (gen-filter-euclidean 3 8 1 7 mat 's :seed 46))
=> (s gs4 - - - e4 - - - s fs4 gs4 e4 e4
    c4 e4 gs4 - s gs4 - fs4 - gs4 - e4 -)

One further feature of this function lies in the use of the keyword :invert. This is common
to all GEN-FILTER functions and is based on one of the building blocks of the ltering
process, conversion into a binary list. As a binary list can be inverted (1 0 0 1 1 0) can
become (0 1 1 0 0 1) the possibility of two outcomes can be realised giving the
composer a further possibility of variation.

(gen-filter-euclidean 3 8 1 7 mat 's :invert t :seed 46)
=> ((-s e4 e4 d4 - gs4 d4 c4)
    (-s - - - - - - d4)
    (-s fs4 - d4 - e4 - d4))


Examples:
(gen-filter-euclidean
 10 13 3 7 mat 's :rotate '(-1 2 0 1) :seed 457)
=> ((-s e4 - d4 - gs4 - c4 - gs4 - - c4)
    (-s - d4 - - - d4 - - - d4 - -)
    (s d4 - fs4 - e4 - c4 - gs4 - gs4 - fs4)
    (-s gs4 - - d4 - - d4 - - gs4 - -)
    (-s - gs4 - gs4 - - d4 - e4 - - e4)
    (-s - c4 - gs4 - e4 - e4 - d4 - fs4)
    (s fs4 - - e4 - d4 - - d4 - fs4 - -)
    (-s c4 - - d4 - fs4 - - gs4 - e4 -)
    (-s - d4 - - gs4 - - c4 - - - gs4)
    (-s fs4 d4 - e4 - d4 - gs4 - c4 - gs4))

(gen-filter-euclidean
 10 13 1 7
 (vector-to-pitch '(g4 g5) (gen-noise 64 :seed 246))
 (vector-to-length 's 1 5 (gen-noise 64 :seed 456))
 :velocity (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 546)))
=> ((s bb4 f -q - e. eb5 -s -e q_s g4 mf - -e e. eb5 f - - -q_s)
    (q_s c5 -e - q fs5 mp -e -q eb5 ff -q_s -q f5 mp -e -q -s)
    (e. bb4 f -e f5 -q a4 - fs5 mf - e5 f -q_s e. g5 mf -q -e.)
    (q fs5 ff -e -q e gs4 mf - -e. s bb4 f - -e. e d5 -q_s -s -q_s)
    (s e5 f -e -e. -q_s -q -e. eb5 mf -e -q -e -e. -q_s -s)
    (q gs4 f - -e. -s e g4 ff -q_s - -e e. eb5 f - - -q_s -)
    (e bb4 f - -q e a4 mf -q eb5 ff -q_s -q f5 mp -e q fs5 mf -s -e.)
    (e cs5 - q a4 mp - bb4 mf - b4 ff - q_s d5 mf -e. q f5 ff -e. -q)
    (e fs5 -q -e cs5 mp -e. -s g4 -e. -e q_s cs5 mf -s -q_s -s)
    (e a4 f -e. q_s gs4 -q e. c5 mf - e f5 mp -q e c5 f -e.
     q_s f5 mf -s -q))
                                                                         fi
