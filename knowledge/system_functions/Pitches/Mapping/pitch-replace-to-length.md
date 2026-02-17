Opusmodus                                                          pitch-replace-to-length     1

pitch-replace-to-length low high new pitch length
                                           &key transpose

[Function]

Arguments and Values:
low                       length.
high                      length.
new                       pitch or chord.
pitch                     list of pitches.
length                    list of length.
transpose                 NIL or T. The default is T.


Description:

This function returns a copy of sequence in which each element has to satisfy a test.

(pitch-replace-to-length
 1/8 1/2
 '(c4cs4 c4cs4d4)
 '(c4 d4 e4 f4 = = g4 a4 b4 c4 d5 e5 f5 g5 a5 b5)
 '(1/12 2/12 1/8 1/20 1/20 1/20 1/8 1/2))
=> (c4 d4eb4 e4f4fs4 f4 f4 f4 g4gs4 a4bb4b4)


Examples:

The length of the output is governed by a list of lengths so this is a valuable function where a
rhythm is established but the pitch sequence needs to be reorganised. In the preliminary
example below a new chord (from a list of chord forms) replaces a pitch when note-length
is between 1/8 and 1/2. Additionally, the function looks at the root note of the replaced
pitch and :transposes the new chord to that pitch. The transposition addition is
optional.

(pitch-replace-to-length
 1/8 1/2
 '(c4cs4 c4cs4c5)
 '(c4 d4 e4 f4 g4 a4 b4 c4 d5 e5 f5 g5 a5 b5)
 '(1/12 2/12 1/8 1/20 1/20 1/20 1/8 1/2) :transpose nil)
=> (c4 c4cs4 c4cs4c5 f4 g4 a4 c4cs4 c4cs4c5)
