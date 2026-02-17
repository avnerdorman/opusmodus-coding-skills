Opusmodus                                                      binary-to-attribute    1

binary-to-attribute binary attribute
[Function]

Arguments and Values:
binary                 map (a binary list).
attribute              an attribute symbol.


Description:

This function enables attribute symbols to be devised from a binary stream. Thus, a
sequence of (1 0 0 0) — 1 is an attribute symbol and 0 is a '- symbol.


Examples:
(binary-to-attribute '(0 0 1 1 0 0 0 1) 'marc)
=> (- - marc marc - - - marc)

(binary-to-attribute (gen-weight 12 '((0 4) (1 1))) 'fermata)
=> (- - - - - - - - - - fermata -)

(binary-to-attribute (gen-weight 12 '((0 3) (1 1))) 'stacc)
=> (stacc - stacc stacc - stacc - - stacc - - -)
