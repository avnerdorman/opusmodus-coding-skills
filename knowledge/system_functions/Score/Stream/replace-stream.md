Opusmodus                                                                    replace-stream   1

replace-stream stream voices &key index duration velocity
                                                       articulation rest-articulation

[Function]

Arguments and Values:
stream                   pitch stream.
voices                   a list of voices.
index                    voice index (name).
duration                 T or NIL. The default is T.
velocity                 T or NIL. The default is T.
articulation             T or NIL. The default is T.
rest-articulation        T or NIL. The default is T.


Description:

This function replaces pitches in all voices with a new pitch stream distribution.


Examples:

In the following example we replace the pitch stream from Webern ‘Sechs Bagatellen’ with a
Bach choral ‘bwv-0004’ pitch stream.

(add-text-attributes
 '(daempfer "mit Dämpfer")
 '(steg "am Steg")
 '(d-saite "d-Saite"))

  (setf vn1
      '(#|1|# (-q - cs5 pp< daempfer+ubow+tie)
        #|2|# (e cs5 > - - bb5 p> leg e5 > leg f4)
        #|3|# (q g4 pp> leg eb4 -)
        #|4|# (-3q eb4ab4 <> harm - -q -)
        #|5|# (-q -3q 3h f6 pp<> ubow)
        #|6|# (-q e a6 f< ten fs6 < ten)
        #|7|# (q g5 ff - -3q - b3 f marc)
        #|8|# (e. c4 < leg s b3 -q -e f3ds4 p leg)
        #|9|# (q a3gs4 < - -)
        #|10|# (-e q g3fs4 ppp> ten -e fermata -q)))
Opusmodus                                                 replace-stream   2

(setf vn2
      '(#|1|# (-h.)
        #|2|# (e c4 pp< daempfer+leg gb4 < leg 3h ab4 -3q -q)
        #|3|# (-h.)
        #|4|# (q bb3 pp pizz+ten - gs3e4 pp<> ubow+arco)
        #|5|# (-q (ttrem d4 pp< steg+leg fs4 steg))
        #|6|# (-h)
        #|7|# (-q -3q 3h gs5 ff d-saite+leg q f4 >)
        #|8|# (-q -3q gs3 f> stacc+pizz a4 > stacc -q)
        #|9|# (-3q 3h eb6 f> ten+arco+tie s - e gb4 p> leg+d-saite
               f5 leg s e5 -)
        #|10|# (-h. fermata)))

(setf vla
      '(#|1|# (-q -3q 3h eb4 pp<> ubow+harm+ten+steg+daempfer -q)
        #|2|# (-q s a3 pp stacc+steg b3 stacc+steg a3 stacc+steg b3
               stacc+steg a3 stacc+steg b3 stacc+steg a3 stacc+steg
               b3 stacc+steg)
        #|3|# (-h.)
        #|4|# (-e. s c4 p< arco+leg q. c5 leg e bb4 >)
        #|5|# (-h)
        #|6|# (-s e b5 sf leg s bb4 >p< tie e -)
        #|7|# (-q e f5 fff ten+pizz eb5 ten -q)
        #|8|# (-e q. cs5fs5 sfp harm+arco+trem -e b3fs4 p leg)
        #|9|# (q c3cs4 < - -s e. bb5 p> marc+tie)
        #|10|# (e. bb4 pp -s -3q c5 ppp> fermata+ten - -q)))

(setf vlc
      '(#|1|# (-q d4 pp< ten+harm+daempfer -)
        #|2|# (-q - -3q 3h fs2 pp leg+tie)
        #|3|# (q. fs2 < leg e e2 > e4 p leg d5 leg+tie)
        #|4|# (e d5 < leg f5 > -q a2f3 pp<>)
        #|5|# (-e q cs3fs3 p< ten+harm e g2 pp ten+tie)
        #|6|# (3q g2 < 3h cs3fs3 f ten+harm -e c2b2 stacc+pizz)
        #|7|# (-s gs4 ff< leg+arco e e5 < leg+tie q < -e
               db3c4 f stacc+pizz)
        #|8|# (-q -e g3 sffp harm+arco+marc+leg q d4 > leg+app
               3q g3 harm 3h f> harm+marc+tie)
        #|9|# (e g3 > harm p harm+marc+tie 3q > harm - - -q)
        #|10|# (3q b2 pp pizz - cs2fs2 pp< harm+arco+tie e > harm
                -e fermata -q)))
Opusmodus                                                 replace-stream   3

(setf tempo
      '(("Mäßig" 60 :length 10/4)
        (:rit 60 40 1/64 2/4)
        (60 2/4)
        (:accel 60 96 1/64 2/4)
        ("heftig" 96 2/4)
        (:rit 96 60 1/64 1/4)
        ("wieder mäßig" 60 4/4)
        (:rit 60 44 1/64 2/4)
        (44 3/4)))

(def-score Anton-Webern-OP-9-I
           (:title "Sechs Bagatellen für Streichquartett OP.9, I"
            :composer "Anton Webern"
            :copyright "Copyright © 1924 Universal Edition"
            :key-signature 'chromatic
            :time-signature (get-time-signature vn1)
            :tempo tempo
            :octave-shift '(c2 c6)
            :flexible-clef t
            :accidentals :cautionary
            :layout (string-quartet-layout 'vn1 'vn2 'vla 'vlc))

     (vn1
      :omn vn1
      :channel 1
      :sound 'vsl-violin-solo
      :controllers (11 (gen-dynamic-controller vn1)))

     (vn2
      :omn vn2
      :channel 2
      :sound 'vsl-violin-solo
      :controllers (11 (gen-dynamic-controller vn2)))

     (vla
      :omn vla
      :channel 3
      :sound 'vsl-viola-solo
      :controllers (11 (gen-dynamic-controller vla)))

     (vlc
      :omn vlc
      :channel 4
      :sound 'vsl-cello-solo
      :controllers (11 (gen-dynamic-controller vlc)))
 )
Opusmodus                                                 replace-stream   4

Bach, BWV 0004

(setf soprano
      '((-h. q b4) (q as4 e b4 cs5 q d5 e5) (q d5 cs5 b4 fermata b4)
        (q g4 a4 b4 e a4 g4) (e fs4 e4 q fs4 e4 fermata b4)
        (q as4 e b4 cs5 q d5 e5) (q d5 cs5 b4 fermata b4)
        (q g4 a4 b4 e a4 g4) (e fs4 e4 q fs4 e4 fermata -q)
        (e e4 fs4 q g4 a4 e e4 fs4) (q g4 a4 b4 fermata b4)
        (q e5 ds5 e5 e fs5 e5) (q d5 cs5 b4 fermata cs5)
        (q d5 e b4 cs5 q d5 a4) (q g4 fs4 h e4 fermata) (q b4 a4 h g4)
        (h fs4 e4 fermata)))

(setf alto
      '((-h. q g4) (q fs4 fs4 fs4 fs4)
        (q fs4 e fs4 e4 q ds4 fermata fs4) (q e4 d4 e d4 ds4 q e4 tie)
        (q e4 ds4 b3 fermata g4) (q fs4 fs4 fs4 fs4)
        (q fs4 e fs4 e4 q ds4 fermata fs4) (q e4 d4 e d4 ds4 q e4 tie)
        (q e4 ds4 b3 fermata -q) (q b3 e4 q. e4 e ds4)
        (q e4 d4 d4 fermata e g4 a4) (q b4 a4 b4 fs4)
        (q fs4 e fs4 e4 q d4 fermata e4) (q fs4 d4 g4 fs4)
        (e fs4 e4 e4 ds4 h e4 fermata) (e d4 e4 q. fs4 e ds4 q e4 tie)
        (q e4 ds4 h b3 fermata)))

(setf tenor
      '((-h. e e4 d4) (q cs4 e d4 as3 q b3 cs4)
        (q b3 as3 fs3 fermata b3) (e b3 c4 b3 a3 g3 a3 q b3)
        (q c4 e fs3 a3 q g3 fermata e e4 d4) (q cs4 e d4 as3 q b3 cs4)
        (q b3 as3 fs3 fermata b3) (e b3 c4 b3 a3 g3 a3 q b3)
        (q c4 e fs3 a3 q g3 fermata -q) (e g3 a3 q b3 e a3 b3 q c4)
        (q b3 a3 g3 fermata d4) (q g4 fs4 e e4 d4 q cs4)
        (q b3 as3 fs3 fermata g3) (q a3 g3 g3 e d4 c4)
        (q b3 a3 h g3 fermata)
        (q g3 e fs3 b3 q b3 c4 tie) (q c4 e b3 a3 h gs3 fermata)))

(setf bass
      '((-h. q e3) (e fs3 e3 d3 cs3 q b2 as2) (q b2 fs2 b2 fermata ds3)
        (q e3 fs3 e g3 fs3 q e3) (e a2 s b2 c3 q b2 e2 fermata e3)
        (e fs3 e3 d3 cs3 q b2 as2) (q b2 fs2 b2 fermata ds3)
        (q e3 fs3 e g3 fs3 q e3) (e a2 s b2 c3 q b2 e2 fermata -q)
        (q. e3 e d3 c3 b2 q a2) (q e3 fs3 g3 e g3 fermata fs3)
        (q e3 fs3 gs3 as3) (q b3 fs3 b2 fermata e3)
        (q d3 g3 e b2 c3 q d3) (q e3 b2 h c3 fermata) (q g3 ds3 e3 c3)
        (q a2 b2 h e2 fermata)))
Opusmodus                                                     replace-stream   5

(def-score bach-bwv-0004
           (:title "Bach, BWV-0004"
            :composer "J.S. Bach"
            :key-signature '(e min)
            :time-signature '(4 4)
            :tempo 88
            :layout (choir-satb-layout 'soprano 'alto 'tenor 'bass))

    (soprano :omn soprano :channel 1 :sound 'gm :program 0)
    (alto :omn alto :channel 2)
    (tenor :omn tenor :channel 3)
    (bass :omn bass :channel 4)
)

(setf webern (collect-score-instruments 'Anton-Webern-OP-9-I))
(setf bach (collect-score-instruments 'bach-bwv-0004))
(setf stream (collect-stream :pitch bach))

(replace-stream stream webern :index 'v)

(ps 'gm
    :sq (list v1 v2 v3 v4)
    :time-signature (get-time-signature vn1)
    :tempo tempo
    )
Opusmodus                                                                                                                                                                                 replace-stream   6

                                                                          mit Dämpfer
                            Mäßig = 60
                                                                                                2

               Violin I



                                                                                                                                       3

              Violin II




                                                                mit Dämpfer
                                                                am Steg
                                                                                                                             am Steg

                  Viola
                                                            3



                                                    mit Dämpfer
                                                                                                                                                                               3

            Violoncello




                      3                                                                                                         3
                                                                                                    4

             Vln. I



                                                                                                                                                                                   arco
                                                                                                            pizz.

            Vln. II




                                                                                                                                                   arco


              Vla.




              Vlc.




                                                                                           accel.                                      heftig   = 96

                      5
                                                                                       6                                               7

             Vln. I
                                                        3                                                                                                                                  3



                                                 am Steg                                                                                                                       d-Saite
                                                                                                                                                                           3

            Vln. II




                                                                                                                                                                   pizz.

              Vla.




                                                                                                3                    pizz.                      arco                                           pizz.


              Vlc.




                          wieder mäßig = 60                                                                                                                = 44

                      8
                                                                                   9                                                              10

             Vln. I




                                     pizz.
                                             3
                                                                                             arco                   d-Saite
                                                                                            3

            Vln. II



                             arco


              Vla.
                                                                                                                                                                                     3


                                                                                                                                                       pizz.       arco
                                                 arco               3                                   3                                                      3


              Vlc.



                                                                                                                                                                                           Opusmodus
Opusmodus                                                            replace-stream   7

To remove articulation events from the original score we set the :articulation and
the :rest-articulation to NIL:

(replace-stream stream webern
                :index 'v
                :articulation nil
                :rest-articulation nil)

(ps 'vsl
    :sq (list v1 v2 v3 v4)
    :time-signature (get-time-signature vn1)
    :tempo tempo
    )
Opusmodus                                                                                                         replace-stream   8


                      Mäßig = 60
                                                                  2

         Violin I



                                                                                     3

        Violin II




            Viola
                                            3



                                                                                                              3

      Violoncello




                3                                                                3
                                                                             4

       Vln. I




      Vln. II




        Vla.




        Vlc.




                                                                accel.               heftig    = 96
                5
                                                            6                        7

       Vln. I
                                        3                                                                             3


                                                                                                          3

      Vln. II




        Vla.




                                                                   3

        Vlc.




                    wieder mäßig = 60                                                              = 44

                8
                                                    9                                         10

       Vln. I




                                   3
                                                        3

      Vln. II




        Vla.
                                                                                                                  3



                                                                         3                            3

        Vlc.




                                                3

                                                                                                                      Opusmodus
