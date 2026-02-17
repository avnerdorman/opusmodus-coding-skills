Opusmodus                                                            dissolve-voices    1

dissolve-voices sequence
[Function]

Arguments and Values:
sequence               omn sequence.


Description:

The function DISSOLVE-VOICES allows you to convert omn sequence with voices into a
single voice sequence by removing z (zero) lengths and ^ voice symbols. The result of
voices are chords.


Examples:
(setf sequence '((z^q a3d4 p stacc q^h. d2 f)
                 (z^s e4 mp s^q b3 f4 stacc g4 d5 q a3bb4 g2f3)))




(dissolve-voices sequence)
=> ((q a3d4d2 p stacc) (s e4b3 mp f4 stacc g4 d5 q a3bb4 g2f3))
