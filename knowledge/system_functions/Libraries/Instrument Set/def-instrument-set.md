     Opusmodus                                                                     def-instrument-set     1

     def-instrument-set name &body body &key instruments
     [Macro]

     Arguments and Values:
     name                      instrument-set name.
     body                      instruments.
     instruments               a plist containing pairs of the form: <instrument-name><instrument-set>,
                               where <instrument-set> is a list of (<layout><port><channel>
                               <sound><program><controllers><pan><volume>).


     Description:

     Use this function to de ne the instrument-set with a given name. With named instrument-
     sets a composer can customise OPUSMODUS to re ect MIDI synthesisers or samplers
     which a studio system (inboard or outboard) might contain. The DEF-INSTRUMENT-SET
     function is an essential companion to the PS function (PS stands for ‘Preview Score’ or,
     ‘Preview Snippet’). To create instrument-set is fairly easy to do as it resembles the
     instrument setup from the DEF-SCORE instance.

     The instrument-set template:

     <instrument-name>
      (:layout <layout>
       :port <port>
       :channel <channel>
       :sound <sound-set>
       :program <program>
       :controllers <controllers>
       :pan <panning>
       :volume <volume>)

     To explain how it all works we will de ne new instrument-set with two instruments. In our
     example we will use :oboe and :bassoon as our instrument names with a library name:
     my-inst. The next step we need to do is to select the corresponding instrument layout. The
     prede ned layouts you will nd in the ‘Instrument Layout Presets’ document in the System/
     Layout library.
fi
                    fi
                          fi
                                      fi
                                                      fl
Opusmodus                                                       def-instrument-set   2

Examples:
(def-instrument-set my-inst
                    :instruments
  (:group wind
          :oboe
          (:layout oboe-layout
                   :port nil
                   :channel 1
                   :sound 'gm
                   :program '(oboe)
                   :controllers nil
                   :pan (pan 0)
                   :volume 92)

            :bassoon
            (:layout bassoon-layout
                     :port nil
                     :channel 2
                     :sound 'gm
                     :program '(bassoon)
                     :controllers nil
                     :pan (pan -10)
                     :volume 92)
            ))

Here is how an instrument from a de ned instrument-sets name might be entered into
PS:

(ps 'my-inst
    :oboe (list '((s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
                  (s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
                  (s a4 leg d5 leg cs5 leg b4 leg a4 leg g4 leg)
                  (s fs4 leg d4 leg e4 leg cs4 leg e d4)))
    :bassoon (list '((e fs3 d3 e3)
                     (e fs3 d3 e3)
                     (e fs3 g3 a3)
                     (e d3 a2 d2)))
    :key-signature '(d maj)
    :time-signature '(3 8 1)
    :tempo 112)

You can de ne as many instrument-sets libraries as needed.
    fi
                                 fi
