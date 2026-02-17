Opusmodus                                                                                polyphony     1

polyphony dictum voices &key leading iterate time-signature
                index sustain seed

[Function]

Arguments and Values:
dictum                    dictum values:
                          (<interval><pitch-event><velocity><attribute>).
voices                    a list of omn voices.
leading                   an integer (leading voice number) or NIL ( rst voice). The default is NIL.
iterate                   T or NIL. The default is NIL.
time-signature            T or NIL. The default is NIL.
index                     voice index name (variables).
sustain                   T or NIL. The default is NIL.
seed                      an integer or NIL. An integer ensures the same result each time the code
                          is evaluated. The default is NIL.


Description:

The POLYPHONY function allows you to modify unwanted events (interval, velocity or
attribute) in a musical texture consisting of two or more simultaneous lines (voices). The
unwanted pitch can be removed with (p) symbol (pause), replaced with the an octave (o) of
the leading voice or replaced with an interval value in relation to the leading voice pitch.

Dictum form:

(<interval><pitch-event><velocity><attribute>) in that order.

Dictum examples:

If true:

(7 p)

7            - test interval
p            - pause

(7 o)

7            - test interval
o            - octave
                                                             fi
Opusmodus                                                                         polyphony      2

(7 t)

7            - test interval
t            - replaced with the leading voice pitch value

(7 p t)

7            - test interval
p            - pause
t            - replaced with the leading voice velocity value

(7 ? mp t)

7            - test interval
?            - at random, octave or pause
pp           - velocity set to pp
t            - replaced with the leading voice attribute value

(1 13 mp stacc)

1            - test interval
13           - interval replacement in relation to the leading voice pitch
mp           - velocity set to mp
stacc        - attribute set to stacc

(7 (6 13) t t)

7            - test interval
(6 13)       - at random, 6 or 13
t            - replaced with the leading voice velocity value
t            - replaced with the leading voice attribute value

The :leading option is a voice number from which the iteration process will start. If the
leading voice is not de ned or set to NIL then the rst voice in the voice list becomes the
leading voice.

The :iterate option allows us to control the iteration of the polyphony process. Each
repetition of the process is a single iteration, and the outcome of each iteration is then the
starting point of the next iteration.

If :iterate is set to T the process is iterated until all voices complete the process
consecutively applying the process each time to the result of the previous polyphony
process.
                   fi
                                                fi
Opusmodus                                                                        polyphony   3

1 (leading voice) on 2 3 4
2 on 3 4
3 on 4

 If :iterate is set to NIL (default) only a single iteration from the leading voice is
triggered:

1 (leading voice) on 2 3 4


Examples:

I.

(setf v1 '((e c4 d4 e4 f4 g4 a4 b4 c5)))
(setf v2 '((e g4 eb4 fs4 a4 c5 eb5 fs5 a5)))
(setf v3 '((e c4 eb4 f4 as4 c5 e5 fs5 ab5)))
(setf v4 '((e a5 fs5 eb5 c5 a4 fs4 e4 c4)))

(setf voices1 (list v1 v2 v3 v4))

(ps 'gm :inst voices1)


                                      = 60




                                                       Opusmodus
Opusmodus                                                                     polyphony      4

By default the 1st voice in the list is a leading voice from which the POLYPHONY test will
start.

(polyphony '(7 p) voices1)
=> (((e c4 d4 e4 f4 g4 a4 b4 c5))
    ((-e   eb4 fs4 a4 c5 eb5 - a5))
    ((e c4 eb4 f4 as4 c5 -    - ab5))
    ((e a5 fs5 eb5 -   a4 fs4 - c4)))

(ps 'gm :inst (polyphony '(7 p) voices1))


                                     = 60




                                                     Opusmodus
Opusmodus                                                    polyphony   5

II.

(setf
 s1 '((e c4 p ten+leg d4 pp leg e4 mp f4 p g4 pp a4 b4 f c5))
 s2 '((e g4 mp        eb4 p     fs4   a4   c5 mf eb5 fs5 a5))
 s3 '((e c4 mp        eb4 p     f4    as4 c5     e5 fs5 ab5))
 s4 '((e a5 mp        fs5 p     eb5   c5   a4    fs4 e4  c4)))

(setf voices2 (list s1 s2 s3 s4))

(ps 'gm :inst voices2)


                          = 60




                                             Opusmodus
Opusmodus                                                                  polyphony   6

If true the pitch will be replaced with the an octave of the leading voice and velocity
and articulation event will be replaced with the leading voice events respectively.

(ps 'gm :inst (polyphony '(7 o t t) voices2))


                                   = 60




                                                      Opusmodus




(ps 'gm :inst (polyphony '((7 6 t t) (1 -13 t t)) voices2))


                            = 60




                                                          Opusmodus
Opusmodus                                                        polyphony        7

The index option will assign each voice to a variable:

(polyphony '((7 6 t t) (1 -13 t t)) voices2 :index 'inst)
=> (inst1 inst2 inst3 inst4)


III.

(setf p1 '(q d4 pp s eb4 leg g4 p leg bb4 leg a4 q. cs5 mf -e
           3q gs5 leg fs5 leg c5 b4 ff leg f4 leg e4))

(setf p2 '(t d4 p leg eb4 leg g4 leg bb4 f q. a4 marc
           t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg
           d5 leg eb5 f 3q bb5 a4 bb5 e a4 pp stacc -e))

(setf p3 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc e. cs4 marc
           s gs4 leg q gs4 -q))

(setf p4 '(q. fs5 pp 3e c5 leg b4 leg f4 e d5 mf s eb5 leg g5 leg
           bb5 leg a5 e fs5 leg fs5 3e gs4 > stacc c5 stacc
           b5 stacc t f5 pp e.. e5))


(setf voices3 (list p1 p2 p3 p4))

(ps 'gm :inst voices3)


       = 60                                                       3




                                                         3




                                                         3

                                         3




                                3                            3
                                                                      Opusmodus
Opusmodus                                                                      polyphony        8

The intervals 7, 10 and 11 if found in POLYPHONY will turn to a pause for the length of its
value.

(setf test1 (polyphony '((7 p) (10 p) (11 p)) voices3 :index 'v1))

(ps 'gm :inst test1)


       = 60                                                                     3




                                                                   3


                                                                    3




                                         3




                                                                        3
                                3
                                                                                    Opusmodus
Opusmodus                                                                           polyphony     9

Instead of turning the unwanted interval to a pause, we set the pitch-event to 'o which will
replace the pitch with an octave value, taken from the leading voice.

(setf test2 (polyphony '((7 o) (10 o) (11 o)) voices3 :index ‘v2))

(ps 'gm :inst test2)


       = 60                                                                     3




                                                                   3




                                                                   3

                                         3




                                3                                      3
                                                                                      Opusmodus
Opusmodus                                                                        polyphony          10

I the next example the 3rd voice is set to a leading voice. If true, the velocity and the
articulation will be replaced with the values of the leading voice. In this example we set
the :iterate to T.

(setf test3 (polyphony '((7 0 t t) (10 o t t) (11 o t t)) voices3
                       :leading 3 :iterate t :index 'v3))

(ps 'gm :inst test3)


       = 60                                                                         3




                                                                      3




                                                                      3


                                          3




                                                                          3
                                 3
                                                                                        Opusmodus
Opusmodus                                                     polyphony         11

(setf test4 (polyphony '((7 6 t t) (2 10 t t) (1 13 t t)) voices3
                       :leading 2 :index 'v4))

(ps 'gm :inst test4)

                                                                3
      = 60



                                                      3




                                                      3

                                 3




                                                          3
                         3

                                                                    Opusmodus




Relevant Functions
---------------------------------------------------------
COUNTERPOINT

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Polyphony/
