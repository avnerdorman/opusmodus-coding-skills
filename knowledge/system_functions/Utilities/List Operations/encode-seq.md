Opusmodus                                                                     encode-seq    1

encode-seq sequence
[Function]

Arguments and Values:
sequence                 a sequence.


Description:

This function is used to dismiss repeat symbols ‘=‘ where formerly there had been
repetitions of pitch, length, omn symbols, velocity symbols and/or oating point integers.
This may be helpful when creating bespoke functions or where the composer seeks clarity
when examining output of lists.

(encode-seq '(p = = f mf p = =))
=> (p p p f mf p p p)


Examples:
(encode-seq '(w q e -e = =))
=> (1 1/4 1/8 -1/8 1/8 1/8)

(encode-seq '(c4 = fs4 = c4 = fs4 c4d4e4f4))
=> (c4 c4 fs4 fs4 c4 c4 fs4 c4d4e4f4)

(encode-seq '(0.20 = = = 0.30 0.40))
=> (0.2 0.2 0.2 0.2 0.3 0.4)
                                                           fl
