Opusmodus                                                                           def-sound-set   1

def-sound-set name &body body &key programs controllers
[Macro]

Arguments and Values:
name                    sound-set name.
body                    programs and controllers.
programs                is a plist containing pairs of the form: <program-name> <program>,
                        where <program> is a program number or a 2-list of
                        (<bank-select> <program-number>) of a list of
                        (<controller name><value> ... &optional <program-number>).
controllers             is a plist containing pairs of the for: <control-name> <control value>,
                        where <control value> is a 0-based midi value.

Note:                   :programs and :controllers may also contain pairs of the form:
                        :group <group-name>, which places all the following pairs in that group.


Description:

Use this function to de ne a sound-set with the given name. With a named sound-set a
composer can customised OPUSMODUS to re ect the MIDI synthesisers or samplers that a
studio system (inboard or outboard) might contain. Notice that the Programs argument allows
for bank-select.

Here is how an instrument from a de ned sound-set name might be entered into DEF-
SCORE:

(piano1
 :omn rh
 :channel 1
 :sound 'gm
 :program 'acoustic-grand-piano
 :volume 90
 :pan 64)

or just with the program number value:

(piano1
 :omn rh
 :channel 1
 :sound 'gm
 :program 0
 :volume 90
 :pan 64)
               fi
                             fi
                                          fl
Opusmodus                                def-sound-set   2

Example:
(def-sound-set GM
        :programs
         (:group Piano
          Acoustic-Grand-Piano       0
          Bright-Acoustic-Piano      1
          Electric-Grand-Piano       2
          Honky-Tonk-Piano           3
          Electric-Piano-1           4
          Electric-Piano-2           5
          Harpischord                6
          Clavi                      7

            :group Percussion
            Celesta                  8
            Glockenspiel             9
            Music-Box               10
            Vibraphone              11
            Marimba                 12
            Xylophone               13
            Tubular-Bells           14
            Dulcimer                15

            :group Organ
            Drawbar-Organ           16
            Percussive-Organ        17
            Rock-Organ              18
            Church-Organ            19
            Reed-Organ              20
            Accordion               21
            Harmonica               22
            Tango-Accordion         23

            :group Guitar
            Acoustic-Guitar-Nylon   24
            Acoustic-Guitar-Steel   25
            Electric-Guitar-Jazz    26
            Electric-Guitar-Clean   27
            Electric-Guitar-Muted   28
            Overdriven-Guitar       29
            Distortion-Guitar       30
            Guitar-Harmonics        31
Opusmodus                               def-sound-set   3

            :group Bass
            Acoustic-Bass          32
            Electric-Bass-Finger   33
            Electric-Bass-Pick     34
            Fretless-Bass          35
            Slap-Bass-1            36
            Slap-Bass-2            37
            Synth-Bass-1           38
            Synth-Bass-2           39

            :group Strings
            Violin                 40
            Viola                  41
            Cello                  42
            Contrabass             43
            Tremolo-Strings        44
            Pizzicato-Strings      45
            Orchestral-Harp        46
            Timpani                47

            :group Ensemble
            String-Ensemble-1      48
            String-Ensemble-2      49
            Synth-Strings-1        50
            Synth-Strings-2        51
            Choir-Aahs             52
            Voice-Oohs             53
            Synth-Voice            54
            Orchestra-Hit          55

            :group Brass
            Trumpet                56
            Trombone               57
            Tuba                   58
            Muted-Trumpet          59
            French-Horn            60
            Brass-Section          61
            Synth-Brass-1          62
            Synth-Brass-2          63

            :group Reed
            Soprano-Sax            64
            Alto-Sax               65
            Tenor-Sax              66
            Baritone-Sax           67
            Oboe                   68
            English-Horn           69
            Bassoon                70
            Clarinet               71
Opusmodus                                def-sound-set   4

            :group Pipe
            Piccolo                 72
            Flute                   73
            Recorder                74
            Pan-Flute               75
            Blown-Bottle            76
            Shakuhacki              77
            Whistle                 78
            Ocarina                 79

            :group Synth-Lead
            Lead-1-Square           80
            Lead-2-Sawtooth         81
            Lead-3-Calliope         82
            Lead-4-Chiff            83
            Lead-5-Charang          84
            Lead-6-Voice            85
            Lead-7-Fifths           86
            Lead-8-Bass+Lead        87

            :group Synth-Pad
            Pad-1-New-Age           88
            Pad-2-Warm              89
            Pad-3-Polysynth         90
            Pad-4-Choir             91
            Pad-5-Bowed             92
            Pad-6-Metallic          93
            Pad-7-Halo              94
            Pad-8-Sweep             95

            :group Synth-Effects
            Fx-1-Rain               96
            Fx-2-Soundtrack         97
            Fx-3-Crystal            98
            Fx-4-Athmosphere        99
            Fx-5-Brightness        100
            Fx-6-Goblins           101
            Fx-7-Echoes            102
            Fx-8-Scifi             103

            :group Ethnic
            Sitar                  104
            Banjo                  105
            Shamisen               106
            Koto                   107
            Kalimba                108
            Bagpipe                109
            Fiddle                 110
            Shanai                 111
Opusmodus                                 def-sound-set   5

             :group Percussive
             Tinkle-Bell            112
             Agago                  113
             Steel-Drums            114
             Woodblock              115
             Taiko-Drum             116
             Melodic-Tom            117
             Synth-Drum             118
             Reverse-Cymbal         119

             :group Sound-Effects
             Guitar-Fret-Noise      120
             Breath-Noise           121
             Seashore               122
             Bird-Tweet             123
             Telephone-Ring         124
             Helicopter             125
             Applause               126
             Gunshot                127
             )

            :controllers
             (:group General
             Bank-Select             0
             Modulation              1
             Breath-Control          2
             Foot-Control            4
             Portamento-Time         5
             Data-Entry              6
             Volume                  7
             Balance                 8
             Pan                    10
             Expression             11
             Effects-Controller1    12
             Effects-Controller2    13
             Gen-Purpose1           16
             Gen-Purpose2           17
             Gen-Purpose3           18
             Gen-Purpose4           19

             :group LSB
             Bank-Select-LSB        32
             Modulation-LSB         33
             Breath-Control-LSB     34
             Foot-Control-LSB       36
             Portamento-Time-LSB    37
             Data-Entry-LSB         38
             Volume-LSB             39
             Balance-LSB            40
             Pan-LSB                42
             Expression-LSB         43
Opusmodus                                 def-sound-set   6

            Gen-Purpose1-LSB       48
            Gen-Purpose2-LSB       49
            Gen-Purpose3-LSB       50
            Gen-Purpose4-LSB       51

            :group Pedal
            Sustain                64
            Sus                    64
            Ped                    64
            Damper                 64
            Sostenuto-Ped          66
            Sostenuto              66
            Sost                   66
            Soft-Ped               67
            Una-Corda              67
            uc                     67
            Legato-Ped             68
            Hold2                  69
            Sound-Variation        70
            Resonance              71
            Release-Time           72
            Attack-Time            73
            Cut-Off-Frequency      74
            Decay-Time             75
            Vibrato-Rate           76
            Vibrato-Depth          77
            Vibrato-Delay          78
            Gen-Purpose5           80
            Gen-Purpose6           81
            Gen-Purpose7           82
            Gen-Purpose8           83
            Portamento-Control     84
            Reverb-Depth           91
            Tremolo-Depth          92
            Chorus-Depth           93
            Celeste-De-Tune        94
            Phaser-Depth           95
            Data-Increment         96
            Data-Decrement         97
            Non-Reg-Param-LSB      98
            Non-Reg-Param          99
            Reg-Param-LSB         100
            Reg-Param             101
            All-Sound-Off         120
            Reset-All-Controllers 121
            Local-Control         122
            All-Notes-Off         123
            Omni-Off              124
            Omni-On               125
            Mono-On               126
            Poly-On               127))
