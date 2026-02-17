Opusmodus                                                      attribute-position   1

attribute-position attribute sequence
[Function]

Arguments and Values:
attribute             an attribute or a list of attributes.
sequence              an omn sequence.


Description:

The function ATTRIBUTE-POSITION returns a lists of bar numbers and positions values
of a given attribute in a sequence. This function is a companion to the ATTRIBUTE-
MAP function.


Examples:
(setf mat '((h. f6 mp stacc) (-q h a4d2 p fermata e fermata)
            (e. a4d2 p - h e4g3 mf s fs6 p e c6 mp ten e. cs4 p tie)
            (e cs4 p q gs5eb6 h b2 p stacc e stacc)
            (q b2 p tie s q f6a4 mf -e q. d2 p ten)
            (h d2 p tie s q e4 mp tr2 s tr2 -q. q f4 stacc)
            (s f4 h. a3gs5 p fermata -e. -s)))

(attribute-position 'fermata mat)
=> ((2 (1/4 3/4)) (7 (1/16)))

(attribute-position '(fermata stacc) mat)
=> (((2 (1/4 3/4)) (7 (1/16)))
    ((1 (0)) (4 (3/8 7/8)) (6 (5/4))))
