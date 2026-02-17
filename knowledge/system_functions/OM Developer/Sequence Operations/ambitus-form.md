Opusmodus                                                           ambitus-form   1

ambitus-form object
[Function]

Arguments and Values:
object                 an integer (<low-integer> <high-integer>),
                       a pitch symbol (<low-pitch> <high-pitch>)
                       or instrument <name>.


Description:

Returns an integer ambitus-form list (low high).


Examples:
(ambitus-form 'violin)
=> (-5 43)

(ambitus-form '(2 34))
=> (2 34)

(ambitus-form '(violin))
=> ((-5 43))

(ambitus-form '(violin (2 34)))
=> ((-5 43) (2 34))

(ambitus-form '((2 34) midi))
=> ((2 34) (-60 67))

(ambitus-form '((2 34) (2 34)))
=> ((2 34) (2 34))

(ambitus-form '(violin cello))
=> ((-5 43) (-24 30))
