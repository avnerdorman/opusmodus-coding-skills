Opusmodus                                                                                            gen-dictum         1

gen-dictum voices &key sequence span extend methods harmony tonality
              polyphony leading iterate tempo print omit

[Function]

Arguments and Values:
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


polyphony                           Speci es polyphonic adjustments to be made, formatted as
                                    (<interval><pitch-event><velocity><attribute>), aiming to enhance the
                                    textural clarity and coherence of the piece. The default is NIL.

leading                             Identi es the leading voice by number or uses NIL for the rst voice by
                                    default, providing a reference point for the application of polyphonic
                                    processes.

iterate                             When set to T, it enables the iterative application of the polyphony test across
                                    all voices, ensuring a thorough integration of textural modi cations.
                                    The default is NIL.
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
Opusmodus                                                                              gen-dictum   2

tempo                    Sets the tempo for the section or maintains the default NIL value, which
                         corresponds to the audition tempo.

print                    T or NIL. The default is NIL.
omit                     T or NIL. The default is T.


Description:

This function allows you too generate a list of voices with a number of optional dictum
methods. This function is a companion to the COUNTERPOINT function.

The simplest use of the function:

(gen-dictum '((6 - 1 2) (3 2 1 6) (- 1 2 3) (2 1 6 2)))
=> (((6 - 1 2)) ((3 2 1 6)) ((- 1 2 3)) ((2 1 6 2)))

To display all dictum types we set the :omit to NIL:

(gen-dictum '((6 - 1 2) (3 2 1 6) (- 1 2 3) (2 1 6 2)) :omit nil)
=> (((6 - 1 2) :sequence nil :span nil :extend (- - - -)
               :methods (- - - -) :harmony nil :tonality nil
               :polyphony nil :leading nil :iterate nil :tempo nil)

     ((3 2 1 6) :sequence nil :span nil :extend (- - - -)
                :methods (- - - -) :harmony nil :tonality nil
                :polyphony nil :leading nil :iterate nil :tempo nil)

     ((- 1 2 3) :sequence nil :span nil :extend (- - - -)
                :methods (- - - -) :harmony nil :tonality nil
               :polyphony nil :leading nil :iterate nil :tempo nil)

     ((2 1 6 2) :sequence nil :span nil :extend (- - - -)
                :methods (- - - -) :harmony nil :tonality nil
                :polyphony nil :leading nil :iterate nil :tempo nil))


Examples:

In the examples below we use the GEN-PROB and RND-ORDER functions to generate the
voice lists and the optional dictum values:

(setf voice-weight '((1 .4) (2 .2) (3 .4) (4 .3) (5 .2) (6 .3) (- .5)))

(setf voices (gen-loop 12 (gen-prob 4 voice-weight)))
=> ((- 3 4 -) (6 5 4 3) (3 4 - 1) (5 4 3 4)
    (4 - 1 3) (4 3 4 1) (- 1 3 3) (3 4 1 6)
    (1 3 3 4) (4 1 6 2) (3 3 4 3) (1 6 2 4))
Opusmodus                                                                      gen-dictum     3

(setf span-weight '((3/4 .3) (6/4 .2) (5/4 .5)))

(setf span (flatten (gen-loop 12 (gen-prob 1 span-weight))))
=> (5/4 5/4 5/4 3/2 3/2 5/4 5/4 3/4 5/4 5/4 3/4 5/4)

(setf extend (gen-loop 12 (rnd-order '(s - s -) :encode nil)))
=> ((- - s s) (- - s s) (- - s s) (- - s s)
    (- s s -) (- s - s) (s s - -) (- s s -)
    (s - s -) (- s s -) (- s s -) (- s s -))

(gen-dictum voices :span span :extend extend :print t)

(setf
 dictum
 '(
    #|1|# ((- 3 4 -) :span 5/4 :extend (- - s s))
    #|2|# ((6 5 4 3) :span 5/4 :extend (- - s s))
    #|3|# ((3 4 - 1) :span 5/4 :extend (- - s s))
    #|4|# ((5 4 3 4) :span 3/2 :extend (- - s s))
    #|5|# ((4 - 1 3) :span 3/2 :extend (- s s -))
    #|6|# ((4 3 4 1) :span 5/4 :extend (- s - s))
    #|7|# ((- 1 3 3) :span 5/4 :extend (s s - -))
    #|8|# ((3 4 1 6) :span 3/4 :extend (- s s -))
    #|9|# ((1 3 3 4) :span 5/4 :extend (s - s -))
    #|10|# ((4 1 6 2) :span 5/4 :extend (- s s -))
    #|11|# ((3 3 4 3) :span 3/4 :extend (- s s -))
    #|12|# ((1 6 2 4) :span 5/4 :extend (- s s -))
    )
 )

To use the output of the function from above as a counterpoint template, we copy the result
from the Listener panel and paste it into the COUNTERPOINT function:

(counterpoint
 patterns
 '(
    #|1|# ((- 3 4 -) :span 5/4 :extend (- - s s))
    #|2|# ((6 5 4 3) :span 5/4 :extend (- - s s))
    #|3|# ((3 4 - 1) :span 5/4 :extend (- - s s))
    #|4|# ((5 4 3 4) :span 3/2 :extend (- - s s))
    #|5|# ((4 - 1 3) :span 3/2 :extend (- s s -))
    #|6|# ((4 3 4 1) :span 5/4 :extend (- s - s))
    #|7|# ((- 1 3 3) :span 5/4 :extend (s s - -))
    #|8|# ((3 4 1 6) :span 3/4 :extend (- s s -))
    #|9|# ((1 3 3 4) :span 5/4 :extend (s - s -))
    #|10|# ((4 1 6 2) :span 5/4 :extend (- s s -))
    #|11|# ((3 3 4 3) :span 3/4 :extend (- s s -))
    #|12|# ((1 6 2 4) :span 5/4 :extend (- s s -))
    )
 )
Opusmodus                                                                   gen-dictum   4

To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.



Relevant Functions
---------------------------------------------------------
COUNTERPOINT
ASSEMBLE-VOICES
CP-INSTRUMANTS
CP-TEMPO
DICTUM-TEMPO
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
                               fi
