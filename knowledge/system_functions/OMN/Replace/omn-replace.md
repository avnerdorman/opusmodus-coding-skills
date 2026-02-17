Opusmodus                                                                         omn-replace   1

omn-replace type new sequence &key section exclude
[Function]

Arguments and Values:
type                     :length, :duration, pitch :velocity and :articulation.
new                      list or lists of one type values.
sequence                 omn list or lists.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function replaces values of a given type with a list of new values.

(setf omn '(e g6 f stacc e ab5 mp ten e c4 mf ten e cs5 ff))

(omn-replace :length 'q omn)
=> (q g6 f stacc ab5 mp ten c4 mf ten cs5 ff)

(omn-replace :duration 'q omn)
=> (e^q g6 f stacc e^q ab5 mp ten e^q c4 mf ten e^q cs5 ff)

(omn-replace :pitch 'c5 omn)
=> (e c5 f stacc mp ten mf ten ff)

(omn-replace :velocity 'p omn)
=> (e g6 p stacc ab5 ten c4 ten cs5)

(omn-replace :articulation 'tasto omn)
=> (e g6 f tasto ab5 mp tasto c4 mf tasto cs5 ff tasto)


Examples:

The NIL leaves the original values unchanged.

(omn-replace :length '(q nil = h) omn)
=> (q g6 f stacc e ab5 mp ten c4 mf ten h cs5 ff)

(omn-replace :pitch '(c5 nil = c5) omn)
=> (e c5 f stacc ab5 mp ten c4 mf ten c5 ff)

(omn-replace :velocity '(p nil = f) omn)
=> (e g6 p stacc ab5 mp ten c4 mf ten cs5 f)
Opusmodus                                                                    omn-replace   2


(omn-replace :articulation '(tasto nil ponte nil) omn)
=> (e g6 f tasto ab5 mp ten c4 mf ponte cs5 ff)
(setf omn2 '((e g6 f stacc ab5 mp ten c4 mf ten cs5 ff)
             (e c3 pp stacc s eb3 mf stacc a3 pp stacc
              e eb3 mf stacc s bb4 pp stacc e3 mf stacc
              e gs4 pp stacc s cs3 mf stacc fs4 pp stacc)))

The list new is trimmed (loop) to the length of the sequence (omn-events):

(omn-replace :length '((3q = = e) (s)) omn2)
=> ((3q g6 f stacc ab5 mp ten c4 mf ten e cs5 ff)
    (s c3 pp stacc eb3 mf stacc a3 pp stacc
       eb3 mf stacc bb4 pp stacc e3 mf stacc
       gs4 pp stacc cs3 mf stacc fs4 pp stacc))

(omn-replace :pitch '(c5 nil = c5) omn2)
=> ((e c5 f stacc ab5 mp ten c4 mf ten c5 ff)
    (e c5 pp stacc s eb3 mf stacc a3 pp stacc
     e c5 mf stacc s pp stacc e3 mf stacc
     e gs4 pp stacc s c5 mf stacc pp stacc))

(omn-replace :velocity '((p nil = f) (ff nil ff)) omn2)
=> ((e g6 p stacc ab5 mp ten c4 mf ten cs5 f)
    (e c3 ff stacc s eb3 mf stacc a3 ff stacc
     e eb3 stacc s bb4 pp stacc e3 ff stacc
     e gs4 stacc s cs3 mf stacc fs4 ff stacc))

(omn-replace :articulation '((stacc) (leg)) omn2)
=> ((e g6 f stacc ab5 mp stacc c4 mf stacc cs5 ff stacc)
    (e c3 pp leg s eb3 mf leg a3 pp leg
     e eb3 mf leg s bb4 pp leg e3 mf leg
     e gs4 pp leg s cs3 mf leg fs4 pp leg))

(omn-replace :articulation '((stacc) (leg))
 (omn-replace :velocity '((p nil = f) (ff nil ff))
  (omn-replace :pitch '(c5 nil = c5)
   (omn-replace :length '((3q = = e) (s)) omn2))))
=> ((3q c5 p stacc ab5 mp stacc c4 mf stacc e c5 f stacc)
    (s c5 ff leg eb3 mf leg a3 ff leg
       c5 leg c5 pp leg e3 ff leg
       gs4 leg c5 mf leg ff leg))
