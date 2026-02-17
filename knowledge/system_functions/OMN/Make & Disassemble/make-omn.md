Opusmodus                                                                        make-omn   1

make-omn &rest plist &key span flat swallow duration-add
               length pitch velocity duration articulation length-symbols
               initial-mf

[Function]

Arguments and Values:
plist                    :length :pitch :velocity :duration and :articulation.


Description:

The function OMN is an acronym for OPUSMODUS NOTATION. This is the software
application's very own notation. When you write in OMN script it is possible to make discrete
conversions to separate parameters of pitch, length, duration, dynamics (and accents,
articulations and speci c timbral effects). In the function MAKE-OMN this process can be
reversed, allowing the composer to assemble the separate parameters back into the OMN
script.


Examples:
(make-omn
 :length '((-1) (1/4 1/4 -1/4 -1/4 1/4 1/8 1/8 -1/2 1/4))
 :pitch '((c4 d4 e4) (c5 d5 e5 f5 g5 a5)))
=> ((-w) (q c4 mf d4 - - e4 e c4 d4 -h q e4))

(make-omn
 :length '((-1) (1/4 1/4 -1/4 -1/4 1/4 1/8 1/8 -1/2 1/4))
 :pitch '((c4 d4 e4) (c5 d5 e5 f5 g5 a5))
 :initial-mf nil)
=> ((-w) (q c4 d4 - - e4 e c4 d4 -h q e4))


(make-omn
 :length '((-1) (1/4 1/4 -1/4 -1/4 1/4 1/8 1/8 -1/2 1/4))
 :pitch '((c4 d4 e4) (c5 d5 e5 f5 g5 a5))
 :flat t)
=> ((-w) (q c4 mf d4 - - e4 e c5 d5 -h q e5))

(make-omn
 :length '((-1) (1/4 1/4 -1/4 -1/4 1/4 1/8 1/8 -1/2 1/4))
 :pitch '((c4 d4 e4) (c5 d5 e5 f5 g5 a5))
 :swallow t
 :flat t)
=> ((-w) (q d4 mf e4 - - e5 e f5 g5 -h q c4))
                fi
Opusmodus                                                                         make-omn   2

(make-omn
 :length '(1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8)
 :pitch '(g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5)
 :velocity '(pp pp pp pp pp mf mf mp mp))
=> (s g4 pp e s cs5 c4 -e s fs5 g4 mf q s gs5 mp e)

(make-omn
 :length '(-1 1/4 1/4 -1/4 -1/4 1/4 1/8 1/8 -1/2 1/4)
 :pitch '(c4 d4 e4 c5 d5 e5 f5 g5 a5)
 :velocity '(pp pp pp pp pp mf mf mp mp f)
 :swallow t)
=> (-w q d4 pp e4 - - e5 mf e f5 g5 mp -h q c4 f)

(setf notation
 (make-omn
  :length '(1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8)
  :pitch '(g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5)
  :velocity '(pp pp pp pp pp mf mf mp mp)))
=> (s g4 pp e s cs5 c4 -e s fs5 g4 mf q s gs5 mp e)

With OMN function it is possible to make discrete conversions to separate parameters of pitch,
length, duration, dynamics (and accents, articulations and speci c timbral effects).

(omn :length notation)
=> (1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/4 1/16 1/8)

(omn :pitch notation)
=> (g4 g4 cs5 c4 fs5 g4 g4 gs5 gs5)

(omn :velocity notation)
=> (pp pp pp pp pp mf mf mp mp)

To span all other parameters to pitches we do use :span :pitch keywords:

(setf pitch '(c3 eb3 a3 eb3 bb4 e3 gs4 cs3 fs4))

(make-omn
 :length '(1/8)
 :pitch pitch
 :velocity '(pp)
 :span :pitch)
=> (e c3 pp eb3 a3 eb3 bb4 e3 gs4 cs3 fs4)

(make-omn
 :length '(e s s)
 :pitch pitch
 :velocity '(pp mf)
 :span :pitch
 :length-symbols nil)
=> (1/8 c3 pp 1/16 eb3 mf a3 pp 1/8 eb3 mf
    1/16 bb4 pp e3 mf 1/8 gs4 pp 1/6 cs3 mf fs4 pp)
                                                         fi
Opusmodus                                              make-omn   3

(make-omn
 :length '(e s s)
 :pitch pitch
 :velocity '(pp mf)
 :articulation '(stacc)
 :span :pitch
 :length-symbols nil)
=> (1/8 c3 pp stacc 1/16 eb3 mf stacc a3 pp stacc
    1/8 eb3 mf stacc 1/16 bb4 pp stacc e3 mf stacc
    1/8 gs4 pp stacc 1/16 cs3 mf stacc fs4 pp stacc)
