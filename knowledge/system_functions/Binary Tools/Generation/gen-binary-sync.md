Opusmodus                                                                      gen-binary-sync      1

gen-binary-sync length pitch &key type seed
[Function]

Arguments and Values:
length                  a list or lists of lengths.
pitch                   a list or lists of pitches.
type                    's (start), 'e (end), '? (rnd-order). The default is 's.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.




Description:

This function synchronises a list of pitches with a list of lengths even if their
respective lengths are different.

(gen-binary-sync '(s = = = = =) '(d2 gb2))
=> (1 1 0 0 0 0)


Examples:
(gen-binary-sync '(s = = = = =) '(d2 gb2) :type 'e)
=> (0 0 0 0 1 1)

(gen-binary-sync '(s = = = = =) '(d2 gb2) :type '?)
=> (1 1 0 0 0 0)

(setf lengths '((e = =) (e = =) (e = =)
                (e = =) (e = =) (e = =)
                (e = =) (e = =) (e = =)
                (e = =) (e = =) (e = =)))

(setf pitches '((d2 fs2) (c3) (c3) (g2 a2) (d2) (gs2 c3 e2 gs2)
                (c3) (c2 e2 a2) (g2 a2) (d2 fs2) (d2 fs2) (c3)))

(setf map (gen-binary-sync lengths pitches))
=> ((1 1 0) (1 0 0) (1 0 0) (1 1 0) (1 0 0) (1 1 1 0)
    (1 0 0) (1 1 1) (1 1 0) (1 1 0) (1 1 0) (1 0 0))

(binary-map map lengths :omn t)
=> ((e = -) (e - -) (e - -) (e = -) (e - -) (e = = -)
    (e - -) (e = =) (e = -) (e = -) (e = -) (e - -))
                                               fi
Opusmodus                                                                  gen-binary-sync    2




The example below demonstrates that the process could work the other way around. Indeed
any type of list may be the master list. Here is a list of pitches as a master list rather than
lengths.

(setf pitches (gen-binary-sync '(c4 cs4 fs4 g4 b4 c5) '(e =)))
=> (1 1 0 0 0 0)

(binary-map pitches '(e = =) :omn t)
=> (e = - - - -)
