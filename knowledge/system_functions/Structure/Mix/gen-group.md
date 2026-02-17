Opusmodus                                                                           gen-group   1

gen-group list &key size group unison prob seed
[Function]

Arguments and Values:
list                     a list of items.
size                     an integer - length of a list. The default is NIL.
group                    an integer - number of groups. The default is NIL.
unison                   an integer - number of unisons. The default is NIL.
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
seed                     NIL or an integer. The default is NIL.


Description:

GEN-GROUP will generate series of groups based on the random distribution of values from
a list. In its simplest form the function makes n random generations based on a list's
content and length.

(gen-group '(0 1 2 3 4 5) :seed 27)
=> ((1 3 0 1 4 1)
    (4 2 5 0 5 5)
    (4 5 5 2 0 2)
    (2 2 2 3 5 0)
    (1 1 1 1 4 5)
    (1 0 3 5 2 3))

With an :unison value of '(1), all four groups will output in :unison. The maximum
value of the list determines the :group number if NIL. This function is particularly
effective when generating percussion textures with a 'kit' of instruments, for example congas
and bongos.

(setf congas-bongos '(c4 cs4 d4 eb4 e4)) ; GM midi notes

(gen-group congas-bongos :size 8 :unison '(1 4 5) :seed 7)
=> ((e4 d4 e4 cs4 e4 c4 e4 eb4)
    (e4 e4 d4 cs4 c4 e4 e4 cs4)
    (e4 c4 cs4 cs4 eb4 d4 e4 e4)
    (e4 cs4 c4 cs4 d4 eb4 e4 c4)
    (e4 d4 eb4 cs4 eb4 cs4 e4 c4))
                    fl
Opusmodus                                                                   gen-group   2

Examples:

With an :unison value of '(2 3 4):

(gen-group '(0 1 2 3 4 5) :unison '(2 3 4) :seed 4)
=> ((0 5 5 5 4 5)
    (4 3 2 5 0 0)
    (0 3 5 2 3 2)
    (4 4 1 2 4 1)
    (0 5 2 2 3 5)
    (4 4 3 5 0 0))

With an :unison value of '(1):

(gen-group '(c4 d4 e4 g4 a4) :unison '(1) :seed 25)
=> ((e4 c4 a4 e4 e4)
    (e4 c4 a4 e4 e4)
    (e4 c4 a4 e4 e4)
    (e4 c4 a4 e4 e4)
    (e4 c4 a4 e4 e4))

With a :unison value of '(2), ve independent lines are generated and distributed
between the groups:

(gen-group '(c4 d4 e4 g4 a4) :unison '(2) :seed 25)
=> ((e4 a4 c4 d4 a4)
    (a4 e4 d4 c4 d4)
    (e4 e4 d4 d4 a4)
    (a4 a4 c4 c4 d4)
    (e4 e4 d4 d4 a4))

With a :unison value of '(3), ve independent lines are generated and distributed
between the groups:

(gen-group '(c4 d4 e4 g4 a4) :unison '(3) :seed 25)
=> ((a4 a4 a4 e4 e4)
    (a4 e4 a4 a4 d4)
    (c4 c4 g4 c4 a4)
    (e4 e4 d4 c4 a4)
    (e4 a4 d4 e4 d4))

A :unison value of '(4) will generate a series of highly independent lines with
no :unison values at all:

(gen-group '(c4 d4 e4 g4 a4) :size 8 :group 4 :unison '(4) :seed 25)
=> ((e4 e4 d4 d4 e4 c4 c4 d4)
    (a4 c4 c4 g4 g4 e4 g4 a4)
    (c4 a4 a4 a4 d4 g4 e4 g4)
    (g4 d4 g4 c4 c4 d4 a4 c4))
                          fi
                          fi
