Opusmodus                                                           dictum-tempo   1

dictum-tempo voice &rest dictums
[Function]

Arguments and Values:
voice                  a voice.
dictum                 dictum or dictums.


Description:

This function returns tempo values from a given COUNTERPOINT dictum lists.

(dictum-tempo vox1 dictum)
=> ((72 :length 1) (56 1) (72 1) (56 1) (72 1))

Examples:

Example with one dictum:

(setf p1 '((e c4 d4 e4 f4 g4 a4 b4 c5)))
(setf p2 '((e g4 eb4 fs4 a4 c5 eb5 fs5 a5)))
(setf p3 '((e c4 eb4 f4 as4 c5 e5 fs5 ab5)))
(setf p4 '((e a5 fs5 eb5 c5 a4 fs4 e4 c4)))

(setf dictum '(((- 1 2 3) :methods (- i r -) :tempo 72)
               ((- 4 3 *) :methods (- ri - -) :tempo 56)
               ((4 * * *) :methods (r - - -) :tempo 72)
               ((1 * 2 3) :methods (- - i -) :tempo 56)
               ((* * * *) :methods (- - - -) :tempo 72)))

(setf voices (counterpoint
              (list p1 p2 p3 p4) dictum
              :global-methods '((fl) (t12 cl) (hn) (t-12 vc))
              :global-polyphony '(7 p)
              :iterate t))

(assemble-voices 'vox voices)

(ps 'gm
    :fl (list vox1)
    :cl (list vox2)
    :hn (list vox3)
    :vc (list vox4)
    :tempo (dictum-tempo vox1 dictum)
    )
Opusmodus                                                                 dictum-tempo    2


                                = 72                       = 56
                                                       2

                 Flute




      Clarinet in Bb




             Horn in F




        Violoncello




                         = 72                   = 56                             = 72
             3                              4                             5

       Fl.




       Cl.




      Hn.




      Vlc.


                                                                              Opusmodus

To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.

Relevant Functions
---------------------------------------------------------
COUNTERPOINT
ASSEMBLE-VOICES
CP-INSTRUMENTS
CP-TEMPO
GEN-DICTUM
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
                                       fi
