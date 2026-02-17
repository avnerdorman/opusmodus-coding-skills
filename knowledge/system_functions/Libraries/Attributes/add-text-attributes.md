Opusmodus                                                                   add-text-attributes   1

add-text-attributes &rest attributes
[Function]

Arguments and Values:
attributes              lists of attributes (playing techniques) with optional type:
                        :non-sticky and :sticky. The default is :sticky.


Description:

This function allows you to add your own list of sticky or non-sticky attribute names
to extend the system library.


Examples:

:sticky (default) attributes:

(add-text-attributes
 '(ord-tasto "ord⟶tasto")
 '(tasto-ponte "sul tasto⟶pont.")
 )

'(h c4 ppp> ord-tasto+leg cs5 pppp tasto-ponte)




Attributes with optional :non-sticky type:

(add-text-attributes
 ;; motif start signs
 '(m1 "m1" :non-sticky)
 '(m2 "m2" :non-sticky)
 '(m3 "m3" :non-sticky)
 ;; strings
 '(am-steg "am steg") ; sticky
 '(ruhig "ruhig")
 )
Opusmodus                                                             add-text-attributes       2

'(q c4 m1+leg d4 q c4 m1+leg d4)




For making a custom set of attributes permanently available, you can create a le 'User
Attributes.opmo' in the Opusmodus 'Extensions' folder - if it hasn't been created already -
with the contents below. For attributes that are speci c for a certain composition, you might
want to add your custom attribute de nitions, say, at the top of the le generating that
composition. To be able to add your own attributes (playing techniques) to the system you
need to add a new list with two or three arguments to the existing list (see below). The rst
argument is a symbol (name) which you will use in the omn-script, the second argument is a
string (text) that will be displayed in the score above the note. The third argument is an
optional attribute type. See the example above:

;;; -------------------------------------------------------------------
;;; User Text Attributes
;;; -------------------------------------------------------------------
;;; Copyright © 2016 Opusmodus Ltd, All rights reserved.
;;; -------------------------------------------------------------------
;;; This file needs to be in the Opusmodus Extensions folder.
;;; -------------------------------------------------------------------
(in-package :Opusmodus)

;;; -------------------------------------------------------------------
;;; To add your own attribute (playing techniques) to the system
;;; you need to add a new list with two arguments.
;;; The first is a symbol (name) which you will use in the omn
;;; script and the second is a string, text that will be displayed
;;; in the score above the note.

(add-text-attributes
 ;; Strings
 '(ord-tasto "ord⟶tasto")
 '(tasto-ord "tasto⟶ord.")
 '(arco-tasto "arco sul tasto")
 '(alto-tasto "alto sul tasto")
 '(extr-tasto "extr. sul tasto")
 '(molto-tasto "molto sul tasto")
 '(ord-ponte "ord⟶pont.")
 '(ponte-ord "pont.⟶ord.")
 '(tasto-ponte "sul tasto⟶pont.")
 '(tasto-ponte-tasto "sul tasto⟶pont⟶tasto")
 '(ponte-tasto-ponte "sul pont⟶tasto⟶pont.")
                              fi
                                              fi
                                                            fi
                                                                        fi
                                                                                 fi
Opusmodus                                             add-text-attributes   3

 '(ponte-tasto "sul pont⟶tasto")
 '(arco-ponte "arco sul pont.")
 '(poco-ponte "poco sul pont.")
 '(da-ponte "dietro al pont.")
 '(extr-ponte "extr. sul pont.")
 '(alto-ponte "alto sul pont.")
 '(molto-ponte "molto sul pont.")

 ;; Brass
 '(half-depressed-valves "half depressed valves")
 '(hit-on-mouthpiece "hit on mouthpiece")
 '(insert-straight-mute-into-bell "insert straight mute into bell")
 '(kiss "kiss")
 '(mouthpiece-backwards "mouthpiece backwards")
 '(mouthpiece-only "mouthpiece only")
 '(play-and-sing "play and sing")
 '(silent-brass "silent brass")
 '(snap-with-a-finger-on-the-bell "snap with a finger on the bell")
 '(stop-mute-closed "stop mute closed")
 '(stop-mute-open "stop mute open")
 '(stop-mute-wahwah-effect "stop mute wahwah effect")
 '(without-mouthpiece "without mouthpiece")
 '(air-noise-f "air noise-f")
 '(air-noise-h "air noise-h")
 '(air-noise-k "air noise-k")
 '(air-noise-p "air noise-p")
 '(air-noise-s "air noise-s")
 '(air-noise-sh "air noise-sh")
 '(air-noise-t "air noise-t")
 '(without-tubings "without tubings")

 ;; Blowing
 '(over-blow "over blow")
 '(under-blow "under blow")
 '(harsh-blow "harsh blow")
 '(without-air "without air")
 '(low-noise-blow "low noise blow")
 '(high-noise-blow "high noise blow")
 '(multiph "multiphonic")
 '(breathy "breathy")
 '(hum "hum")
 '(finger-damp "finger damp")

 ;; Harp
 '(bisb "bisbigl.")
 '(thin-pick "thin pick")
 '(between-tuning-peg-and-tuning-mechanism
   "between tuning peg and tuning mechanism")
 '(clang "clang")
 '(close-to-table "close to table")
 '(dampened "dampened")
Opusmodus                                                                add-text-attributes       4

 '(fingernail "fingernail")
 '(hand-on-the-corpus "hand on the corpus")
 '(hand-on-the-strings "hand on the strings")
 '(knuckle-on-the-corpus "knuckle on the corpus")
 '(semitone-downwards "semitone downwards")
 '(semitone-upwards "semitone upwards")
 '(wholetone-downwards "wholetone downwards")
 '(wholetone-upwards "wholetone upwards")
 '(pedal-noise "pedal noise")
 '(tuning-wrench "tuning wrench")
 '(hit "hit")
 '(xylophone-tone "xylophone tone")
 )

In the text editor, the new attributes will be syntax highlighted in your given colour
which you assign in the Preferences window. It is important to know that if you share your
score with others to include the attribute lists together with the score at the beginning of the
score.
