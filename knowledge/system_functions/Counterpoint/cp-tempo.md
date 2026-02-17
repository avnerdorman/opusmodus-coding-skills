Opusmodus                                                                                 cp-tempo     1

cp-tempo sections
[Function]

Arguments and Values:
sections                A list comprising all sections of counterpoint, each encapsulated within its
                        respective counterpoint function call. This includes detailed tempo settings for
                        each section, ensuring comprehensive coverage of the compositional elements
                        related to timing and rhythm.


Description:

The CP-TEMPO function is a specialised utility designed to aggregate and manage tempo
changes across multiple sections within a composition, particularly when working with the
COUNTERPOINT function. This function methodically extracts tempo information from the
dictum of each section, providing a structured outcome that can be seamlessly integrated
into a DEF-SCORE or PS instance. This enables you to effortlessly manage and apply tempo
variations throughout their compositions.


Example:
(setf
 sections
 (list
  ;; Section 1
  (counterpoint
   (list p1a p1b p1c p1d p1e)
   '(((1 2 3 4 5) :methods (- - t-12 t-24 t-36) :tempo 55))
   :orchestra orchestra
   :instruments '(vn1 vn2 vla vlc ctb)
   :time-signature '(4 4)
   :global-tonality chords1
   :time '(4)
   :global-methods '((ft pp)(ft pp)(ft pp)(ft pp)(ft pp))
   :index 's1-)

  ;; Section 2
  more sections . . .))
Opusmodus                                                                     cp-tempo   2

sections
=> ((s1-1 s1-2 s1-3 s1-4 s1-5 s1-6 s1-7 s1-8 s1-9 s1-10 s1-11 s1-12
     s1-13 s1-14 s1-15 s1-16 s1-17 s1-18 s1-19 s1-20 s1-21 s1-22)
    (s2-1 s2-2 s2-3 s2-4 s2-5 s2-6 s2-7 s2-8 s2-9 s2-10 s2-11 s2-12
     s2-13 s2-14 s2-15 s2-16 s2-17 s2-18 s2-19 s2-20 s2-21 s2-22)
    (s3-1 s3-2 s3-3 s3-4 s3-5 s3-6 s3-7 s3-8 s3-9 s3-10 s3-11 s3-12
     s3-13 s3-14 s3-15 s3-16 s3-17 s3-18 s3-19 s3-20 s3-21 s3-22)
    (s4-1 s4-2 s4-3 s4-4 s4-5 s4-6 s4-7 s4-8 s4-9 s4-10 s4-11 s4-12
     s4-13 s4-14 s4-15 s4-16 s4-17 s4-18 s4-19 s4-20 s4-21 s4-22)
    (s5-1 s5-2 s5-3 s5-4 s5-5 s5-6 s5-7 s5-8 s5-9 s5-10 s5-11 s5-12
     s5-13 s5-14 s5-15 s5-16 s5-17 s5-18 s5-19 s5-20 s5-21 s5-22))

(setf tempo (cp-tempo sections)
=> ((55 :length 8) (55 :length 8) (55 :length 8)
    (65 :length 8) (95 :length 8))

The result of calling CP-TEMPO with the sections list is an organised collection of
tempo settings, re ecting the tempo speci ed for each section.

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
DICTUM-TEMPO
GEN-DICTUM
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
            fl
                               fi
                                     fi
