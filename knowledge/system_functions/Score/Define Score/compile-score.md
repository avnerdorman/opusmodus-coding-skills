Opusmodus                                                                                   compile-score   1

compile-score score &key instrument output file
                      score-name start end new-index

[Function]

Arguments and Values:
score                       is a score instance or the name of a score.

instrument                  is T for all instruments, the name of an instrument or a list
                            of instrument names.

output                      is :midi, :score, or :musicxml or a list of those. T means (:midi).
                            The default is T.

file                        if speci ed, it should be a pathname to a le into which the compiled
                            output will be written.

score-name                  is used as the generated score name for :score output. If SCORE is a list,
                            it should be a list of SCORE instances, SCORE names, or lists of the form
                            (<score-or-name :start <start> :end <end>). In this case, the given
                            sections of the given scores will be concatenated.

if-exists                   controls what to do if the file exists. Values can be: :supersede - write
                            a new le and delete the old :new-index - Append \"-nnn\" to the given
                            name, incrementing \"-nnn\" from \"-001\" until a non-existant le is
                            found. :error - signal an error. Restarts allow :supersede or
                            :new-index The default value of :if-exists is
                            in *default-compile-score-if-exists*, currently :supersede.

new-index                   If true, override :if-exists with :new-index."


Description:

The function COMPILE-SCORE should be considered as part of the DEF-SCORE and
DISPLAY-MIDI functions. When a composer has assembled all the material needed for a
composition this material has to be brought together in DEF-SCORE, together with any
additional settings needed to make the music sound out. The function DEF-SCORE is a kind
of template into which that material and information can be entered. Once the DEF-SCORE
is in place the data can be compiled with COMPILE-SCORE.
                       fi
                            fi
                                                               fi
                                                                                       fi
Opusmodus                                                               compile-score   2

Score Example:
(setf flute-1 (rnd-sample 48 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 43))
(setf flute-1i (pitch-to-integer flute-1))

(setf bassoon-map
      (binary-invert
       (gen-binary-remove
        (integer-to-pitch (find-even flute-1i)) flute-1)))

(setf bassoon-1
      (pitch-transpose -24 (binary-map bassoon-map flute-1)))

(setf bassoon-lengths (binary-map bassoon-map '(s)))
(setf velocity-all '(mf))

(def-score duo
           (:title "duo"
            :key-signature '(c maj)
            :time-signature '(2 4)
            :tempo '(60))
 (flute
  :pitch (pitch-transpose 12 flute-1)
  :length (span flute-1 '(s))
  :velocity velocity-all
  :sound 'gm :program 'flute :channel 1)

 (bassoon
  :pitch bassoon-1
  :length bassoon-lengths
  :velocity velocity-all
  :channel 2 :program 'bassoon))

(display-midi (compile-score 'duo))

Here are the arguments attached to COMPILE-SCORE.

:instrument the name of an instrument, or a list of instrument names.

(display-midi (compile-score 'duo :instrument 'flute))

(display-midi
 (compile-score
  '((duo :start 1 :end 1)
    (duo :start 1 :end 1)
    (duo :start 3 :end 3)
    (duo :start 2 :end 6))))
Opusmodus                                                                     compile-score    3

This new expression makes 8 bars of 2/4 in all. It could allow the composer to
experiment with open-form ideas. It would be quite possible to invent a function to
choose :start and :end values at random and extend a piece ad in nitum! If you've
already run the duo score le just outlining the DISPLAY-MIDI / COMPLIE-SCORE
expression will be enough to evaluate and play the example above. After all, the software
already has all the material and score information in the ‘system’.

(compile-score
 '((duo :start 1 :end 1)
   (duo :start 1 :end 1)
   (duo :start 3 :end 3)
   (duo :start 2 :end 6))
 :file "duo" :new-index t))

If :new-index is including as an argument the composer is able to collect as saved named
incremented les compilation after compilation. This can be invaluable if the score has lots
of randomised possibilities that need to be explored and compared to nd the 'best version'.

name-001
name-002
. . . and so on.

Other possibilities for :if-exists

(compile-score 'myscore :file "My Score")
(compile-score 'myscore :file "My Score" :if-exists :supersede)
(compile-score 'myscore :file "My Score" :if-exists :new-index)
(compile-score 'myscore :file "My Score" :new-index t)

Before looking only in detail COMPILE-SCORE lets examine at what happens when
composing a short duo for ute and bassoon. First, take a look at the previous score for solo
piano and notice that the pitch, length and velocity material is WRITTEN INTO THE
SCORE. This is ne for a very short piece, but it's not as ef cient nor such good
programming practice, as WRITING MATERIAL SEPARATELY. This little duo for ute
and bassoon uses this latter method, which is to be recommended. It's this kind of short
example that's perfect to base initial experiments upon. As this duo was being composed the
basic material was created and placed in the MATERIAL part of the score le, However, it
became necessary to change the octave registers of both parts, so these were added onto the
DEF-SCORE / COMPILE-SCORE in the SCORE section of the le. This way the trace of
the composition remains intact.
       fi
            fi
                   fi
                        fl
                                                    fi
                                                          fi
                                                               fi
                                                                    fi
                                                                         fi
                                                                                fl
Opusmodus                                                                 compile-score     4

Print Score to OMN:

The expression below will convert the score into omn score format. To get a more readable
version of the score add PPRINT (print pretty) at the beginning of the expression.

(pprint (compile-score 'duo :output :score))

Score to MusicXML le format:

The expression below will convert the score into xml score format and will be saved as a le
to the ~/Opusmodus/Media/MusicXML folder:

(compile-score 'duo :output :musicxml :file "duo")
              fi
                                                                                 fi
