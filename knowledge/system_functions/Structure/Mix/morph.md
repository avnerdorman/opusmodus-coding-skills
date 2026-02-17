     Opusmodus                                                                                  morph      1

     morph depth sequence &key minimum seed
     [Function]

     Arguments and Values:
     depth                    a list of values ( oating point numbers).
     sequence                 a sequence.
     minimum                  a minimum depth value ( oating point numbers). The default is 0.0.
     seed                     an integer - ensure the same result each time the code is evaluated.
                              The default is NIL.


     Description:

     This function is used to crossover values between lists next to each other. The depth values
     de ne the number of the items to cross. The rst list in a sequence remains unchanged.


     Examples:
     (setf sequence
           '((c4 = = = = = = =) (cs4 = = = = = = =) (d4 = = = = = = =)
             (ds4 = = = = = = =) (e4 = = = = = = =) (f4 = = = = = = =)
             (fs4 = = = = = = =) (g4 = = = = = = =) (gs4 = = = = = = =)
             (a4 = = = = = = =) (bb4 = = = = = = =) (b4 = = = = = = =)))

     (setf depth (list-plot
                  (rndn 12 0.2 0.8)
                  :zero-based t
                  :point-radius 2
                  :join-points t))


       0.750.75
       0.700.70
       0.650.65
       0.600.60
       0.550.55
       0.500.50
       0.450.45
       0.400.40
       0.350.35
       0.300.30
       0.250.25
       0.200.20
                  11     22      33        44             55   66   77    88      99      10
                                                                                           10        11
                                                                                                      11
fi
                                      fl
                                                fi
                                                     fl
Opusmodus                                                          morph   2

(morph depth sequence)
=> ((c4 c4 c4 c4 c4 c4 c4 c4) (cs4 cs4 cs4 cs4 c4 c4 cs4 cs4)
    (d4 d4 cs4 d4 d4 d4 d4 d4) (ds4 ds4 ds4 ds4 ds4 d4 ds4 ds4)
    (ds4 e4 e4 e4 ds4 ds4 ds4 ds4) (f4 f4 e4 f4 e4 f4 e4 f4)
    (f4 fs4 f4 f4 f4 f4 fs4 fs4) (fs4 g4 fs4 g4 fs4 fs4 fs4 fs4)
    (gs4 gs4 gs4 gs4 gs4 gs4 gs4 g4) (gs4 a4 a4 a4 a4 gs4 a4 a4)
    (bb4 bb4 bb4 a4 a4 bb4 bb4 bb4) (bb4 b4 bb4 b4 b4 b4 b4 b4))

OMN:

(setf omn '((s b4 eb5 fs5 b5 b4 e5 gs5 b5)
            (s bb4 d5 f5 bb5 bb4 eb5 g5 bb5)
            (s a4 cs5 e5 a5 a4 d5 fs5 a5)
            (s g4 b4 d5 g5 g4 c5 e5 g5)
            (s fs4 bb4 cs5 fs5 fs4 b4 eb5 fs5)
            (s e4 gs4 b4 e5 e4 a4 cs5 e5)
            (s f4 g4 b4 d5 e4 g4 bb4 c5)
            (s e4 fs4 bb4 cs5 eb4 fs4 a4 b4)))




       4




       7




                                                           OPUSMODUS
Opusmodus                                                         morph   3

(morph (rndn 8 0.2 0.8) omn)




      4




      7




                                                            OPUSMODUS

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Chord Inversion/
