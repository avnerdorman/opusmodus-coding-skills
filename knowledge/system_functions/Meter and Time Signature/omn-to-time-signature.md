Opusmodus                                                           omn-to-time-signature   1

omn-to-time-signature omn-form measures
[Function]

Arguments and Values:
omn                      omn-form list.
measures                 time-signature.


Description:

The OMN-TO-TIME-SIGNATURE function is used to span an omn-form list to create
sublists that match up with a list of time-signature measures. This is particularly valuable
when organising the omn output from the import of a Midi le to allow for further processing.
For example, here’s part of an improvisation captured to Midi le. First, its output before the
OMN-TO-TIME-SIGNATURE:

(setf rh-1
      '(-dd h c7 p eb6 mp p - c7 q e6 - h_e g6 e mf
        bb5 mp -h.. q bb6 p -h. q. d6 e c4 -h..
        q bb3 mf e g6 mp h_e e6 -h e g5 h a6
        -e = h bb4 e6 p q bb6 mp e6 e g3 g6 p
        q. g3 e bb3 bb6 mp q g6 pp e c7 mp eb4 p))

Now, with this output organised to produce lists that adhere to the time-signature 4/4:

(setf bw-rh1 (omn-to-time-signature rh-1 '(4 4)))
=> ((-w) (-w) (-w) (-w)
    (h c7 p eb6 mp)
    (h eb6 p -h)
    (h c7 p q e6 -q)
    (h_e g6 p e mf bb5 mp -e tie)
    (-h. q bb6 p)
    (-h. q d6 p tie)
    (e d6 p c4 -h.)
    (-e q bb3 mf e g6 mp h e6 tie)
    (e e6 mp -h e g5 q a6 tie)
    (q a6 mp -e a6 h bb4)
    (h e6 p q bb6 mp e6)
    (e g3 mp g6 p q. g3 e bb3 bb6 mp g6 pp tie)
    (e g6 pp c7 mp eb4 p))
                                                    fi
                                                         fi
Opusmodus                                                            omn-to-time-signature       2

Examples:

The following examples show further possibilities of this function. Particularly notice in the
next example how the tie is added automatically in the second bar.

(setf time-signatures '((1 4 1) (3 4 2) (4 4)))

(setf omn1 '(-q q c5 p eb4 h gb4 q gb5 p a4 f
             c5 q c6 p eb5 gb5 q gb6 p a5 c6))

(omn-to-time-signature omn1 time-signatures)
=> ((-q) (q c5 p eb4 gb4 tie) (q gb4 p gb5 a4 f)
    (q c5 f c6 p eb5 gb5) (q gb6 p a5 c6))

The example below is interesting because it’s only featuring a single bass pitch. Remember
that in omn when a part may have only a single pitch, simply stating the next rhythmic value
automatically includes a repetition of that pitch.

(setf omn2 '(s gb2 f -e. s fff -e. s f -e. s fff
             -e. s f -e. s -e. s -e. s -e. s -e.
             s fff -e. s f -e. s fff -e. s f -e.
             s -e. s -e. s -e. s -e. s fff -e. s f
             -e. s fff -e. s -e s -e s -e s -we s
             -q s -q s -q s -q s -q s -q s -))

(omn-to-time-signature omn2 time-signatures)
=> ((s gb2 f -e.)
    (s gb2 fff -e. s f -e. s fff -e.)
    (s gb2 f -e. s -e. s -e.)
    (s gb2 -e. s -e. s fff -e. s f -e.)
    (s gb2 fff -e. s f -e. s -e. s -e.)
    (s gb2 -e. s -e. s fff -e. s f -e.)
    (s gb2 fff -e. s -e s -e s -e s -e tie)
    (-w)
    (s gb2 -q s -q s -q s)
    (-q s gb2 -q s -q s -s))

As in the initial example here’s a fragment barred with a single time-signature value.

(setf omn3 '(s b4 d5 fs5 a5 e. g5 s c5
             b4 a4 g4 b4 a4 cs5 e5 g5
             e. fs5 s b4 a4 g4 fs4 a4
             g4 b4 d5 fs5 e. e5 s a4
             g4 fs4 e4 g4))

(omn-to-time-signature omn3 '(3 4))
=> ((s b4 d5 fs5 a5 e. g5 s c5 b4 a4 g4 b4)
    (s a4 cs5 e5 g5 e. fs5 s b4 a4 g4 fs4 a4)
    (s g4 b4 d5 fs5 e. e5 s a4 g4 fs4 e4 g4))
