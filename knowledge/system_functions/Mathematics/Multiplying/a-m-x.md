Opusmodus                                                                                        a*x   1

a*x a x &key select exclude
[Function]

Arguments and Values:
a                         a number.
x                         a sequence of numbers.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

This function returns a list of numbers obtained by multiplying each element of x by a.

(a*x 2 '(1 2 3))
=> (2 4 6)

(a*x 2 '(1/4 1/2 1/8))
=> (1/2 1 1/4)

(a*x 3 '((1/4 1/2) (1/5 1/6)) :section 1)
=> ((1/4 1/2) (3/5 1/2))

(setf *a* '(10.0 20.0 30.0))

(a*x pi *a*)
=> (31.41592653589793 62.83185307179586 94.24777960769379)


Examples:

It can be useful in situations when a list of integers or note lengths needs to be extended for
further processing. One example might be in keeping a self-similar relationship intact
between pitch, velocity and note-length.

(setf phrase (rndn 20 0 12))
=> (6 4 4 12 3 6 0 1 7 5 11 5 3 2 1 4 11 11 11 5)

(setf p-phrase (integer-to-pitch phrase))
=> (fs4 e4 e4 c5 eb4 fs4 c4 cs4 g4 f4
    b4 f4 eb4 d4 cs4 e4 b4 b4 b4 f4)

(setf v-phrase (get-velocity (a*x 10 phrase) :type :symbol))
=> (mp pp pp fffff ppp mp nil pppp mf p ffff
    p ppp ppp pppp pp ffff ffff ffff p)
Opusmodus                                                 a*x   2

(setf l-phrase (gen-length (a*x 2 phrase) 32))
=> (3/8 1/4 1/4 3/4 3/16 3/8 -1/32 1/16 7/16 5/16 11/16
    5/16 3/16 1/8 1/16 1/4 11/16 11/16 11/16 5/16)
