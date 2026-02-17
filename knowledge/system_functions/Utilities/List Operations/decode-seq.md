Opusmodus                                                                        decode-seq   1

decode-seq sequence
[Function]

Arguments and Values:
sequence                  a sequence.


Description:

This function is used to apply repeat symbols ‘=‘ in favour of repetitions of the pitch, length,
omn symbols, velocity symbols and/or oating point integers. This may be helpful when
creating bespoke functions or where the composer seeks clarity when examining output of
lists.

(decode-seq '(p p p f mf p p p))
=> (p = = f mf p = =)


Examples:
(decode-seq '(1 1/4 1/8 -1/8 1/8 1/8))
=> '(w q e - = =)

(decode-seq '(c4 c4 fs4 fs4 c4 c4 fs4 c4d4e4f4))
=> (c4 = fs4 = c4 = fs4 c4d4e4f4)

(decode-seq '(0.20 0.20 0.20 0.20 0.30 0.40))
=> (0.20 = = = 0.30 0.40)
                                  fl
