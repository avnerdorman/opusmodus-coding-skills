Opusmodus                                                                                 omn   1

omn type notation
[Function]

Arguments and Values:
type                     :length :pitch :velocity :duration :articulation or NIL.
notation                 a omn sequence.


Description:

The function OMN is an acronym for OPUSMODUS NOTATION. This is the software
application's very own notation. It owes a little to a computer language called AMPLE
developed as a music language in the 1980s by Chris Jordan for the BBC B computer. There
are also forms of BASIC which attempt a similar concept, that is bringing pitch, rhythm and
dynamics together on a single line of code. But OMN representation of notation is unique in
that it goes further to include articulations, accents and more.


Examples:

When you write in OMN script it is possible to make discrete conversions to separate
parameters of pitch, length, duration, dynamics (and accents, articulations and speci c
timbral effects).

(setf notation '(s g4 pp == cs5 c4 -- fs5 g4 mf ==== gs5 mp == a3 f))

(omn :length notation)
=> (1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8 1/16)

(omn :pitch notation)
=> (g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5 a3)

(omn :velocity notation)
=> (pp pp pp pp pp mf mf mp mp f)

Note the use of a second equal sign == to extend the value s (1/16) to (1/8) and later on
==== to give the value 1/4. Rest length indications work in the same way. Thus, the hyphen
extended -- gives a rest length value of -1/8.
                                                                              fi
Opusmodus                                                                            omn    2

(omn nil notation)
=> (:length (1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8 1/16)
    :pitch (g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5 a3)
    :velocity (pp pp pp pp pp mf mf mp mp f)
    :duration (1/16 1/8 1/16 1/16 1/16 1/16 1/4 1/16 1/8 1/16)
    :articulation (- - - - - - - - - -))

Notice here the parameter of duration. This allows the composer to produce resonances for
example in scoring for harp, vibraphone or guitar, or different degrees of staccato for
woodwind and strings.
