Opusmodus                                                                     make-lyrics   1

make-lyrics text
[Function]

Arguments and Values:
text                     a string list of text.


Description:

This function converts a body of text into a lyrics format able to be processed within a
MusicXML display to ensure correct alignment of lyrics and pitch.

(setf text
        '("Als der gü-ti-ge Gott voll-en-den wollt' sein Wort,
           sandt er sein' En-gel schnell, dess Na-me
           Ga-bri-el__ __, in's ga-li-lä-isch Land."))

(setf lyrics (make-lyrics text))
=> ("Als" "der" "gü-" "ti-" "ge" "Gott" "voll-"
      "en-" "den" "wollt'" "sein" "Wort," "sandt"
      "er" "sein'" "En -" "gel" "schnell," "dess"
      "Na-" "me" "Ga-" "bri-" "el__" "__," "in's"
      "ga-" "li-" "lä-" "isch" "Land.")


Examples:
(setf soprano
      '((-h. q d4)
        (q g4 a4 b4 a4) (h g4 fermata -q a4)
        (q b4 c5 b4 a4) (h g4 fermata -q b4)
        (q d5 d5 c5 b4) (h a4 fermata -q b4)
        (q g4 c5 b4 a4) (h g4 q a4 fermata a4)
        (q b4 c5 b4 a4) (h. g4 fermata)))

(setf alto
      '((-h. q b3)
        (e e4 q g4 e fs4 g4 s fs4 e4 q fs4) (h d4 fermata -q fs4)
        (q g4 e g4 a4 a4 g4 g4 fs4) (h d4 fermata -q g4)
        (q g4 g4 e g4 fs4 q g4) (q g4 fs4 fermata - fs4)
        (e fs4 e4 g4 a4 a4 g4 g4 fs4) (q. g4 s fs4 e4 q fs4 fermata fs4)
        (q g4 g4 q. e fs4) (h. d4 fermata)))
Opusmodus                                                    make-lyrics   2

(setf tenor
      '((-h. q g3)
        (q b3 d4 d4 e d4 c4) (h b3 fermata -q d4)
        (q d4 e4 q. d4 s d4 c4) (h b3 fermata -q d4)
        (q d4 b3 c4 d4) (h d4 fermata -q b3)
        (q b3 e e4 d4 q. s d4 c4) (e b3 a3 b3 cs4 q d4 fermata d4)
        (q d4 e c4 e4 q d4 e. s c4) (h. b3 fermata)))

(setf bass
     '((-h. q g3)
       (q e3 d3 g3 d3) (h g2 fermata -q d3)
       (q g3 c3 d3 d2) (h g2 fermata -q g2)
       (q b2 g2 a2 e b2 c3) (h d3 fermata -q ds3)
       (q. e3 e fs3 q g3 d3) (h e3 q d3 fermata d3)
       (q g3 e e3 c3 q d3 d2) (h. g2 fermata)))

(setf lyrics
        '("Als der gü-ti-ge Gott voll-en-den wollt' sein Wort,
           sandt er sein' En-gel schnell, dess Na-me
           Ga-bri-el__ __, in's ga-li-lä-isch Land."))

(def-score als-der-gutige-gott
           (:title "Als der guetige Gott"
            :composer "J.S. Bach"
            :writer "Unknown"
            :key-signature '(g maj)
            :time-signature '(4 4)
            :tempo '(85)
            :layout (choir-satb-layout 'soprano 'alto 'tenor 'bass))

(soprano :omn soprano
         :text lyrics
         :channel 1
         :sound 'gm
         :program 'Voice-Oohs)

(alto :omn alto :channel 2)
(tenor :omn tenor :channel 3)
(bass :omn bass :channel 4))

Display Midi:

(display-midi (compile-score 'als-der-gutige-gott))

Display notation:

(display-musicxml 'als-der-gutige-gott)
