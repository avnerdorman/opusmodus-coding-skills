Opusmodus                                                                                def-sc-score   1

def-sc-score name &key tempo layout output sr &body body
[Function]

Arguments and Values:
name                         Name of the score being de ned.
tempo                        An integer - the tempo of the score.
layout                       Layout detailing the rhythmic structure of an instrument (synth).
output                       Speci es the name of the saved audio le (provided as a string).
                             By default, the le is saved in the Waveform Audio (WAVE) format.
sr                           De nes the sample rate of the saved audio le.
                             The default setting is 48000 with a bit depth of 24 bits per sample.
body                         The main body of the macro, detailing the labels, rhythmic structure,
                             and synthesis commands.


Description:

The DEF-SC-SCORE marco de nes a CL-Collider (SuperCollider) score with a given
name, tempo, and layout. The body of the macro consists of individual labels, which
handle both the rhythmic and synthesis aspects of the CL-Collider format.


Examples:

Synth:

(sc:defsynth saw-synth ((note 60) (dur 2.0) (vel 1.0))
  (let* ((env (* .7 (sc:env-gen.kr (sc:perc .0 (* 4.0 dur)) :act :free)
                 vel))
         (sig (sc:saw.ar (sc:midicps note) env)))
    (sc:out.ar 0 (list sig sig))))

Score 1:

(setf length (gen-repeat 8 '(1/16 -1/16 1/16 1/16)))

(def-sc-score example1
  (:tempo 120
   :layout ((ins . length)))

     (ins :synth saw-synth
          :note '(60 60 (67 71 74) (64 74 79 84))
          :dur length
          :vel '(0.6 0.6 0.6 0.6)))
                   fi
                        fi
                             fi
                                     fi
                                                 fi
                                                           fi
                                                                fi
Opusmodus                                                               def-sc-score    2

Score 2:

(setf omn (rnd-sample 8 '((e bb4 p q. fs4 mp)
                          (q. a4 pp e gs4 p)
                          (q. c4b4 mf e d4 p)))

(setf len (omn-to-sc :length omn))
(setf midi (omn-to-sc :midi omn))
(setf vel (omn-to-sc :velocity omn))

(def-sc-score example2
  (:tempo 120
   :layout ((ins . len)))

     (ins :synth saw-synth
          :note midi
          :dur len
          :vel vel)
 )

The :output "name" option enables you to save the score le in the Opusmodus/Media/
Audio directory.

(def-sc-score example2
  (:tempo 120
   :layout ((ins . len))
   :output "exp2")

     (ins :synth saw-synth
          :note midi
          :dur len
          :vel vel)
 )

To see more CL-Collider (SuperCollider) examples and understand the usage of the DEF-
SC-SCORE macro, please follow these steps:

Navigate to the Assistant navigator.
Press the (D) icon.
Look for the ‘CL-Collider Examples’ folder.
Open the CL-Collider.opmo le.
                     fi
                                                    fi
