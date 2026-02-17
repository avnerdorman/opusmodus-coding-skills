Opusmodus                                                                    merge-voices   1

merge-voices &rest voices &key flatten
[Function]

Arguments and Values:
voices                   lists of list (voices).
flatten                  T or NIL. The default is NIL.


Description:

The function OMN is an acronym for OPUSMODUS NOTATION. This is the software
application's very own notation. When you write in omn script it is possible to make discrete
conversions to separate parameters of pitch, length, duration, dynamics (and accents,
articulations and speci c timbral effects). The function MERGE-VOICES will merge any
number of omn script lines (voices) into one line of omn script with the time signature take
form the rst voice.


Examples:
(setf voice1 '(w c2)
      voice2 '(h c4 d4)
      voice3 '(q g5 g5 g5 g5))

In this example the three voices are merge together:

(merge-voices voice1 voice2 voice3)
=> ((z^w c2 z^h c4 q g5 = z^h d4 q g5 =))

Example with sublists:

(setf in1
      '((s d4 g4 gs4 bb4 f4 bb4 d4 c4 d4 fs4 c5 eb4)
        (s eb4 f4 g4 d4 c5 gs4 bb4 bb4 d4 fs4 c4 d4)
        (s d4 g4 gs4 bb4 f4 bb4 d4 c4 d4 fs4 c5 eb4)
        (s eb4 f4 g4 d4 c5 gs4 bb4 bb4 d4 fs4 c4 d4)))

(setf in2
      '((e fs3 cs4 a3 g3 bb3 f4)
        (3q c4 d4 e4 b3 a4 f4 g4 g4 b3)
        (s eb4 f4 g4 d4 c5 gs4 bb4 bb4 d4 fs4 c4 d4)
        (e fs3 cs4 a3 g3 bb3 f4)))
   fi
                fi
Opusmodus                                                           merge-voices    2

(setf voices (merge-voices in1 in2))
=> ((z^s d4 s^e fs3 g4 z^s gs4 s^e cs4 bb4 z^s f4
     s^e a3 bb4 z^s d4 s^e g3 c4 z^s d4 s^e bb3 fs4
     z^s c5 s^e f4 eb4)
    (z^s eb4 s^3q c4 3s^s f4 3e^3q d4 3e^s g4
     3s^3q e4 s d4 z^s c5 s^3q b3 3s^s gs4 3e^3q a4
     3e^s bb4 3s^3q f4 s bb4 z^s d4 s^3q g4 3s^s fs4
     3e^3q g4 3e^s c4 3s^3q b3 s d4)
    (s d4eb4 f4g4 g4gs4 d4bb4 f4c5 gs4bb4 d4bb4
     c4bb4 d4 fs4 c4c5 d4eb4)
    (z^s eb4 s^e fs3 f4 z^s g4 s^e cs4 d4 z^s c5
     s^e a3 gs4 z^s bb4 s^e g3 bb4 z^s d4 s^e bb3
     fs4 z^s c4 s^e f4 d4))




With the DISASSEMBLE-OMN function we can analyse how the voices are put together:

(disassemble-omn voices)

Example with :flatten t option (a list):

(merge-voices in1 in2 :flatten t)
=> (z^s d4 s^e fs3 g4 z^s gs4 s^e cs4 bb4 z^s f4 s^e a3 bb4
    z^s d4 s^e g3 c4 z^s d4 s^e bb3 fs4 z^s c5 s^e f4 eb4
    z^s s^3q c4 3s^s f4 3e^3q d4 3e^s g4 3s^3q e4 s d4
    z^s c5 s^3q b3 3s^s gs4 3e^3q a4 3e^s bb4 3s^3q f4
    s bb4 z^s d4 s^3q g4 3s^s fs4 3e^3q g4 3e^s c4
    3s^3q b3 s d4 d4eb4 f4g4 g4gs4 d4bb4 f4c5 gs4bb4
    d4bb4 c4bb4 d4 fs4 c4c5 d4eb4 z^s eb4 s^e fs3 f4
    z^s g4 s^e cs4 d4 z^s c5 s^e a3 gs4 z^s bb4 s^e g3
    bb4 z^s d4 s^e bb3 fs4 z^s c4 s^e f4 d4)
