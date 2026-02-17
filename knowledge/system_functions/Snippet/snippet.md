Opusmodus                                                                               snippet     1

HOWTO play and display Snippets:

There are two types of omn snippets. The rst one is a single voice snippet which displays
and auditions a contents of a list and a list of lists into one staff notation. The second one is
for a multi voice display. Each of the snippets has its own shortcut key. The single voice
snippet shortcut is Cmd-1 and the multi voice snippet shortcut is Cmd-2. The best way to
examine the examples below is to copy and paste the expressions into the editor le ie.
composer panel. You can stop audition at anytime by pressing Cmd-ESC keys.


Single Voice Snippet:

Select or place the mouse cursor at the end of the expression and press Cmd-1.

(setf twv33 '((s a4 d5 fs4 d5 g4 d5) (s a4 d5 fs4 d5 g4 d5)
              (s a4 d5 cs5 b4 a4 g4) (s fs4 d4 e4 cs4 e d4)))

(G. Ph. Telemann, 12 Fantasie per clavicembalo TWV 33, n.1, 1732)

(setf straw '((s d5f5b5 f e5g5c6 e f5a5d6 s g5b5e6 f5a5d6 e5g5c6 d5f5b5)
              (e c5e5a5 c5e5a5 q d5f5b5 marc)
              (s d5f5b5 e5g5c6 f5a5d6 g5b5e6 e f5a5d6 s e5g5c6 d5f5b5)
              (e c5e5a5 c5e5a5 q d5f5b5 marc)))

(I. Strawinsky, Petruschka, 1911/21)

Single Voice default parameters:
(defparameter *audition-tempo* 120)
(defparameter *audition-length* 1/4)
(defparameter *audition-pitch* 'c4)
(defparameter *audition-velocity* 'mf)
(defparameter *audition-ignore-ports* t)
(defparameter *audition-sound* 'gm)
(defparameter *audition-channel* 1)
(defparameter *audition-program* 0)
(defparameter *audition-volume* 92)
(defparameter *audition-port* 0)

The default ‘Audition’ parameters will allow you to make changes to the ‘Preferences/
Audition’ parameters without the need to open the window each time you make a change to
port, channel, sound or program. Using the ‘Audition’ parameters as a part of the code will
help you in your work ow. This possibility is useful for demonstrations and presentations.
                    fl
                                          fi
                                                                               fi
Opusmodus                                                                            snippet   2

(progn ; Cello
  (defparameter *audition-tempo* 72)
  (defparameter *audition-velocity* 'f)
  (defparameter *audition-sound* 'gm)
  (defparameter *audition-channel* 7)
  (defparameter *audition-program* 'cello)
  (defparameter *audition-volume* 100)
)

(setf cello
      '(((leg s g2 mf e3 b3 a3 b3 g3 fs3 g3)
         (leg e3 g3 dig2 fs3 g3 b2 > dig1 d3 > cs3 > b2 >))
        ((leg s cs3 p dig3 g3 dig2 a3 sul g3 dig2 a3 g3 a3 g3)
         (leg cs3 g3 a3 g3 a3 g3 a3 g3))
        ((leg s fs3 p< dig1 a3 < sul d4 < cs4 d4 mf a3 dig4 g3 a3 fs3)
         (leg a3 g3 a3 d3 > sul fs3 > dig3 e3 > d3 >))
        ((leg s e2 p dig1 b2 g3 fs3 g3 b2 g3 b2)
         (leg e2 b2 g3 fs3 g3 b2 g3 b2))))

(J. S. Bach, Sechs Suiten Sonaten fuer Violoncello solo, Suite I, Preludium, 1722)

(progn ; Piano
  (defparameter *audition-tempo* 98)
  (defparameter *audition-velocity* 'f)
  (defparameter *audition-sound* 'gm)
  (defparameter *audition-channel* 1)
  (defparameter *audition-program* 'Acoustic-Grand-Piano)
  (defparameter *audition-volume* 100)
)

(setf ch10.5
      '((3e gb6 bb6 db6 gb6 eb6 gb6 db6 gb6 bb5 db6 gb5 bb5)
        (3e gb5 bb5 db5 gb5 eb5 gb5 db5 gb5 bb4 db5 gb4 bb4)
        (3e db4 db5 ab4 db5 ab4 ab5 ab4 ab5 eb5 ab5 eb5 eb6)
        (3e eb5 eb6 ab5 eb6 ab5 ab6 ab5 ab6 db6 ab6 db6 db7)))

(F. Chopin, Etudes, Op. 10, No. 5, 1833)

To send the snippet to a port you need to set the *audition-ignore-ports* to NIL
and set the *audition-port* to a number of your virtual instrument port:

(progn ;; Violin
  (defparameter *audition-tempo* 120)
  (defparameter *audition-velocity* 'mf)
  (defparameter *audition-ignore-ports* nil)
  (defparameter *audition-sound* 'vsl-violin)
  (defparameter *audition-channel* 1)
  (defparameter *audition-program* 0)
  (defparameter *audition-volume* 100)
  (defparameter *audition-port* 1)
  )
Opusmodus                                                                            snippet   3

Multi Voice Snippet:

Select or place the mouse cursor at the end of the expression and press Cmd-2.
This snippet is very useful in sketching and testing the progress of your work ie.
instrumentation, voice density etc…

(setf omn1 '((q g4 g4 f4 g4) (q eb4 eb4 eb4 d4)))

(setf omn2 '(((q g4 g4 f4 g4) (q eb4 d4 d4 eb4))
             ((q eb4 eb4 eb4 d4) (e d4 c4 c4 b3 h c4))))

(setf p1 '(q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf -e
           3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
      p2 '(t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc
           t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg
           eb5 3q bb5 > a4 > bb5 > e a4 pp stacc -e)
      p3 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc
           e. cs4 marc s gs4 leg q gs4 -q)
      p4 '(q. fs3 pp 3e c3 < leg b4 < leg f4 e d3 mf s eb3 leg
           g3 leg bb3 leg a3 e fs3 leg fs3 3e gs4 > stacc
           c5 > stacc b5 > stacc t f5 pp e.. e5)
      p5 '(-q. e d4 pp q. eb5 mf e g4 q bb4 trem a4 trem)
      p6 '(q cs4 pp -q t gs4 marc e.. fs4 mf leg e c4 -e
           t b4 leg f4 q.. e4 pp)
      p7 '(-q e d4 leg eb4 h g4 mf leg q. g4 > -e)
      p8 '(s bb3 pp leg a3 h. db3 t gs4 mp fs3 < c5 < b3 q f4 marc e4)
      )

(setf omn3 (list p1 p2 p3 p4))
Opusmodus                                             snippet   4

(setf pre (rnd-sample 12 '(1 2 3 4 5 6 7 8)))
(setf sec (assemble-section 'p pre))

(setf omn4 (pitch-variant select :variant '?))

(setf pre1 (rnd-sample 12 '(1 2 3 4 5 6 7 8)))
(setf sec1 (assemble-section 'p pre1))
(setf pre2 (rnd-sample 12 '(1 2 3 4 5 6 7 8)))
(setf sec2 (assemble-section 'p pre2))

(setf omn5 (list (pitch-variant sec1 :variant '?)
                 (pitch-variant sec2 :variant '?)))
