Opusmodus                                                          replace-pitch-map   1

replace-pitch-map map name sequence
[Function]

Arguments and Values:
map                        name map to pitch.
name                       a name or list of mapped names.
sequence                   omn list or lists.


Description:

REPLACE-PITCH-MAP will replace any pitch in a omn sequence with mapped pitches.

(replace-pitch-map *gm-percussion*
                   'Bass-Drum1
                   '(s c4 - = - - - = - = - = - - - = - -))
=> (s c2 - c2 - - - c2 - c2 - c2 - - - c2 - -)


Examples:

Opusmodus provide two examples of percussion mapping: *gm-percussion* (general
midi percussion set) and *studio-drummer* (IN Kontakt set). You will nd the two les
in the Utilities Library section.

(replace-pitch-map *gm-percussion*
                     '((Bass-Drum1 Side-Stick Acoustic-Snare)
                       (Low-Floor-Tom Closed-Hi-hat High-Floor-Tom
                        Pedal-Hi-hat Low-Tom)
                       (Open-Hi-hat Low-Mid-Tom High-Mid-Tom)
                       (Crash-Cymbal1 High-Tom Ride-Cymbal1))
(gen-loop 4 (rnd-order '(s c4 - = - t = = - e - = - s -))))
=> ((s c2 t cs2 e d2 -s c2 -e t cs2 -s t d2 -s -t e c2 - s cs2)
    (-s t f2 fs2 -s g2 -e -t s gs2 -e a2 f2 s fs2 - t g2)
    (-t s bb2 e b2 -s -e s c3 - t bb2 -s t b2 -e t c3 s bb2 e b2)
    (-t s cs3 d3 e eb3 t cs3 -s - - t d3 eb3 e cs3 s d3 -e -))

Merging all percussions:

(merge-voices
 (replace-pitch-map
  *gm-percussion* 'Ride-Cymbal1
  (rnd-order (gen-repeat 8 (list '(3q c4 ff - = = - = = - = = --)))))
                                                              fi
                                                                            fi
Opusmodus                                               replace-pitch-map   2

(replace-pitch-map
  *gm-percussion* 'Closed-Hi-hat
  (gen-repeat 8 (list '(-q 3q c4 ff -- = -- = - =))))

 (replace-pitch-map
  *gm-percussion* 'Open-Hi-hat
  (gen-repeat 8 (list '(-h -3w 3q c4 ff -))))

 (replace-pitch-map
  *gm-percussion* 'Acoustic-Snare
  (gen-repeat 8 (list '(-q 3q c4 ff -q -3h 3q --))))

 (replace-pitch-map
   *gm-percussion* 'Bass-Drum1
   (rnd-order (gen-repeat 8 (list '(3q c4 ff - = -- = = - = - = =)))))
 )
