Opusmodus                                                                                 prob-map   1

prob-map map otherwise numbers &key seed
[Function]

Arguments and Values:
map                     a value or a list of values.
otherwise               a values if probability NIL.
numbers                 a list of numbers ( oating point numbers).
seed                    an integer - ensure the same result each time the code is evaluated.
                        The default is NIL.


Description:

PROB-MAP can be used to generate lists of values based on a map and a series of probability
values.

(prob-map 1 0 (half-sine 32 0.98))
=> (0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 0 0 1 0 0 0 0)

(prob-map '(pp p mp mf ff ff) 'ppp (half-sine 32 0.98))
=> (ppp ppp ppp ppp mp ppp ppp ppp ff ff ff ppp ff ff ff
    ff ff ff ff ff ff ff ff ppp ff ppp ppp ppp ppp p ppp ppp)
                                   fl
