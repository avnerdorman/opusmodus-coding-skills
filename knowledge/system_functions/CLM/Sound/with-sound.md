Opusmodus                                                                              with-sound   1

with-sound &key output continue-old-file channels srate reverb
                    reverb-data reverb-channels revfile decay-time
                    play force-recomputation notehook statistics
                    scaled-to scaled-by &allow-other-keys &body body

[Macro]

Arguments and Values:
output              name of output sound le ("test.aiff" normally).
continue-old-file   open and continue old output le.
channels            number. Can be any number. The default is 2.
srate               sampling-rate. The default is 44100.
reverb              name of the reverberator, if any ie. nrev.
reverb-data         arguments passed to the reverberator, an unquoted list.
reverb-channels     number. Temporary reverb stream (input to reverb).
                    The default is 2.
revfile             reverb le name.
decay-time          ring time of reverb after end of sound. The default is 1.0.
play                play new sound automatically. The default is T.
force-recomputation NIL or T. If T, force with-mix calls to recompute.
                    The default is NIL.
notehook            function evaluated on each instrument call.
statistics          NIL or T. T print out various numbers. The default is T.
scaled-to           number. if a number, scale results to have that max amp.
scaled-by           number. scale output by some number.
body                instrument or function.


Description:

WITH-SOUND is a macro that performs all the various services needed to produce and play a
sound le; it also wraps an "unwind-protect" around its body to make sure that everything is
cleaned up properly if you happen to interrupt computation, then returns the output le name
"test.aiff" (default) into your "Media/Audio" folder.

(with-sound ()
  (fm-violin-synth '(q q q) '(c4 e4 g4) '(ppp p pp)))

The empty parens following WITH-SOUND are where certain global values can be speci ed
(such as the number of channels, sampling rate, name of resulting sound le etc.), all of
which have defaults. WITH-SOUND automatically plays the sound once it is computed. This
is done by (invisibly) invoking the PLAY function.
fi
                          fi
                                        fi
                                              fi
                                                                    fi
                                                                                  fi
                                                                                         fi
Opusmodus                                                    with-sound   2

Examples:
(with-sound (:reverb jc-reverb)
 (bandedwg-synth '(q - h w) '(c4 cs5 d4) '(ppp p pp)))

(with-sound (:reverb nrev :scaled-to .7 :decay-time 3.0)
 (circular-scanned-synth '(w d -q 3) '(c4 g4 eb4 a4) '(p pp mp)
                         :wave 1))
