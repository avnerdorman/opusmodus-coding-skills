Opusmodus                                                                                          ql   1

ql list &key omn
[Function]

Arguments and Values:
list                     A list or nested lists where each element consists of a pair of values: a number
                         and a note-length. The number indicates the repetition or duration of the
                         note-length. The list can contain both individual note-length pairs and groups
                         of note-length pairs.

omn                      A keyword argument, either NIL or T. If T, the output will be formatted in
                         OMN (Opusmodus Notation) style. The default value is NIL.


Description:

The QL function is designed to facilitate the quick composition of rhythms by converting a
list of note-length pairs into a sequence of corresponding fractional note values or OMN
formatted output. Each element in the input list should be a pair where the rst value is a
number representing the repetition or duration, and the second value is the note-length. The
function can process both individual note-length pairs and nested groups of note-length pairs,
making it versatile for generating rhythmic sequences. When the omn keyword is set to T,
the output is formatted in OMN style, where the note-lengths are expressed as corresponding
rhythmic symbols.


Examples:

Basic Usage Without OMN Style:

(ql '(4 e 2 s 1 -e 3 e))
=> (1/8 1/8 1/8 1/8 1/16 1/16 -1/8 1/8 1/8 1/8)

This example converts a list of note-length pairs into a sequence of fractional note values.
The list includes pairs where the rst value indicates the number of times the note-length
should be repeated. For instance, (4 e) indicates that the eighth note should be repeated four
times.
                          fi
                                                                            fi
Opusmodus                                                                                   ql     2

Using OMN Style Output:

(ql '(4 e 2 s 1 -e 3 e) :omn t)
=> (e = = = s = -e = = =)

This example demonstrates the same list as the previous one, but with OMN style output
enabled. The note-lengths are represented by rhythmic symbols (e for eighth note, s for
sixteenth note, etc.), and equal signs (=) are used to indicate repeated durations as speci ed
by the rst value in each pair.

Handling Nested Lists:

(ql '((8 s) (2 -q) (12 s) (3 -e) (3 e) (4 e) (1 -q) (4 e 2 s)) :omn t)
=> ((s = = = = = = =) (-q -) (s = = = = = = = = = = =)
    (-e - -) (e = =) (e = = =) (-q) (e = = = s =))

This example shows how QL handles nested lists of note-length pairs. Each sublist is
processed independently, producing OMN style output for each group. Nested lists allow you
to group and format certain rhythmic values together for more complex rhythmic patterns.

Tuplets Handling:

(ql '((8 s) (3 3e) (12 s) (3 -e) (5 5q) (4 3q) (7 7h) (4 e 2 s)) :omn t)
=> ((s = = = = = = =) (3e = =) (s = = = = = = = = = = =)
    (-e - -) (5q = = = =) (3q = = =) (7h = = = = = =) (e = = = s =))

In this example, tuplets are introduced into the rhythmic sequence. The QL function can
process these tuplets, interpreting them correctly according to the rst value in each pair, and
outputs them in the appropriate OMN format, making it suitable for complex rhythmic
compositions.

Using GEN-DIVIDE for Enhanced List Handling:

(ql
 (gen-divide
  '(2 2 2 2 4 2)
  '(5 e 3 e 1 h 16 s 2 q 4 e 5 e 16 s 2 q 1 h))
 :omn t)
=> ((e = = = =) (e = =) (h) (s = = = = = = = = = = = = = = =)
    (q = e = = =) (e = = = =) (s = = = = = = = = = = = = = = =)
    (q =) (h))

This example demonstrates the combination of ql with the GEN-DIVIDE function, which
divides a list of note-length pairs into sublists according to a speci ed pattern. The resulting
structure is then processed by QL to produce OMN formatted output, allowing for the
generation of more sophisticated rhythmic patterns.
fi
                                                              fi
                                                              fi
                                                                                    fi
