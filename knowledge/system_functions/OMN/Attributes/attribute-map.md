Opusmodus                                                                         attribute-map   1

attribute-map attribute map sequence
[Function]

Arguments and Values:
attribute               an attribute or a list of attributes.
map                     a list with bar and position values (<bar-number>(<position>)).
sequence                an omn sequence.


Description:

The function ATTRIBUTE-MAP aligns attributes of one sequence (instrument) to another
sequence. It is especially useful when aligning attributes like fermatas.


Examples:
(setf inst1
      '((5h fs6 mp stacc 5q f6 ten - fs6 fermata)
        (3h bb6 p stacc -3q)
        (5q gs6 f stacc a6 ten - gs6 fs6 fermata)
        (5e gs6 mf stacc fs6 stacc 5q g6 ten - gs6 fermata g6)
        (s bb6 mp stacc b6 ten bb6 -)
        (5q f6 p stacc 5h fs6 ten 5q f6 -)
        (5q eb6 f stacc - 5h e6 ten 5q eb6)))
Opusmodus                                              attribute-map   2

(setf inst2
      '((3q c6 mf -3h)
        (-5q gs5 p 5h g5 5e gs5 g5)
        (-3q 3h bb5 p)
        (-3h 3e bb5 mf a5)
        (-3q 3h a5 mp)
        (5e bb5 p c6 -5q 5h b5 5e 5e cs6)

            (-s c6 f d6 e6)))




Inserting fermata attribute into the inst2 sequence:

(setf map (attribute-position 'fermata inst1))
=> ((1 (1/5)) (3 (1/5)) (4 (3/20)))

(attribute-map 'fermata map inst2)
=> ((3q c6 mp -3h fermata)
    (-5q gs5 p 5h g5 5e gs5 g5)
    (-3q 3h bb5 f fermata)
    (-3h 3e bb5 mf fermata a5)
    (-3q 3h a5 mp)
    (5e bb5 p c6 -5q 5h b5 5e 5e cs6)
    (-s c6 f d6 e6))
Opusmodus                                                         attribute-map   3

Inserting fermata and stacc attributes into the inst2 sequence:

(setf map2 (attribute-position '(fermata stacc) inst1))
=> (((1 (1/5)) (3 (1/5)) (4 (3/20)))
    ((1 (0)) (2 (0)) (3 (0)) (4 (0 1/40)) (5 (0)) (6 (0)) (7 (0))))

(attribute-map '(fermata stacc) map2 inst2)
=> ((3q c6 mf stacc -3h fermata)
    (-5q gs5 mf 5h g5 5e gs5 g5)
    (-3q 3h bb5 mf fermata)
    (-3h 3e bb5 mf stacc+fermata a5)
    (-3q 3h a5 mp)
    (5e bb5 p stacc c6 -5q 5h b5 5e 5e cs6)
    (-s c6 f d6 e6))
