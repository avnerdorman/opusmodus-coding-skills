Opusmodus                                                            collect-stream   1

collect-stream events lists
[Function]

Arguments and Values:
events                 :length, :pitch, :interval, :velocity and :articulation.
lists                  a sequence (omn-form lists).


Description:

This function collects events from a list of voices (instruments) and brings them
together into a single stream.


Examples:
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
Opusmodus                                                    collect-stream   2

(setf bass
      '((-h. q e3) (e fs3 e3 d3 cs3 q b2 as2) (q b2 fs2 b2 fermata ds3)
        (q e3 fs3 e g3 fs3 q e3) (e a2 s b2 c3 q b2 e2 fermata e3)
        (e fs3 e3 d3 cs3 q b2 as2) (q b2 fs2 b2 fermata ds3)
        (q e3 fs3 e g3 fs3 q e3) (e a2 s b2 c3 q b2 e2 fermata -q)
        (q. e3 e d3 c3 b2 q a2) (q e3 fs3 g3 e g3 fermata fs3)
        (q e3 fs3 gs3 as3) (q b3 fs3 b2 fermata e3)
        (q d3 g3 e b2 c3 q d3) (q e3 b2 h c3 fermata) (q g3 ds3 e3 c3)
        (q a2 b2 h e2 fermata)))

(setf bwv-0004 (list soprano alto tenor bass))

(setf stream (collect-stream :pitch bwv-0004))
=> (b4 g4 e4 e3 d4 as4 fs4 cs4 fs3 e3 b4 fs4 d4 d3 cs5 as3 cs3
       d5 fs4 b3 b2 e5 fs4 cs4 as2 d5 fs4 b3 b2 cs5 fs4 as3
       fs2 e4 b4 ds4 fs3 b2 b4 fs4 b3 ds3 g4 e4 b3 e3 c4 a4
       d4 b3 fs3 a3 b4 d4 g3 g3 ds4 a3 fs3 a4 e4 b3 e3 g4 fs4
       c4 a2 e4 b2 c3 fs4 ds4 fs3 b2 a3 e4 b3 g3 e2 b4 g4 e4
       e3 d4 as4 fs4 cs4 fs3 e3 b4 fs4 d4 d3 cs5 as3 cs3 d5 fs4
       b3 b2 e5 fs4 cs4 as2 d5 fs4 b3 b2 cs5 fs4 as3 fs2 e4 b4
       ds4 fs3 b2 b4 fs4 b3 ds3 g4 e4 b3 e3 c4 a4 d4 b3 fs3 a3
       b4 d4 g3 g3 ds4 a3 fs3 a4 e4 b3 e3 g4 fs4 c4 a2 e4 b2 c3
       fs4 ds4 fs3 b2 a3 e4 b3 g3 e2 e4 b3 g3 e3 fs4 a3 g4 e4 b3
       d3 a4 e4 a3 c3 b3 b2 e4 c4 a2 fs4 ds4 g4 e4 b3 e3 a4 d4
       a3 fs3 b4 d4 g3 g3 b4 g4 d4 g3 a4 fs3 e5 b4 g4 e3 ds5 a4
       fs4 fs3 e5 b4 e4 gs3 d4 fs5 fs4 cs4 as3 e5 d5 fs4 b3 b3
       cs5 fs4 as3 fs3 e4 b4 d4 fs3 b2 cs5 e4 g3 e3 d5 fs4 a3
       d3 b4 d4 g3 g3 cs5 d5 g4 g3 b2 c3 a4 fs4 d4 d3 c4 g4 fs4
       b3 e3 e4 fs4 e4 a3 b2 ds4 e4 e4 g3 c3 b4 d4 g3 g3 e4 a4
       fs4 fs3 ds3 b3 g4 b3 e3 ds4 e4 c4 c3 fs4 a2 ds4 b3 b2 a3
       e4 b3 gs3 e2)

Let’s create a score with the pitch stream from above:

(setf pitches (gen-divide 3 stream))

(setf rh (make-omn :length '(-s s s)
                   :pitch (mapcar 'rest pitches)
                   :span :pitch))

(setf lh (make-omn :length '(e.)
                   :pitch (mclist (mapcar 'first pitches))
                   :span :pitch))

(ps 'gm
    :p (list (pitch-transpose 12 rh) lh)
    :time-signature '(3 8)
    :tempo 96
    )
Opusmodus                                                                                                                                                  collect-stream   3


                    = 96
                                          2                                    3                         4                              5




       Piano




               6
                                              7                            8                  9                         10                        11




       Pno.




               12
                                13                          14                     15                              16                            17




       Pno.




               18
                                     19                               20                      21                             22                       23




       Pno.




               24
                           25                     26                       27                           28                         29                      30




       Pno.




               31
                                32                          33                      34                       35                             36




       Pno.




               37
                                     38                          39                      40                       41                         42




       Pno.




               43
                           44                          45                  46                      47                             48              49




       Pno.




                                                                                                                                                                Opusmodus
Opusmodus                                                 collect-stream   4


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
Opusmodus                                                 collect-stream   5


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

(collect-stream :pitch (list vn1 vn2 vla vlc))
=> (d4 eb4 cs5 cs5 c4 gb4 ab4 a3 b3 bb5 a3 b3 e5 a3 b3 fs2 f4
    a3 b3 g4 fs2 eb4 e2 e4 d5 bb3 d5 eb4ab4 f5 c4 c5 gs3e4
    a2f3 bb4 cs3fs3 d4 f6 g2 fs4 g2 b5 cs3fs3 bb4 a6 fs6
    c2b2 g5 gs4 e5 f5 gs5 eb5 f4 db3c4 b3 c4 cs5fs5 b3 gs3
    g3 a4 d4 g3 g3 f3ds4 b3fs4 a3gs4 c3cs4 g3 eb6 g3 g3
    gb4 f5 bb5 e5 bb4 b2 g3fs4 cs2fs2 cs2fs2 c5)

(collect-stream :interval (list vn1 vn2 vla vlc))
=> (1 10 0 -13 6 2 -11 2 23 -25 2 17 -19 2 -17 23 -8 2 8 -25
    21 -23 24 10 -16 16 (-11 5) 9 -17 12 (-16 8) (-19 8) 17
    (-21 5) 8 27 -46 23 -23 40 (-34 5) 16 23 -3 (-54 11) 32
    -11 8 1 3 -5 -10 (-16 11) -1 1 (13 5) -19 -3 -1 14 -7 -7
    0 (-2 10) (-4 7) (-9 11) (-20 13) -6 32 -32 0 11 11 5 -6
    -6 -23 (8 11) (-29 5) (-5 5) 30)

(collect-stream :velocity (list vn1 vn2 vla vlc))
=> (pp< pp<> pp< > pp< < mp pp pp p> pp pp > pp pp pp ppp pp
        pp pp> < ppp > p p pp < <> > p< mp pp<> pp<> > p< pp<
        pp<> pp p < sf f >p< f< < f ff ff< < fff ff fff > f f
        < sfp ff f> sffp > > mf f> p p < < > f> p > p> pp p>
        pp pp pp ppp> pp< > ppp>)

(collect-stream :articulation (list vn1 vn2 vla vlc))
=> (ten+harm+daempfer ubow+harm+ten+steg+daempfer daempfer+ubow+tie
    - daempfer+leg leg - stacc+steg stacc+steg leg stacc+steg
    stacc+steg leg stacc+steg stacc+steg tie+leg - stacc+steg
    stacc+steg leg leg - - leg tie+leg pizz+ten leg harm - arco+leg
    leg ubow+arco - - ten+harm ttrem+steg+leg ubow ten+tie steg -
    leg ten+harm - ten ten stacc+pizz - arco+leg leg ten+pizz
    d-saite+leg ten - stacc+pizz marc leg harm+arco+trem -
    stacc+pizz harm+arco+marc+leg stacc app+leg harm harm+marc+tie
    leg leg - - harm ten+arco harm+marc+tie harm d-saite+leg leg
    marc+tie - - pizz ten harm+arco+tie harm fermata+ten)
