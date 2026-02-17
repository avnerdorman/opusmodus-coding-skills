Opusmodus                                                                              drop-voicing   1

drop-voicing sequence &key leading type transpose
[Function]

Arguments and Values:

sequence                   a sequence (omn-form or pitches).
leading                    'l (chord lowest pitch) or 'h (chord highest pitch). The default is 'h.
type                       an integer (drop number). The default is 0.
transpose                  an integer (transposition value). The default is 0.


Description:

This function returns a sequence of chords resulting from a combination of voice positions
with the help of an octave transposition in which the vertical spacing (ambitus) between the
neighbouring notes must not exceed 12 semitones. The leading voice by default is set to
the highest (top) note. Before applying any :type to a given chord, chord pitches are
transposed rst to t an octave. The octave ambitus is de ned by a :leading voice: 'l
(low) and 'h (high) and is de ned as a :type 0 (default).


Examples:
(setf mat '(b2cs4eb4e4 cs3eb4f4gs4 c3d4e4f4 fs2bb3cs4e4))




                                                               Opusmodus




(drop-voicing mat)




                                                               Opusmodus
     fi
             fi
                      fi
                                                          fi
Opusmodus                                                               drop-voicing   2

The following example returns all chords of :type 1:

(drop-voicing mat :type '(1))




                                                       Opusmodus




In this example we apply a different :type to each chord:

(drop-voicing mat :type '(0 1 2 3))




                                                        Opusmodus




Here the :leading voice is set to 'l (lowest voice):

(drop-voicing mat :type '(0 1 2 3) :leading 'l)




                                                        Opusmodus


(setf chords '(w b3c4d4e4g4 p h g3b3c4d4e4 mf c4d4e4g4b4 p -
               q d4fs4g4b4 b3d4e4fs4g4 b3c4e4g4a4 mf a3c4d4e4f4 p
               c4d4e4f4a4 mp d4e4f4a4c5 w bb3d4f4a4 bb3d4eb4f4g4 p
               -q eb4f4g4bb4d5 mf c4d4f4a4bb4 mp e4f4g4a4c5 w c4e4g4b4))


                     2                  3                   4




      5                  6          7                               8




                                                                         Opusmodus
Opusmodus                                                        drop-voicing    3

(drop-voicing chords :type '(0 1 2 3 4 5 4 3 3 1 2 3 4 5 5))



                2                3             4




       5            6            7                       8




                                                                  Opusmodus




(drop-voicing
 (omn :pitch (library 'standard 'chords 'Giant-Steps))
 :type (rnd-sample 32 '(0 1 2 3 4 5) :seed 753)
 :leading 'l)


                         2           3                       4




   5                         6                       7




                                                                     Opusmodus
Opusmodus                                                       drop-voicing   4

(setf harm-prog
      '(c3g4c5ds5 c3fs4a4d5 g2g4as4d5 c3ds4as4d5
        c3ds4a4c5 a2e4a4cs5 d3f4a4d5 e3e4gs4b4 a2e4a4c5
        b2ds4fs4b4 e3e4g4b4 ds3c4fs4fs5 e3b3g4e5 e3as4cs5
        as2f4as4d5 d3f4as4f5 ds3g4as4ds5 e3g4as4d5 a2e4a4cs5
        d3fs4a4d5 g3g4b4d5 c3g4c5ds5 f3gs4c5d5 f3gs4f5
        d3g4b4f5 c3g4c5ds5 gs2gs4c5ds5 gs2f4c5d5 d3fs4a4d5
        g2f4b4d5 c3ds4g4c5 c3ds4g4c5))


                            2               3               4




      5                 6               7               8




                                                                 Opusmodus




(drop-voicing harm-prog
              :type (rnd-sample 32 '(0 1 2 3) :seed 45))



                                    2               3




      4                                 5




      6                         7               8




                                                                 Opusmodus
Opusmodus                                                 drop-voicing   5

(drop-voicing harm-prog
              :type (rnd-sample 32 '(0 1 2 3) :seed 45)
              :leading 'l)



                            2                     3




      4                              5




      6                    7                  8




                                                           Opusmodus
