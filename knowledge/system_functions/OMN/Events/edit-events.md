Opusmodus                                                                         edit-events   1

edit-events method sequence
[Function]

Arguments and Values:
method                 a list: (<bar-num><event-num><function-or-value><type>).
sequence               omn sequence.

Methodes:

bar-number             an integer.
event-number           an integer.
function               function or value.
event-type             :length, :duration, :pitch, :velocity or :articulation.


Description:

The function EDIT-EVENTS allows you to process a single event in a given bar of a
given type.


Examples:
(setf mat1 '((e c2 c3e3g3 c3e3g3 c3e3g3)
             (e f2 c3f3a3 c3f3a3 c3f3a3)))




(edit-events '((1 3 '(pitch-transpose 6 x) :pitch)
               (2 1 '(length-divide '(1 2) x) :length)
               (2 1 '(pitch-melodize x) :pitch)
               (2 1 'stacc :articulation)) mat1)
Opusmodus                                                       edit-events   2

(setf mat2 '((e c2 c3e3g3 c3e3g3 c3e3g3)
             (e f2 c3f3a3 c3f3a3 c3f3a3)
             (e e2 e3g3c4 e3g3c4 e3g3c4)
             (e gs2 e3b3 e3b3 e3b3 g2 d3g3b3 d3g3b3 d3g3b3)))




(edit-events
 '((1 2 '(chord-inversion 1 x) :pitch)
   (1 3 '(chord-inversion 2 x) :pitch)
   (1 4 '(pitch-variant x :variant 'i) :pitch)
   (3 2 '(chord-inversion 1 x) :pitch)
   (3 3 '(chord-inversion 1 (pitch-transpose 12 x)) :pitch)
   (4 2 '(chord-inversion 1 (pitch-transpose 12 x)) :pitch)
   (4 3 '(chord-inversion 2 x) :pitch)
   (4 4 '(chord-inversion 2 x) :pitch)
   (4 6 '(chord-inversion 4 x) :pitch)
   (4 7 'g3e4c5 :pitch)) mat2)
