Opusmodus                                                                  read-map   1

read-map map name
[Function]

Arguments and Values:
map                      map.
name                     a name or list of mapped names.


Description:

This function retrieve a list of mapped values.

(read-map *gm-percussion* '(Bass-Drum1 Acoustic-Snare))
=> (c2 d2)


Examples:

Opusmodus provide two examples of percussion mapping: *gm-percussion* (general
midi percussion set) and *studio-drummer* (NI Kontakt). You will nd the two les in
the Utilities Library panel.

(read-map *gm-percussion*
            '((Bass-Drum1 Side-Stick Acoustic-Snare)
              (Low-Floor-Tom Closed-Hi-hat High-Floor-Tom
               Pedal-Hi-hat Low-Tom)
              (Open-Hi-hat Low-Mid-Tom High-Mid-Tom)
              (Crash-Cymbal1 High-Tom Ride-Cymbal1)))
=> ((c2 cs2 d2) (f2 fs2 g2 gs2 a2) (bb2 b2 c3) (cs3 d3 eb3))

(read-map *studio-drummer*
            '((kick-dampened)
              (snare-sidestick snare-center
               snare-rimshot snare-halfway tom4-center)
              (hithat-closed-tip hithat-closed-pedal
               hithat-closed-tip hithat-open-control)
              (tom2-center tom1-center)))
=> ((c2) (cs2 d2 eb2 e2 f2) (fs2 gs2 fs2 bb2) (a2 b2))
                                                           fi
                                                                      fi
