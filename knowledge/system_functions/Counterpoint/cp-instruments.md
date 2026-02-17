Opusmodus                                                                              cp-instruments      1

cp-instuments instrument orchestra sections
[Function]

Arguments and Values:
instrument                  Speci es the name of an instrument, as de ned within the overall orchestral
                            setup, to be singled out for sequence extraction.

orchestra                   Enumerates all instruments participating in the counterpoint sections,
                            providing a comprehensive list from which the speci ed instrument's material
                            can be isolated.

sections                    A list comprising all sections of counterpoint, each encapsulated within its
                            respective counterpoint function call.


Description:

The CP-INSTRUMENT function's primary objective is to consolidate all sections applicable
to a designated instrument into a singular, continuous sequence. This consolidated sequence
can then be effortlessly incorporated into a DEF-SCORE or PS instance, streamlining the
composition process.


Example:

(setf orchestra
      '(pic flt obo cla bsn cbn ; woodwind
        hrn tpt tbn tba         ; brass
        tmp glk chi             ; percusion
        cel prh plh             ; keyboard
        hrp                     ; harp
        vn1 vn2 vla vlc ctb     ; strings
        ))

(setf
 sections
 (list
  ;; Section 1
  (counterpoint
   (list p1a p1b p1c p1d p1e)
   '(((1 2 3 4 5) :methods (- - t-12 t-24 t-36) :tempo 55))
   :orchestra orchestra :time-signature '(4 4)
   :instruments '(vn1 vn2 vla vlc ctb)
   :global-tonality chords1 :time '(4)
   :global-methods '((ft pp)(ft pp)(ft pp)(ft pp)(ft pp))
   :index 's1-)
                       fi
                                                               fi
                                                                          fi
Opusmodus                                                                     cp-instruments   2


  ;; Section 2
  more sections . . .))

(setf piccolo    (cp-instrument 'pic orchestra sections))
(setf flutes     (cp-instrument 'flt orchestra sections))
(setf oboes      (cp-instrument 'obo orchestra sections))
(setf clarinets (cp-instrument 'cla orchestra sections))
(setf bassoons   (cp-instrument 'bsn orchestra sections))
(setf ctrbassoon (cp-instrument 'cbn orchestra sections))
(setf horns      (cp-instrument 'hrn orchestra sections))
(setf trumpets   (cp-instrument 'tpt orchestra sections))
(setf trombones (cp-instrument 'tbn orchestra sections))
(setf tuba       (cp-instrument 'tba orchestra sections))
(setf timpani    (cp-instrument 'tmp orchestra sections))
(self glock      (cp-instrument 'glk orchestra sections))
(self chimes     (cp-instrument 'chi orchestra sections))
(setf celesta    (cp-instrument 'cel orchestra sections))
(setf pmd        (cp-instrument 'pmd orchestra sections))
(setf pmg        (cp-instrument 'pmg orchestra sections))
(setf harp       (cp-instrument 'hrp orchestra sections))
(setf vn1        (cp-instrument 'vn1 orchestra sections))
(setf vn2        (cp-instrument 'vn2 orchestra sections))
(self vla        (cp-instrument 'vla orchestra sections))
(setf vlc        (cp-instrument 'vlc orchestra sections))
(setf ctb        (cp-instrument 'ctb orchestra sections))

In the provided example, an orchestra setup is rst de ned, enumerating various instruments
across different families, such as woodwinds, brass, percussion, keyboard, harp, and strings.
Following this, a list of sections is established, each containing a counterpoint call with
unique settings for methods, tempo, instrumentation, and other parameters.

Subsequent to de ning the orchestra and sections, the CP-INSTRUMENT function is applied
to extract sequences for each instrument individually—ranging from piccolo to contrabass—
thereby creating dedicated sequences for each. These sequences are then assigned to
variables corresponding to each instrument (e.g., piccolo, utes, oboes, etc.), facilitating their
integration into larger compositional frameworks.
            fi
                                         fi
                                                fi
                                                     fl
Opusmodus                                                               cp-instruments   3

To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.


Relevant Functions
---------------------------------------------------------
COUNTERPOINT
ASSEMBLE-VOICES
CP-TEMPO
DICTUM-TEMPO
GEN-DICTUM
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
                               fi
