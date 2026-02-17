Opusmodus                                                                        gen-binary-rnd      1

gen-binary-rnd count size low high &key start rotate prob seed
[Function]

Arguments and Values:
count                   an integer (number of return lists).
size                    an integer (list length).
low                     an integer.
high                    an integer.
rotate                  an integer or list. The default is 0 (rotation).
start                   NIL, 0 or 1. The default is NIL (random).
prob                    Optional parameter with a default value of 0.5. This is a oating-point
                        number ranging between 0.0 and 1.0, which affects the distribution
                        of the generated random number within the speci ed range. A lower value for
                        this parameter increases the likelihood of selecting a lower number within
                        the given range, while a higher value favours the selection of higher numbers.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

This function makes a random list of binary integers. It can make N lists of any size
(length) and control to balance of 1 and 0 with low and high arguments. The list may be
rotated and a start 1 or 0 may be indicated. A random seed may be given. This is
probably the best function to use to create an instant beat/space rhythm as found in much
traditional / world music.


Examples:
(gen-binary-rnd 1 10 1 3 :seed 89)
=> (0 0 1 1 0 0 0 1 0 0)

(binary-map (gen-binary-rnd 1 10 1 3 :seed 89) 's :omn t)
=> (-s - = = - - - = - -)

With probability:

(gen-binary-rnd 12 10 1 3 :prob .1)
=> ((1 1 1 0 1 0 0 0 1 0) (0 0 0 1 1 1 0 1 1 1) (1 0 1 1 1 0 0 0 1 1)
    (0 0 1 1 0 0 0 1 1 0) (1 1 0 1 0 0 0 1 0 0) (0 0 1 0 1 1 0 0 1 0)
    (1 1 0 1 0 0 1 0 1 0) (0 1 0 1 0 0 0 1 0 1) (1 0 0 1 0 1 0 0 1 1)
    (0 0 1 1 0 0 0 1 0 0) (1 0 0 1 0 1 0 1 1 0) (0 1 0 1 1 0 1 0 1 0))
                                                fi
                                                                 fi
                                                                          fl
Opusmodus                                                                   gen-binary-rnd   2

(gen-binary-rnd 12 10 1 3 :prob .5)
=> ((0 0 1 1 1 0 0 1 1 1) (1 0 0 1 0 0 1 1 1 0)
    (0 0 1 0 0 0 1 1 1 0) (1 0 1 1 1 0 1 0 0 0)
    (0 0 0 1 1 1 0 1 1 1) (1 1 0 1 1 1 0 1 0 0)
    (0 0 0 1 0 1 0 0 1 1) (1 1 1 0 0 0 1 0 0 0)
    (0 0 0 1 1 0 0 0 1 1) (1 0 0 1 0 0 0 1 1 1)
    (0 0 0 1 1 0 0 1 1 1) (1 0 0 0 1 0 1 0 0 0))

(gen-binary-rnd 12 10 1 3 :prob .9)
=> ((0 0 0 1 1 1 0 0 0 1) (1 1 1 0 0 0 1 1 0 0)
    (0 0 1 1 1 0 0 1 1 1) (1 1 0 0 0 1 1 1 0 0)
    (0 0 1 1 1 0 0 0 1 1) (1 1 0 0 1 1 1 0 0 0)
    (0 1 1 1 0 0 0 1 0 0) (1 1 0 0 1 1 1 0 0 0)
    (0 0 0 1 1 0 0 0 1 1) (1 1 0 0 1 1 1 0 0 0)
    (0 0 0 1 1 0 0 1 1 1) (1 1 0 0 1 1 1 0 0 0))

See in the example below how list size can be subject to a list of sizes / lengths.

(gen-binary-rnd 8 '(3 5 7 11) 1 3 :start 1)
=> ((1 1 0)
    (0 0 1 1 1)
    (1 0 0 0 1 1 0)
    (0 1 1 1 0 0 1 1 1 0 0)
    (1 1 1)
    (0 0 0 1 0)
    (1 1 0 1 0 0 0)
    (0 1 1 1 0 0 1 0 0 1 0))

Here's a short example of a way to make sure the output is always a bar of 5/8.

(setf b-lis (gen-binary-rnd 1 10 1 4 :start 0))
=> (0 0 1 1 0 0 1 1 1 0)

(setf m-lis
     (rnd-sample (1~ (count-item 1 b-lis)) '(c4 cs4 fs4 g4 c5)))
=> (c4 cs4 fs4 cs4 c5)

(setf rhy (binary-map b-lis 's :omn t))
=> (-s - = = - - = = = -)

(setf vel (rnd-sample (1~ (count-item 1 b-lis)) '(f mf mp)))
=> (f mf mp mp f)

(setf score (make-omn :length rhy :pitch m-lis :velocity vel))
=> (-s - c4 f cs4 mf - - fs4 mp cs4 c5 f -)
