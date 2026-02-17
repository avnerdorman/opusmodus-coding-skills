Opusmodus                                                     contain-attributep   1

contain-attributep attribute sequence
[Function]

Arguments and Values:
attribute             an attribute (articulation).
sequence              a sequence.


Description:

Return true if attribute is found in the sequence, and NIL otherwise.


Examples:
(contain-attributep 'fermata '(-h fermata))
=> t

(contain-attributep 'stacc '(-e a4 fermata+stacc d4 p fermata))
=> t
