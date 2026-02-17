Opusmodus                                                                   microtonality       1

microtonality
GM, MTS and Pitch-Bend ports setup


Description:

Opusmodus microtonal system supports GM, MTS (MIDI Tuning Standard) and Pitch-Bend
via Ports.

MTS is a speci cation of precise musical pitch agreed to by the MIDI Manufacturers
Association in the MIDI protocol. MTS allows for both a bulk tuning dump message, giving
a tuning for each of 128 notes, and a tuning message for individual notes as they are played.

GM and Virtual Instrument with MTS support:

GM does not need any speci c setup.

(def-score mts-gm
           (:key-signature 'chromatic
            :tempo '(q 60)
            :time-signature '(4 4))

  (inst :omn '(s c4 c4+. c4+ c4+.. cs4 cs4+. cs4+ cs4+..
                 d4 d4+. d4+ d4+.. eb4 eb4+. eb4+ eb4+.. e4)
        :channel 1
        :sound 'gm
        :program 0))

The Virtual Instrument with MTS support requires 1 port only:

(def-score mts-vi
           (:key-signature 'chromatic
            :tempo '(q 60)
            :time-signature '(4 4))

  (inst :omn '(s c4 c4+. c4+ c4+.. cs4 cs4+. cs4+ cs4+..
                 d4 d4+. d4+ d4+.. eb4 eb4+. eb4+ eb4+.. e4)
        :port 0
        :channel 1
        :sound 'gm
        :program 0))
        fi
                      fi
Opusmodus                                                          microtonality   2

Virtual Instrument that support MTS:

Vienna Instruments, Pianoteq, possibly a few more.

Virtual Instrument with Pitch-Bend instead of MTS:

Quarter-tone:

To use Pitch-Bend instead of MTS would require at least 2 ports.
In your DAW you need set 2 ports for each channel.

(def-score quarter-tone
           (:key-signature 'chromatic
            :tempo '(q 60)
            :time-signature '(4 4))

  (inst :omn '(s c4 c4+ cs4 cs4+ d4 d4+ eb4 eb4+ e4)
        :port '(0 1)
        :channel 1
        :sound 'gm
        :program 0))

Eighth-tone:

The eighth-tone score requires at least 4 ports.
In your DAW you need set 4 ports for each channel.

(def-score eighth-tone
           (:key-signature 'chromatic
            :tempo '(q 60)
            :time-signature '(4 4))

  (inst :omn '(s c4 c4+. c4+ c4+.. cs4 cs4+. cs4+ cs4+..
                 d4 d4+. d4+ d4+.. eb4 eb4+. eb4+ eb4+.. e4)
        :port '(0 1 2 3)
        :channel 1
        :sound 'gm
        :program 0))
