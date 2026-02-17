Opusmodus                                                                     gen-retrograde     1

gen-retrograde sequence &key encode flatten section exclude type
[Function]

Arguments and Values:
sequence                 a list or lists.
encode                   T or NIL. With :encode T (the default) the function transforms OMN repeat
                         symbols (=) into its values, while :encode NIL returns selections
                         unchanged.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
flatten                  NIL or T. The default is NIL.
type                     :pitch :length or :velocity. The default is NIL.


Description:

This function generates retrograde versions of given sequence.

(gen-retrograde '(c4 d4 e4 f4 g4))
=> (g4 f4 e4 d4 c4)


Examples:

A musical line is said to be its retrograde or cancrizans ("walking backward", medieval Latin,
from cancer, crab). An exact retrograde includes both the pitches and rhythms in reverse. In
simple lists it is possible to use the LISP primitive REVERSE.

(reverse '(c4 d4 e4 f4 g4))
=> (g4 f4 e4 d4 c4)

When used in OMN script, however, GEN-RETROGRADE becomes an extremely powerful
function. First, it will retain the structure of OMN notation:

(setf omn-fragment '(e c4 mp d4 q e4 mf e f4 pp g4 s a4 ff b4))

(gen-retrograde omn-fragment)
=> (s b4 ff a4 e g4 pp f4 q e4 mf e d4 mp c4)

Additionally we can select speci c types of OMN value to retrograde. For example, we may
retrograde the pitches, but keep the length and velocity the same:

(gen-retrograde omn-fragment :type :pitch)
=> (e b4 mp a4 q g4 mf e f4 pp e4 s d4 ff c4)
                          fi
Opusmodus                                                     gen-retrograde   2

Likewise with lengths:

(gen-retrograde omn-fragment :type :length)
=> (s c4 mp d4 e e4 mf f4 pp q g4 e a4 ff b4)

And velocities:

(gen-retrograde omn-fragment :type :velocity)
=> (e c4 ff d4 q e4 pp e f4 g4 mf s a4 mp b4)

Use the :section keyword to process only selected sublists:

(gen-retrograde '((e c4 mp d4) (q e4 mf e f4 pp g4) (s a4 ff b4))
                :type :pitch :section '(0 2))
=> ((e d4 mp c4) (q e4 e f4 pp g4) (s b4 ff a4))
