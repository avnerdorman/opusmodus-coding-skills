Opusmodus                                                            length-to-binary   1

length-to-binary length &key value
[Function]

Arguments and Values:
length                a sequence.
value                 length symbol or ratio. The default is 1/16.


Description:

This function enables binary numbers to be devised from a length sequence. Thus, a
length 1/4 with a length value of 1/16 will output (1 0 0 0) — 1 is a note and 0 is
an extension of 1.


Examples:
(length-to-binary '(1/4 3/16 1/8 3/16))
=> (1 0 0 0 1 0 0 1 0 1 0 0)

(length-to-binary '(q e. e e.))
=> (1 0 0 0 1 0 0 1 0 1 0 0)

(length-to-binary '(s - - - e = -))
=> (1 0 0 0 1 0 1 0 0 0)

(length-to-binary '((q s) (e. e e.)))
=> ((1 0 0 0 1) (1 0 0 1 0 1 0 0))

(setf lengths (vector-to-length
               1/16 -2 5 (gen-noise 30 :seed 45)))
=> (-1/16 1/4 1/4 3/16 1/4 1/8 -1/8 5/16 5/16 -1/8 1/16 5/16 -1/8
    -1/16 -1/16 -1/16 1/4 -1/16 3/16 1/16 1/8 5/16 1/16 -1/8)

(length-to-binary lengths)
=> (0 1 0 0 0 1 0 0 0 1 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0
    0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 1 0 1 0 0 0 0 1 0 0)

(length-to-binary lengths :value 'e)
=> (1 0 1 0 1 1 0 1 0 1 0 1 0 0 1 1 0 0 1 0 1 1 1 1 0 1 0)
