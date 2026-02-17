Opusmodus                                                                  omn-to-sc   1

omn-to-sc type sequence
[Function]

Arguments and Values:
type                   :length :midi :hertz and :velocity.
sequence               omn-form or omn elements sequence.


Description:

The function OMN-TO-SC converts an omn-form sequence or a list of individual omn-
elements into CL-Collider format values for duration, MIDI, hertz, and velocity.


Examples:

OMN-form sequence:

(setf omn '((e bb4 p q. fs4 mp)
            (q. a4 pp e gs4 p)
            (q. c4b4 mf e d4 p)))

(omn-to-sc :length omn)
=> (1/8 3/8 3/8 1/8 3/8 1/8)

(omn-to-sc :midi omn)
=> ((70) (66) (69) (68) (60 71) (62))

(omn-to-sc :hertz omn)
=> ((466.1638) (369.99442) (440.0) (415.3047)
    (261.62555 493.8833) (293.66476))

(omn-to-sc :velocity omn)
=> (0.37 0.46 0.28 0.37 0.54 0.37)

Single omn-element sequence:

(setf pitches '((bb4 fs4) (a4 gs4) (c4b4 d4)))

(omn-to-sc :midi pitches)
=> ((70) (66) (69) (68) (60 71) (62))

(setf lengths '((s - = = q) (q e -)))

(omn-to-sc :length lengths)
=> (1/16 -1/16 1/16 1/16 1/4 1/4 1/8 -1/8)
Opusmodus                                                                  omn-to-sc    2

DEF-SC-SCORE example:

SC Synth:

(sc:defsynth saw-synth ((note 60) (dur 2.0) (vel 1.0))
  (let* ((env (* .7 (sc:env-gen.kr (sc:perc .0 (* 4.0 dur)) :act :free)
                 vel))
         (sig (sc:saw.ar (sc:midicps note) env)))
    (sc:out.ar 0 (list sig sig))))

Score:

(setf omn (rnd-sample 8 '((e bb4 p q. fs4 mp)
                          (q. a4 pp e gs4 p)
                          (q. c4b4 mf e d4 p)))

(setf len (omn-to-sc :length omn))
(setf midi (omn-to-sc :midi omn))
(setf vel (omn-to-sc :velocity omn))

(def-sc-score example
  (:tempo 120 :layout ((ins . len)))
  (ins :synth saw-synth
       :note midi
       :dur len
       :vel vel))

To see more CL-Collider (SuperCollider) examples and understand the usage of the DEF-
SC-SCORE macro, please follow these steps:

Navigate to the Assistant navigator.
Press the (D) icon.
Look for the ‘CL-Collider Examples’ folder.
Open the CL-Collider.opmo le.
                     fi
