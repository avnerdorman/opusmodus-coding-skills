Opusmodus                                                                 disassemble-omn   1

disassemble-omn omn-sequence
[Function]

Arguments and Values:
omn-sequence             OMN-form list.


Description:

The function OMN is an acronym for OPUSMODUS NOTATION. This is the software
application's very own notation. When you write in OMN script it is possible to make discrete
conversions to separate parameters of pitch, length, duration, dynamics (and accents,
articulations and speci c timbral effects). The function OMN allows the composer to extract a
particular parameter of the omn stream.

(setf notation '(s g4 pp == cs5 c4 -- fs5 g4 mf ==== gs5 mp == a3 f))

(omn :length notation)
=> (1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8 1/16)


Examples:

The function DISASSEMBLE-OMN extracts every parameter simultaneously.

(disassemble-omn notation)
=> (:length (1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8 1/16)
    :pitch (g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5 a3)
    :velocity (pp pp pp pp pp mf mf mp mp f)
    :articulation (- - - - - - - - - -))

(disassemble-omn '(q e5 mf lh-pizz snap harm+stacc
                   g4 ubow a4 dbow trem g4 pp gs5 ppp))
=> (:length (1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4)
    :pitch (e5 e5 e5 g4 a4 a4 g4 gs5)
    :velocity (mf mf mf mf mf mf pp ppp)
    :articulation (lh-pizz snap harm+stacc ubow dbow trem - -))
                fi
