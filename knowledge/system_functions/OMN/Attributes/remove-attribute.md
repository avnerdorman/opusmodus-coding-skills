Opusmodus                                                                        remove-attribute        1

remove-attribute attribute sequence &key section exclude
[Function]

Arguments and Values:
attribute            A list of attributes you want to remove from the sequence. These could
                     be articulations like 'legato' (leg), 'marcato' (marc), 'glissando' (gliss), etc.
sequence             An OMN sequence.
section              an integer or list of integers. Selected list or lists to process. The default is NIL.
exclude              an integer or list of integers. Excluded list or lists from process.
                     The default is NIL.


Description:

This function REMOVE-ATTRIBUTE is designed to remove speci ed attributes
(articulations) from an OMN sequence.


Examples:
(setf omn '(5h fs6 mp stacc 5q f6 ten - fs6 fermata))

(remove-attributes '(stacc ten) omn)
=> (5h fs6 mp 5q f6 - fs6 fermata)

(setf seq
      '((5h fs6 mp stacc 5q f6 ten - fs6 fermata)
        (3h bb6 p stacc -3q)
        (5q gs6 f stacc a6 ten - gs6 fs6 fermata)
        (5e gs6 mf stacc fs6 stacc 5q g6 ten - gs6 fermata g6)
        (s bb6 mp stacc b6 ten bb6 -)
        (5q f6 p stacc 5h fs6 ten 5q f6 -)
        (5q eb6 f stacc - 5h e6 ten 5q eb6)))

(remove-attributes '(stacc ten) seq :section '(0..2))
=> ((5h fs6 mp 5q f6 - fs6 fermata)
    (3h bb6 p -3q)
    (5q gs6 f a6 ten - gs6 fs6 fermata)
    (5e gs6 mf stacc fs6 stacc 5q g6 ten - gs6 fermata g6)
    (s bb6 mp stacc b6 ten bb6 -)
    (5q f6 p stacc 5h fs6 ten 5q f6 -)
    (5q eb6 f stacc - 5h e6 ten 5q eb6))
                                                                fi
