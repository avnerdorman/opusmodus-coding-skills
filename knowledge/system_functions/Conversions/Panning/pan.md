Opusmodus                                                                          pan   1

pan number
[Function]

Arguments and Values:
number                  a number or list of numbers.


Description:
This function converts mixer panning values in the range from -100(L) to 100(R) into
MIDI pan values. The centre position value in the PAN function is 0.


Examples:
(pan 0)
=> 64

(pan '(-12 0 12))
=> (56 64 72)

(pan '(-30 -10 10 30))
=> (45 58 70 83)

PAN in DEF-INSTRUMENT-SETS instance:

:string-quartet
  (:layout string-quartet-layout
           :port nil
           :channel '(1 2 3 4)
           :sound 'gm
           :program '(violin violin viola cello)
           :controllers nil
           :pan (pan '(-30 -10 10 30))
           :volume 92)
Opusmodus                                                pan   2




PAN in DEF-SCORE instrument instants de nition:

(def-score SQ
           (:title "String Quartet - VSL Show"
            :key-signature 'chromatic
            :time-signature (get-time-signature vln1)
            :tempo tempo
            :layout (string-quartet-layout
                     'violin1 'violin2 'viola 'cello))

  (violin1
   :omn vln1
   :port 0
   :channel 1 :sound 'vsl-violin-solo
   :program 0 :pan (pan -30))

  (violin2
   :omn vln2
   :channel 2 :sound 'vsl-violin-solo
   :program 0 :pan (pan -10))

  (viola
   :omn vla
   :channel 3 :sound 'vsl-viola-solo
   :program 0 :pan (pan 10))

  (cello
    :omn vlc
    :channel 4 :sound 'vsl-cello-solo
    :program patches-vc :pan (pan 30))
  )
                                  fi
