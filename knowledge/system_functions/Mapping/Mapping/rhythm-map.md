Opusmodus                                                                      rhythm-map   1

rhythm-map pitch velocity sequence
[Function]

Arguments and Values:
pitch                   A pitch symbol or a list of pitches.
velocity                A velocity symbol or a list of velocities.
sequence                A sequence of length values or an OMN-form sequence.


Description:

The RHYTHM-MAP function maps speci ed pitch and velocity values to a rhythmic pattern
or an OMN-form sequence. This function is particularly useful in percussion mapping and
generating rhythmic sequences based on prede ned pitch and velocity pairings.

(rhythm-map 'c2 'ff '( s - - - - - - - = - - - - - - -))
=> (s c2 ff -s - - - - - - s c2 -s - - - - - -)


Examples:

Opusmodus provide two examples of percussion mapping: *gm-percussion* (general
midi percussion set) and *studio-drummer* (IN Kontakt set). You will nd the two les
in the Utilities Library section.

(setf bass-drum (read-map *gm-percussion* 'acoustic-bass-drum))
=> (b1)

(rhythm-map bass-drum 'ff (polygon-rhythm 3 16 0))
=> (s b1 ff - - b1 - - - - - - - - - b1 - -)

Using the GEN-LOOP function, we generate 8 bars of polygon rhythm with a bass drum map
from the GM percussion set:

(gen-loop 8 (rhythm-map bass-drum 'ff (polygon-rhythm 3 16 0)))
=> ((s b1 ff - - - - - - b1 - b1 - - - - - -)
    (s b1 ff - - - - - b1 - - - b1 - - - - -)
    (s b1 ff - - - - - - b1 - b1 - - - - - -)
    (s b1 ff - - - - - - b1 - b1 - - - - - -)
    (s b1 ff - - - b1 - - - - - - - b1 - - -)
    (s b1 ff - - - - - - b1 - b1 - - - - - -)
    (s b1 ff b1 - - - - - - - - - - - - - b1)
    (s b1 ff - - - - - b1 - - - b1 - - - - -))
                                fi
                                       fi
                                                                       fi
                                                                                 fi
Opusmodus                                                                      rhythm-map   2

Mapping the bass-drum into the OMN sequence:

(setf omn-seq '((q bb0bb1f1 mf fs1gs2d2 e. bb2 -q -s)
                (q bb3f4b4 mf 3e bb2 b3 d4 s g2bb1g1 -e. q. bb4cs5b5)
                (-5q bb2 mf b3 d4 - 3h bb2 b3 d4)))

(rhythm-map 'c2 'ff omn-seq)
=> ((q c2 ff c2 e. -q -s)
    (q c2 ff 3e 3e 3e s -e. q. c2)
    (-5q c2 ff c2 c2 - 3h c2 c2 c2))

Creating patterns for bass drum, snare, hi-hat, and cymbals:

(progn                            ;; 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6
 (setf bd1 (rhythm-map 'c2 'f    '( s - - - - - - - = - - - - - - -)))
 (setf sn1 (rhythm-map 'd2 'ff   '(-s - - - = - - - - - - - = - - -)))
 (setf hh1 (rhythm-map 'gs2 'fff '( s - = - = - = - = - = - = - = -)))
 (setf cy1 (rhythm-map 'bb2 'fff '(-s - - - - - = - - - - - = - - -)))

 (self bd2 (rhythm-map 'c2 'f    '( s - - - - - - - = - - - - - - -)))
 (setf sn2 (rhythm-map 'd2 'ff   '(-s - - - = - - - - - - - = - - -)))
 (setf hh2 (rhythm-map 'gs2 'fff '( s - = - = - = - = - = - = - = -)))
 (setf cy2 (rhythm-map 'bb2 'fff '( s - - - = - - - = - - - = - - -)))

 (self bd-sec-1 (gen-repeat 24 (list bd1)))
 (setf sn-sec-1 (gen-repeat 24 (list sn1)))
 (setf hh-sec-1 (gen-repeat 24 (list hh1)))
 (setf cy-sec-1 (gen-repeat 24 (list cy1)))

 (setf bd-sec-2 (gen-repeat 16 (list bd2)))
 (setf sn-sec-2 (gen-repeat 16 (list sn2)))
 (setf hh-sec-2 (gen-repeat 16 (list hh2)))
 (setf cy-sec-2 (gen-repeat 16 (list cy2)))

 (self bd (assemble-seq bd-sec-1 bd-sec-2 bd-sec-1))
 (setf sn (assemble-seq sn-sec-1 sn-sec-2 sn-sec-1))
 (self hh (assemble-seq hh-sec-1 hh-sec-2 hh-sec-1))
 (setf cy (assemble-seq cy-sec-1 cy-sec-2 cy-sec-1))
 )

If necessary, you can merge all instrument sequences into a single sequence:

(merge-voices bd sn hh cy)
=> ((s c2gs2 f - gs2 fff - d2gs2 ff - gs2bb2 fff -
       c2gs2 f - gs2 fff - d2gs2bb2 ff - gs2 fff -)
    . . .)
Opusmodus                                 rhythm-map   3

A short score for the drum patterns:

(def-score drums
     (:key-signature 'chromatic
      :time-signature '(4 4)
      :tempo 96)

   (kik :omn bd :sound 'gm :channel 10)
   (snr :omn sn)
   (hht :omn hh)
   (cym :omn cy)
   )

  (display-midi 'drums)
