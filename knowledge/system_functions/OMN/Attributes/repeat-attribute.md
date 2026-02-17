Opusmodus                                                                             repeat-attribute        1

repeat-attribute attribute sequence &key type section exclude
[Function]

Arguments and Values:
attribute                 An attribute (articulation) you want to insert or replace in the sequence when
                          pitch or length values repeat. This could be an articulation like
                          'staccato' (stacc), 'legato' (leg), 'marcato' (marc), etc.
sequence                  An OMN sequence.
type                      This key allows you to specify whether the attribute should be inserted or
                          replaced when pitch values repeat or when length values repeat. If not
                          speci ed, the function defaults to 'pitch.
section                   an integer or list of integers. Selected list or lists to process. The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

The REPEAT-ATTRIBUTE function allows you to insert or replace a speci ed
attribute (articulation) in an OMN sequence when either pitch (default) or length
values repeat.


Examples:
(setf sequence '((s c4 leg d4 leg e4 leg e4 e f4 stacc g4 stacc
                  s a4 leg a4 leg a4 leg a4 q b4 marc)
                 (e d4 e4 s f4 leg f4 leg f4 leg g4 q a4 stacc)))

                                                           2




(repeat-attribute '(stacc) sequence)

                                                          2




(repeat-attribute '(stacc) sequence :type 'length)

                                                              2
                     fi
                                                                                 fi
