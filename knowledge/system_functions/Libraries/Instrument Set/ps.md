     Opusmodus                                                                              ps     1

     ps set-name &rest plist &key key-signature time-signature
                     tempo accidentals ignore-velocity ignore-tempo
                     octave-shift flexible-clef start end title output

     [Function]

     Arguments and Values:
     set-name                 instrument set name.
     key-signature            key-signature list form. The default is (c maj).
     time-signature           time-signature list form.
     tempo                    an integer or list of integers. The default is 60.
     ignore-tempo             NIL or T. The default is NIL.
     accidentals              :all :natural or :cautionary. The default is :natural.
     ignore-velocity          NIL or T. The default is NIL.
     octave-shift             NIL or T. The default is NIL.
     flexible-clef            NIL or T. The default is NIL.
     start                    NIL or bar number. The default is NIL.
     end                      NIL or bar number. The default is NIL.
     title                    NIL or string. The default is NIL.
     output                   :audition, :display-midi, :score or :live-coding.
                              The default is notation display.


     Description:

     Use this function if you are looking for a quick preview of your score or when a snippet
     (especially for education) needs a full representation of the intended notation. The PS
     function name stands for ‘Preview Score’ or ‘Preview Snippet’. In the following examples
     we use the default instrument-set library, de ned in the ‘GM Instrument Set.lisp’ le, which
     you will nd in the Library panel. How to create your own instrument-set library, you will
       nd in the DEF-INSTRUMENT-SET document.

     Instrument :treble:

     (ps 'gm
           :treble (list '((s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
                           (s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
                           (s a4 leg d5 leg cs5 leg b4 leg a4 leg g4 leg)
                           (s fs4 leg d4 leg e4 leg cs4 leg e d4)))
         :key-signature '(d maj) :time-signature '(3 8 1) :tempo 112)
fi
       fi
                                          fi
                                                                               fi
Opusmodus                                                                          ps   2

Instrument :p (piano):

(ps 'gm
    :p (list '((s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
               (s a4 leg d5 leg fs4 leg d5 leg g4 leg d5)
               (s a4 leg d5 leg cs5 leg b4 leg a4 leg g4 leg)
               (s fs4 leg d4 leg e4 leg cs4 leg e d4))
             '((e fs3 d3 e3)
               (e fs3 d3 e3)
               (e fs3 g3 a3)
               (e d3 a2 d2)))
    :key-signature '(d maj)
    :time-signature '(3 8 1)
    :tempo 112
    :title "G. Ph. Telemann, TWV 33-n.1, 1732")




Examples:

The examples below demonstrate how quickly you can preview your progress at any stage of
your work ie. voices, instrumentation etc…

(setf
 p1 '(q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf -e
      3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
 p2 '(t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc
      t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg
      eb5 3q bb5 > a4 > bb5 > e a4 pp stacc -e)
 p3 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc
      e. cs4 marc s gs4 leg q gs4 -q)
 p4 '(-q. e d4 pp q. eb5 mf e g4 q bb4 trem a4 trem)
 p5 '(q. fs3 pp 3e c3 < leg b4 < leg f4 e d3 mf s eb3 leg
      g3 leg bb3 leg a3 e fs3 leg fs3 3e gs4 > stacc
      c5 > stacc b5 > stacc t f5 pp e.. e5)
 p6 '(q cs3 pp -q t gs3 marc e.. fs3 mf leg e c3 -e
      t b3 leg f3 q.. e4 pp)
 )
Opusmodus                                                                              ps      3

Please note how the list function is used to enclose the instrument voices. The number of
voices in an instrument should not exceed the layout of a particular instrument. For example
a piano uses a two staff notation therefore the input should be a two lists in a list (list
(list right-hand) (list left-hand)).

(ps 'gm
    :p (list (list p1) (list p6)))




Instrument :b (oboe), :cl (clarinet) and :bn (bassoon):

(ps 'gm
    :ob (list p1)
    :cl (list p3)
    :bn (list p6)
    :flexible-clef t)
Opusmodus                                                                             ps   4

Brass Quintet:

(ps 'gm
    :b5 (list p1 p2 p3 p4 p5)
    :flexible-clef t)




To add controllers into an instrument use :cc keyword - see below. The controllers format is
the same as in the DEF-SCORE instance.

(ps 'gm
    :ob (list p1 :cc '(expression (gen-dynamic-controller p1))))

(ps 'gm
    :b5 (list
         (list p1 :cc '(expression (gen-dynamic-controller p1)))
         (list p2 :cc '(expression (gen-dynamic-controller p2)))
         (list p3 :cc '(expression (gen-dynamic-controller p3)))
         (list p4 :cc '(expression (gen-dynamic-controller p4)))
         (list p5 :cc '(expression (gen-dynamic-controller p5)))))
Opusmodus                                                             ps   5

(setf
 v1 '((-q e b4 b4 q e5 b4) (q cs5 b4 q. a4 s b4 a4)
      (q gs4 fs4 - e b4 a4) (q gs4 e cs5 b4 as4 fs4 q b4 tie)
      (q b4 as4 h b4) (-q e b4 b4 q e5 b4) (q cs5 b4 q. a4 s b4 a4)
      (q gs4 fs4 - e b4 a4) (q gs4 e cs5 b4 as4 fs4 q b4 tie)
      (q b4 as4 h b4) (-q e fs4 gs4 q a4 gs4) (q. cs5 e ds5 h c5)
      (-q e cs5 b4 q as4 b4) (q b4 as4 b4 e fs4 fs4)
      (q. b4 e a4 q gs4 cs5) (q c5 h cs5 q c5) (h cs5 -q e e5 b4)
      (q cs5 e gs4 a4 q. b4 e a4) (q gs4 e fs4 e4 q ds4 e4 tie)
      (q e4 ds4 h e4))

 v2 '((-h. e gs4 gs4) (q a4 e e gs4 gs4 s fs4 e4 e fs4 fs4)
      (q e4 ds4 -h) (-q e gs4 gs4 q fs4 fs4) (q fs4 fs4 h)
      (-h. e gs4 gs4) (q a4 e e gs4 gs4 s fs4 e4 e fs4 fs4)
      (q e4 ds4 -h) (-q e gs4 gs4 q fs4 fs4) (q fs4 fs4 h)
      (-q e ds4 e4 q fs4 e e4 fs4) (e gs4 fs4 gs4 a4 h gs4)
      (-q e gs4 gs4 q fs4 fs4) (q fs4 fs4 fs4 -) (-q h fs4 q e4)
      (e fs4 gs4 as4 as4 h gs4) (q gs4 e e ds4 h e4 tie)
      (q e4 e4 e ds4 e4 q fs4 tie) (e fs4 e4 ds4 e4 q b3 cs4) (h b3 b3))

 v3 '((-h. e e4 e4) (q e4 e4 cs4 b3) (q b3 b3 -h)
      (-q e e4 ds4 q cs4 ds4) (q cs4 cs4 h ds4) (-h. e e4 e4)
      (q e4 e4 cs4 b3) (q b3 b3 -h) (-q e e4 ds4 q cs4 ds4)
      (q cs4 cs4 h ds4) (-h. e e4 ds4) (e cs4 a4 gs4 fs4 h ds4)
      (-q e e4 ds4 q cs4 ds4) (e cs4 b3 q cs4 ds4 -)
      (-q e ds4 ds4 q b3 cs4) (q ds4 e4 h ds4) (q e4 e e c4 q. cs4 e d4)
      (h cs4 b3 tie) (q b3 c4 fs3 g3) (e fs3 e3 q fs3 h gs3))

 v4 '((-h. e e3 e3) (q a3 e3 fs3 ds3) (q e3 b2 -h)
      (-q q. e3 e ds3 cs3 b2) (e fs3 e3 q fs3 h b2) (-h. e e3 e3)
      (q a3 e3 fs3 ds3) (q e3 b2 -h) (-q q. e3 e ds3 cs3 b2)
      (e fs3 e3 q fs3 h b2) (-h. e cs3 ds3)
      (e e3 ds3 e3 fs3 q gs2 e gs3 fs3) (h. e3 e ds3 e3)
      (q fs3 fs2 b2 -) (-q e b2 b2 e3 ds3 cs3 b2) (e a2 gs2 q g2 h gs2)
      (h cs3 -q e cs4 gs3) (e a3 b3 q cs4 gs3 ds3) (q e3 h a2 q as2)
      (h b2 e3)))

Choir:

(ps 'gm
    :satb (list v1 v3 v3 v4)
    :key-signature '(e maj)
    :tempo 88)
Opusmodus   ps   6
     Opusmodus                                ps   7

     Oboe:

     (ps 'gm
         :ob (list v1)
         :key-signature '(e maj)
         :tempo 88)




     Two utes, clarinet and horn:

     (ps 'gm
         :fl (list v1 v2)
         :cl (list v3)
         :hn (list v4)
         :key-signature '(e maj) :tempo 88)
fl
Opusmodus   ps   8
Opusmodus                                                                      ps   9

Preview from bar 12 to 15 only:

(ps 'gm
    :fl (list v1 v2)
    :cl (list v3)
    :hn (list v4)
    :key-signature '(e maj) :tempo 88
    :start 12 :end 15)

The :output :live-coding option allows you to send the result of a PS function to
‘Live Coding Instrument’ for a live coding performance.

(progn
  (setf
   mat '((-w.)
         (h. eb4 pp q g3 -e q gs4 mf -s a5 p tie)
         (e. a5 -e q bb4 mf -s q cs5 p -s q. e5 mf -e.)
         (q cs5 p h. d5 mf -q c5 pp tie)
         (h c5 pp h. gs3 -e a4 p<)
         (h. fs5 mp q bb3 c5 p e4 mf tie)
         (h e4 -e q cs4 mp h d5 p e f4)
         (q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf -e
          3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
         (t d4 p< leg eb4 < leg g4 f leg bb4 q. a4 marc
          t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg eb5
          3q bb5 > a4 > bb5 > e a4 pp stacc -e)))

     (setf
      v1 (filter-density '(0.7 0.1 0.2 0.0 0.2 0.3 0.3) mat :type :length)
      v2 (filter-density '(0.0 0.2 0.0 0.2 0.2 0.4 0.3) mat :type :length)
      v3 (filter-density '(0.2 0.7 0.2 0.2 0.2 0.3 0.2) mat :type :length)
      v4 (filter-density '(0.0 0.2 0.2 0.7 0.2 0.2 0.7) mat :type :length))

     (setf
      vn1 (unfold 'om '(t7 dyn bti vn) v1)
      vn2 (unfold 'om '(t7 ? dyn bti vn) v2)
      vla (unfold 'om '(? ra dyn bti va) v3)
      vlc (unfold 'om '(t-12 t-5 ? a-12-12 dyn bti vc) v4))
 )

(ps 'gm :sq (list vn1 vn2 vla vlc) :tempo 68 :output :live-coding)

The option :output :score will output a DEF-SCORE form in the Listener:

(ps 'gm :sq (list vn1 vn2 vla vlc) :tempo 68 :output :score)

Audition (audio only):

(ps 'gm :sq (list vn1 vn2 vla vlc) :tempo 68 :output :audition)
Opusmodus                                                             ps   10

MIDI Player:

(ps 'gm :sq (list vn1 vn2 vla vlc) :tempo 68 :output :display-midi)
