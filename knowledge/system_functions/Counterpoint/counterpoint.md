Opusmodus                                                                             counterpoint       1

counterpoint sequence dictum &key set orchestra instruments
                   time-signature global-methods global-harmony
                   global-tonality time global-polyphony iterate leading
                   sustain num seed index

[Function]

Arguments and Values:
sequence                 A collection of lists, each containing an omn-form sequence. These sequences
                         represent the foundational musical material upon which the counterpoint
                         function operates.

dictum                   A list of dictum lists, where each dictum speci es manipulations or processes
                         to be applied to the sequences, such as voice leading, rhythmic alterations,
                         and harmonic progressions.

set                      Speci es the unfold-set methods to be used for transforming the sequences.
                         The default set is 'om, which refers to a prede ned collection of methods.

orchestra                (Optional): Lists all instruments involved in the composition. This
                         comprehensive list ensures that the counterpoint function can consider the full
                         ensemble when applying transformations and generating output.

instruments              (Optional): Identi es a subset of instruments from the orchestra to which the
                         counterpoint operations are speci cally applied. This allows for targeted
                         manipulation of particular voices or sections within the ensemble.

time-signature           (Optional): Assigns a time signature to the output, de ning the rhythmic
                         structure and meter of the composition.

global-methods           (Optional): Applies a list of methods globally to all voices. This is useful for
                         imposing uniform transformations across the entire piece. The default value is
                         NIL, indicating no global methods are applied unless speci ed.

global-harmony           (Optional): Introduces a harmonic-path across all voices, creating a cohesive
                         harmonic framework for the composition.

global-tonality          (Optional): Applies a tonality-map to all voices, ensuring that the piece
                         adheres to a speci c tonal or modal structure.

time                     (Optional): Speci es the duration for each of the global methods (harmony,
                         tonality) to take effect, allowing for precise timing of harmonic and tonal
                         changes.

global-polyphony         (Optional): Executes a polyphony process on all voices at the end of the
                         processing chain, addressing issues like voice leading and intervallic
                         coherence.
                    fi
                                   fi
                                        fi
                                         fi
                                                   fi
                                                                fi
                                                                     fi
                                                                          fi
                                                                               fi
Opusmodus                                                                                           counterpoint         2

leading                             (Optional): Determines the leading voice (by number) or uses NIL for the rst
                                    voice by default. This can guide the polyphonic arrangement, establishing
                                    a hierarchical structure within the texture.

iterate                             (Optional): When set, applies the polyphony test across all voices, iterating
                                    the process for comprehensive textural integration. The default is NIL.

num                                 (Optional): Either an integer or a list of integers specifying the bars to return.
                                    This can be used to extract speci c segments of the composition.
                                    The default is NIL.

seed                                (Optional): An integer used to seed random processes within the counterpoint
                                    function, ensuring reproducibility of results. The default is NIL.

index                               (Optional): Used to assign names to instruments or voices, facilitating easier
                                    identi cation and manipulation of speci c parts within the composition.

Dictum Arguments:

voices                              De nes the arrangement and application of patterns through a combination of
                                    numbers and symbols. Numbers correspond to pattern identi ers, while
                                    symbols have speci c meanings:
                                    Minus (-) indicates a pause, silencing the voice.
                                    Asterisk (*) signi es a pedal point, maintaining a constant pitch over
                                    a designated span.

sequence                            Speci es the sequence or sequences to be used. By default, it is NIL,
                                    indicating that the input consists of a single sequence of patterns.

span                                Determines the length or span over which the dictum is applied. If NIL,
                                    the span is not explicitly de ned, allowing for natural progression based on
                                    the input material.

extend                              Controls the placement of length-rests, either at the start (s) or the end (e) of
                                    a pattern to adjust its duration. The default setting is (e), focusing on
                                    extending the pattern's conclusion.

methods                             Lists the unfold-method names to be used for transforming the musical
                                    material. Symbols include (-) for no modi cation, (=) for repeating the last
                                    method, and NIL as the default, indicating no methods are applied unless
                                    speci ed.

harmony                             Introduces harmonic elements into the composition, which can be a list of
                                    tonalities, chords, or pitches. Symbols (-) and (=) represent no harmony and
                                    the repetition of the last harmony, respectively, with NIL as the default.

tonality                            Applies a tonality-map form list to the composition, aiding in establishing or
                                    modifying the tonal framework. Similar to harmony, (-) indicates no change,
                                    and (=) repeats the last tonality, with the default being NIL.
                    fi
                         fi
                              fi
                               fi
                                              fi
                                                   fi
                                                         fi
                                                              fi
                                                                      fi
                                                                           fi
                                                                                            fi
                                                                                                           fi
Opusmodus                                                                                      counterpoint         3

polyphony                        Speci es polyphonic adjustments to be made, formatted as
                                 (<interval><pitch-event><velocity><attribute>), aiming to enhance the
                                 textural clarity and coherence of the piece. The default is NIL.

leading                          Identi es the leading voice by number or uses NIL for the rst voice by
                                 default, providing a reference point for the application of polyphonic
                                 processes.

iterate                          When set to T, it enables the iterative application of the polyphony test across
                                 all voices, ensuring a thorough integration of textural modi cations.
                                 The default is NIL.

tempo                            Sets the tempo for the section or maintains the default NIL value, which
                                 corresponds to the audition tempo.


Description:

The COUNTERPOINT function stands as a central pillar within the domain of parametric
composition, particularly within the Opusmodus framework. It orchestrates the assignment of
sequences (patterns) to a speci ed ensemble of voices, employing de ned array of methods
to manipulate each voice individually. This functionality enables the creation of complex,
layered textures that are emblematic of counterpoint, a cornerstone of Western music
composition.

At its core, the COUNTERPOINT function operates on a principle of sequence allocation,
where each voice within the ensemble is imbued with a distinct sequence. These
sequences represent the foundational material from which the counterpoint is constructed.
The dictum list, an essential component of this function, catalogues the voices in a
straightforward numerical order. This ordered listing facilitates an organised approach to
voice manipulation, ensuring clarity and precision in the compositional process.


Patterns
Patterns serve as a repository (denoted as omn sequence) from which voices are derived. For
instance:

(setf p1 '((e c4 d4 e4 f4 g4 a4 b4 c5)))
(setf p2 '((e g4 eb4 fs4 a4 c5 eb5 fs5 a5)))


Dictum
In the dictum below the 1st voice is assigned to the 1st pattern, the 2nd voice to the
2nd pattern, the 3rd voice to the 1st pattern and the 4th voice to the 2nd pattern:

'((1 2 1 2) :methods (r - - ri))
                       fi
                       fi
                            fi
                                                                             fi
                                                                                      fi
                                                                                      fi
Opusmodus                                                                      counterpoint     4

Voice number:      1 2 3 4
Pattern number:    1 2 1 2

(counterpoint (list p1 p2)
 '((1 2 1 2) :methods (r - - ri)))


Methods
Voices employ distinct methods, as de ned in the DEF-UNFOLD-SET library, using method
symbols from the UNFOLD function. For illustration, the default set 'om is included in the
“Library/Default-Unfold-Sets/Unfold Set OM.lisp” library:

Unfold Set OM.lisp (extract):

(in-package :Opusmodus)

(def-unfold-set om
   :methods
   (:group transposition
     t1 (:pitch (pitch-transpose 1 x))
     t2 (:pitch (pitch-transpose 2 x))
     t3 (:pitch (pitch-transpose 3 x))
     t4 (:pitch (pitch-transpose 4 x))
     t5 (:pitch (pitch-transpose 5 x))
     t6 (:pitch (pitch-transpose 6 x))
     t7 (:pitch (pitch-transpose 7 x))
     t8 (:pitch (pitch-transpose 8 x))
     more methods . . .
   )
 )

Understanding the creation and functionality of unfold sets is crucial for custom library and
method de nition.

'((1 2 1 2) :methods (r - - ri))

In examining the :methods within our example dictum, we nd that the patterns assigned
to the second and third voices remain unchanged (indicated by -), whereas the rst and
fourth voices employ retrograde and retrograde-inversion techniques, respectively. A voice
marked with = signi es the repetition of the preceding method in the sequence.

'((1 2 1 2) :methods (r = - ri))

equals:

'((1 2 1 2) :methods (r r - ri))
    fi
              fi
                                fi
                                                        fi
                                                                          fi
     Opusmodus                                                                       counterpoint    5

     Harmony
     The :harmony option integrates a harmonic-path (via tonalities, chords, or pitches) into one
     or all voices, affecting the voices according to the speci ed path.

     Assigning a harmonic-path to all voices:

     '((1 2 1 2) :methods (r = - ri) :harmony c4bb4b4f4e4fs4)

     Assigning a unique harmonic-path to each of the voices:

     '((1 2 1 2) :methods (r = - ri)
                 :harmony (c4bb4b4 f4e4fs4 cs4eb4d4 gs3a3g3))


     Tonality
     The :tonality option applies a tonality-map to one or all voices, guiding their harmonic
     direction.

     Example of de ning tonality for all voices:

     '((1 2 1 2) :methods (r = - ri) :tonality ((major :map step)))

     In this example we assign an variable to a list of tonalities:

     (setf tonalities '((major :root 'a3 :map step)
                        (minor :root 'e4 :map step)
                        (major :root 'd4 :map step)
                        (minor :root 'fs4 :map step)))

     (counterpoint (list p1 p2)
      '((1 2 1 2) :methods (r - - ri) :tonality tonalities))


     Span and Extend
     The :span option adjusts the duration of patterns, either shortening or lengthening them to
     match a speci ed length. The :extend option adds length-rests at the start (s) or end (e) of
     a pattern, aligning shorter patterns with the longest one within a voice list. The default is 'e.


     Polyphony
     The :polyphony option manages intervals within polyphony, offering controls over voice
     intervals, dynamics, and articulations. It enables adjustments like pauses, octave shifts, or
     speci c interval replacements to mitigate unwanted intervals.
fi
            fi
                 fi
                                                        fi
Opusmodus                                                                counterpoint   6

:polyphony dictum:

(<interval><pitch-event><velocity><attribute>) in that order.

Examples:

(7 p)
7           - test interval
p           - pause

(7 o)
7           - test interval
o           - octave

(7 t)
7           - test interval
t           - replaced with the leading voice pitch value

(7 p t)
7       - test interval
p       - pause
t       - replaced with the leading voice velocity value

(7 ? mp t)
7        - test interval
?        - at random, octave or pause
pp       - velocity set to pp
t        - replaced with the leading voice attribute value

(1 13 mp stacc)
1        - test interval
13       - interval replacement in relation to the leading voice pitch
mp       - velocity set to mp
stacc    - attribute set to stacc

(7 (6 13) t t)
7        - test interval
(6 13)   - at random, 6 or 13
t        - replaced with the leading voice velocity value
t        - replaced with the leading voice attribute value
Opusmodus                                                                 counterpoint   7

Leading and Iterate
The :leading option designates the starting voice for iteration, while :iterate controls
the iteration process of the polyphony, determining whether the process repeats across all
voices or concludes after a single iteration.


Tempo
The :tempo option sets the tempo for each dictum list, allowing integration with DEF-
SCORE or PS functions through DICTUM-TEMPO or COUNTERPOINT with a tempo-
extension.

Example with index name 'vox:

(counterpoint
 (list p1 p2 p3 p4)
 '(((- 1 2 3) :methods (- i r -) :tempo 72)
   ((- 4 3 *) :methods (- ri - -) :tempo 56)
   ((4 * * *) :methods (r - - -) :tempo 72)
   ((1 * 2 3) :methods (- - i -) :tempo 56)
   ((* * * *) :methods (- - - -) :tempo 72))
 :global-methods '((fl) (t12 cl) (hn) (t-12 vc))
 :global-polyphony '(7 p)
 :iterate t
 :index 'vox)

(ps 'gm
    :fl (list vox1)
    :cl (list vox2)
    :hn (list vox3)
    :vc (list vox4)
    :tempo tempo-vox)

Example with DICTUM-TEMPO function:

(setf voices (counterpoint
              (list p1 p2 p3 p4)
              dictum
              :global-methods '((fl) (t12 cl) (hn) (t-12 vc))
              :global-polyphony '(7 p)
              :iterate t))
(assemble-voices 'vox voices)

(ps 'gm
    :fl (list vox1)
    :cl (list vox2)
    :hn (list vox3)
    :vc (list vox4)
    :tempo (dictum-tempo vox1 dictum))
     Opusmodus                                                                      counterpoint      8

     Sequence
     In addition of employing a singular list of patterns, a list of sequences (voices) is utilised
     alongside the :sequence keyword, accompanied by a numerical list. Each number within
     this list corresponds to a sequence number from which a voice derives a pattern (bar).
     The structure ((1 1 1 1) :sequence (1 2 3 4)), for instance, indicates that the
       rst voice is composed from the rst bar of the rst sequence. Similarly, the second voice
     originates from the rst bar of the second sequence, and so on.

     (setf dictum
           '(((1 1 1 1) :sequence (1 2 3 4) :methods ? :tempo 64)
             ((2 2 2 2) :sequence (1 2 3 4) :methods ? :tempo 56)
             ((3 3 3 3) :sequence (1 2 3 4) :methods ? :tempo 34)
             ((* 4 * 4) :sequence (1 2 3 4) :methods ? :tempo 44)
             ((5 5 * 5) :sequence (1 2 3 4) :methods ? :tempo 34)
             ((6 6 6 6) :sequence (1 2 3 4) :methods ? :tempo 64)
             ((* 7 * 7) :sequence (1 2 3 4) :methods ? :tempo 56)
             ((8 8 8 8) :sequence (1 2 3 4) :methods ? :tempo 44)
             ((* 9 * 9) :sequence (1 2 3 4) :methods ? :tempo 56)
             ((10 10 10 10) :sequence (1 2 3 4) :methods ? :tempo 64)
             ((11 11 11 11) :sequence (1 2 3 4) :methods ? :tempo 56)
             ))

     In this example, voices are arranged through sequences, with designated methods and
     tempo for each. The :sequence option precisely dictates the source of each voice's
     pattern, thereby enriching the composition with a broader selection of material.

     For an illustrative example of a :sequence option implemented in a score, refer to the
     “Documentation/How-to/Counterpoint/“ directory. Within, open the “Counterpoint 5.opmo”
      le accessible from the Assistant panel. This example will demonstrate the practical
     application of sequences in a compositional context.


     Globals
     The options :global-methods, :global-harmony, :global-tonality,
     and :global-polyphony are utilised to apply a global process across individual voice
     sequences, if needed, after the main compositional procedures have been executed.

     (counterpoint
      (list p1 p2 p3 p4)
      dictum
      :global-methods '((fl) (t12 cl) (hn) (t-12 vc))
      :global-polyphony '(7 p)
      :iterate t
      :set 'om)
fi
fi
                  fi
                                fi
                                               fi
Opusmodus                                                                     counterpoint      9



Orchestra and Instruments
The :orchestra and :instruments options are employed within the
COUNTERPOINT function for orchestrating ensemble or orchestral compositions. These
options ensure precise alignment and synchronisation of all instruments, particularly vital
when focusing on speci c sections and a selected list of instruments. The key objective is to
maintain coherence across the ensemble, ensuring that instruments not actively participating
in a given section are appropriately paused, yet still accounted for in the overall section
result. The :instruments option explicitly designates the instruments engaged in the
COUNTERPOINT operation.

The orchestra variable is de ned to encompass a comprehensive range of instruments
across different families, including woodwind, brass, percussion, keyboard and harp, and
strings.

(setf orchestra
      '(pic flt obo cla bsn cbn ; woodwind
         hrn tpt tbn tba        ; brass
         tmp glk chi            ; percussion
         cel plh prh hrp        ; keyboard, harp
         vn1 vn2 vla vlc ctb    ; strings
         )
       )

In the COUNTERPOINT function below, sequences (seq1, seq2, seq3) are processed
through speci ed dictum con gurations, with attention to sequence patterns, tempo, and
the orchestrated ensemble layout.

(counterpoint
 (list seq1 seq2 seq3)
 '(((- 1 2 1 2 1) :sequence (1 1 1 1 1 1) :tempo 88)
   ((4 3 1 2 1 1) :sequence (3 1 1 1 1 1)))
   :orchestra orchestra
   :instruments '(vn1 vn2 vla vlc ctb)
   :time-signature '(4 4)
   :global-tonality '((d4f4a4 :map octave))
   :index 's1-)

By specifying :orchestra and :instruments, this approach ensures that only the
selected string instruments (vn1, vn2, vla, vlc, ctb) are actively engaged in the
COUNTERPOINT, while other orchestral sections are paused but included in the overall
texture (output).
       fi
                 fi
                         fi
                              fi
               Opusmodus                                                                          counterpoint   10



               Time
               The :time option is used to impose a tonality-map or harmonic-path over a speci ed
               duration, effectively overriding the default span of a bar. This allows composers to apply
               tonal or harmonic transformations precisely at chosen moments, rather than across entire
               sections or patterns. It's particularly useful for creating dynamic shifts within a piece,
               marking transitions, or emphasising particular moments with speci c harmonic colours. By
               specifying a duration, composers can ensure that these tonal or harmonic elements are
               introduced exactly where intended, regardless of the underlying bar structure.


               Time-Signature
               The :time-signature option assigns speci c time signature values to the music
               generated by the COUNTERPOINT function. Time signatures are fundamental to structuring
               music, indicating the number of beats in each measure and the note value that receives one
               beat. By specifying a time signature, the composer de nes the rhythmic framework for the
               piece, which directly in uences its ow, accents, and overall feel. This option is essential for
               ensuring that the rhythmic structure of the output aligns with the composer’s intentions,
               providing coherence and clarity to the musical form.


               Score Example:

               This score de nes a structured arrangement using four distinct patterns, labelled p1 through
               p4. The COUNTERPOINT function then applies these patterns across ve different dictum
               con gurations, incorporating global options for an advanced composition process.

               (setf
                p1 '(q c4 ds5 d4 eb3)
                p2 '(e c4 cs4 d4 ds4 e4 f4 fs4 g4)
                p3 '(q g4 c5 e ds4 d3 ds4 c4)
                p4 '(5q d2 cs3 - g4 - 3q c3 - fs3 q f4 e3)
                )

               Each dictum con guration speci es how the patterns are to be manipulated and combined:

               The rst dictum applies inversion (i) and retrograde (r) methods to the second and third
               voices, with a span of 4/4 and a tempo of 72. The second involves retrograde-inversion
               (ri) on the second voice, spans 4/4, and sets a tempo of 56. The third applies retrograde
               (r) to the rst voice only, maintaining a 4/4 span and a tempo of 72. The fourth dictum uses
               inversion (i) on the third voice, with the same span and tempo as the second dictum. The
                 fth and nal dictum maintains the patterns as they are, without any method modi cations, at
               a tempo of 72.
fi
     fi
          fi
                 fi
                      fi
                           fi
                                fi
                                     fl
                                          fi
                                               fl
                                                         fi
                                                               fi
                                                                            fi
                                                                                 fi
                                                                                            fi
                                                                                                 fi
Opusmodus                                                                   counterpoint   11



:global-methods: Speci es global transformations applied to the music, affecting ute
(fl), clarinet (cl), horn (hn), and cello (vc) voices with transpositions and utters.
:global-polyphony: Addresses polyphonic interactions with a speci c interval (7th)
avoidance, marking a pause (p) where necessary. :iterate: Enables iterative processing
of the polyphony across all voices.
:index 'vox: Designates a custom index for referencing the resultant voices.

(counterpoint
 (list p1 p2 p3 p4)
 '(
    ((- 1 2 3) :span 4/4 :methods (- i r -) :tempo 72)
    ((- 4 3 *) :span 4/4 :methods (- ri - -) :tempo 56)
    ((4 * * *) :span 4/4 :methods (r - - -) :tempo 72)
    ((1 * 2 3) :span 4/4 :methods (- - i -) :tempo 56)
    ((* * * *) :span 4/4 :methods (- - - -) :tempo 72)
    )
 :global-methods '((fl) (t12 cl) (hn) (t-12 vc))
 :global-polyphony '(7 p)
 :iterate t
 :set 'om
 :index 'vox)

The PS function generates a preview of the score for general MIDI, with each voice (vox1
to vox4) assigned to a speci c instrument ( ute, clarinet, horn, cello) and played back at
their respective tempos (tempo-vox).

(ps 'gm
    :fl (list vox1)
    :cl (list vox2)
    :hn (list vox3)
    :vc (list vox4)
    :tempo tempo-vox
    )

To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.
                      fi
                           fi
                                fi
                                     fl
                                                                  fi
                                                                       fl
                                                                                fl
Opusmodus                                                   counterpoint   12

Relevant Functions
---------------------------------------------------------
ASSEMBLE-VOICES
CP-INSTRUMENTS
CP-TEMPO
DICTUM-TEMPO
GEN-DICTUM
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
