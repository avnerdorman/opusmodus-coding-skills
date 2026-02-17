Opusmodus                                                                                   text-map   1

text-map map text &key flat rnd-order otherwise seed
[Function]

Arguments and Values:
map                      a list of lists (<letter><symbol>)
text                     a string, a string list list of a list of letters.
flat                     T or NIL. The default is T.
rnd-order                T or NIL. The default is NIL.
otherwise                NIL, symbol or list of symbols. The default is NIL.
seed                     an integer - ensure the same result each time the code is evaluated.
                         The default is NIL.


Description:

This function converts a body of text into any symbol (parameter). It’s a further way to use
words ("text")or a list of letters to create parametric material. Notice, that the function
creates lists for each word and that punctuation is ignored. In the following examples we will
map a text to integers. First we create a map:

(defparameter *map-integer1*
  '(((a à á â ã ä å æ ą) 0)
    (b 1)
    ((c ç ć) 2)
    (d 3)
    ((e è é ê ë ę) 4)
    (f 5)
    (g 6)
    (h 7)
    ((i ì î ï) 8)
    (j 9)
    (k 10)
    ((l ł) 11)
    (m 12)
    ((n ñ ń) 13)
    ((o ò ó ô õ ö) 14)
    (p 15)
    (q 16)
    (r 17)
    ((s ś ß) 18)
    (t 19)
    ((u ù ú û ü) 20)
    (v 21)
    (w 22)
    (x 23)
    ((y ý ÿ) 24)
    ((z ż ź) 25)))
Opusmodus                                                                         text-map      2


(setf text '("To be, or not to be, that is the question"))

(text-map *map-integer1* text)
=> ((19 14) (1 4) (14 17) (13 14 19) (19 14) (1 4)
    (19 7 0 19) (8 18) (19 7 4) (16 20 4 18 19 8 14 13))

In the following map each letter is mapped into a list of two integer values. The letter (a à
á â ã ä å æ ą) is mapped to 0 and -12. Every time the letter (a à á â ã ä å æ
ą) is processed, 0 or -12 integer is picked at random.

(defparameter *map-integer2*
  '(((a à á â ã ä å æ ą) (0 -12))
    (b (1 -1))
    ((c ç ć) (2 -2))
    (d (3 -3))
    ((e è é ê ë ę) (4 -4))
    (f (5 -5))
    (g (6 -6))
    (h (7 -7))
    ((i ì î ï) (8 -8))
    (j (9 -9))
    (k (10 -10))
    ((l ł) (11 -11))
    (m (12 -12))
    ((n ñ ń) (13 -13))
    ((o ò ó ô õ ö) (14 -14))
    (p (15 -15))
    (q (16 -16))
    (r (17 -14))
    ((s ś ß) (18 -18))
    (t (19 -19))
    ((u ù ú û ü) (20 -20))
    (v (21 -21))
    (w (22 -22))
    (x (23 -23))
    ((y ý ÿ) (24 -24))
    ((z ż ź) (25 -25))))

(text-map *map-integer2* text)
=> ((19 -14) (-1 -4) (14 17) (-13 -14 -19) (-19 -14)
    (1 4) (19 7 0 -19) (-8 18) (19 -7 -4)
    (-16 20 -4 -18 19 8 -14 -13))

(text-map *map-integer2* text)
=> ((-19 14) (1 -4) (-14 17) (13 14 19) (19 14)
    (1 4) (19 7 0 19) (8 18) (19 -7 -4)
    (16 20 4 18 -19 8 -14 -13))
Opusmodus                                                                     text-map   3

A :seed will ensure the same result each time the code is evaluated:

(text-map *map-integer2* text :seed 48)
=> ((19 -14) (1 -4) (14 -14) (-13 -14 19) (19 -14)
    (-1 4) (19 7 -12 -19) (8 18) (-19 -7 4)
    (16 -20 -4 18 19 -8 -14 -13))

In the following examples we map a text to lengths. If a letter is mapped to a nested list
((e e. s)) then the entire list is selected.

(defparameter *map-length*
  '(((a à á â ã ä å æ ą) ((s s s)))
    (b ((s e s)))
    ((c ç ć) ((e s s)))
    (d ((s s e)))
    ((e è é ê ë ę) ((e e. s)))
    (f ((q e. s)))
    (g ((e. e s)))
    (h ((q s s)))
    ((i ì î ï) ((s e. e)))
    (j ((s e. e)))
    (k ((s s q)))
    ((l ł) ((e s e.)))
    (m ((e e e)))
    ((n ñ ń) ((e q e)))
    ((o ò ó ô õ ö) ((q e e)))
    (p ((e e q)))
    (q ((q q. e)))
    (r ((h q. e)))
    ((s ś ß) ((q e q.)))
    (t ((h e e)))
    ((u ù ú û ü) ((e q. q)))
    (v ((q. e h)))
    (w ((e e h)))
    (x ((q e q.)))
    ((y ý ÿ) ((q q q)))
    ((z ż ź) ((q h q)))))

(text-map *map-length* text)
=> ((h e e q e e) (s e s e e. s) (q e e h q. e)
    (e q e q e e h e e) (h e e q e e) (s e s e e. s)
    (h e e q s s s s s h e e) (s e. e q e q.)
    (h e e q s s e e. s)
    (q q. e e q. q e e. s q e q. h e e s e. e q e e e q e))

(text-map *map-length* text :flat nil)
=> ((h e e) (q e e) (s e s) (e e. s) (q e e) (h q. e)
    (e q e) (q e e) (h e e) (h e e) (q e e) (s e s) (e e. s)
    (h e e) (q s s) (s s s) (h e e) (s e. e) (q e q.) (h e e)
    (q s s) (e e. s) (q q. e) (e q. q) (e e. s) (q e q.)
    (h e e) (s e. e) (q e e) (e q e))
Opusmodus                                                                    text-map   4

With the :rnd-order option we can randomise the order of the elements in the list:

(text-map *map-length* text :flat nil :rnd-order t)
=> ((h e e) (q e e) (s e s) (s e. e) (e e q) (h e q.)
    (e q e) (e q e) (h e e) (h e e) (e q e) (s e s) (s e e.)
    (e h e) (q s s) (s s s) (e e h) (e. e s) (q. q e) (e h e)
    (s q s) (s e e.) (q. e q) (q. e q) (s e e.) (q q. e)
    (e h e) (s e e.) (e q e) (e e q))

In the following examples we map text to pitches.
First we create a simple map with a letter mapped to a single pitch:

(defparameter *map-pitch1*
  '(((a à á â ã ä å æ ą) c3)
    (b cs3)
    ((c ç ć) d3)
    (d eb3)
    ((e è é ê ë ę) e3)
    (f f3)
    (g fs3)
    (h g3)
    ((i ì î ï) gs3)
    (j a4)
    (k bb3)
    ((l ł) b3)
    (m c4)
    ((n ñ ń) cs4)
    ((o ò ó ô õ ö) d4)
    (p eb4)
    (q e4)
    (r f4)
    ((s ś ß) fs4)
    (t g4)
    ((u ù ú û ü) gs4)
    (v a4)
    (w bb4)
    (x b4)
    ((y ý ÿ) c5)
    ((z ż ź) cs5)))

(text-map *map-pitch1* text)
=> ((g4 d4) (cs3 e3) (d4 f4) (cs4 d4 g4) (g4 d4)
    (cs3 e3) (g4 g3 c3 g4) (gs3 fs4) (g4 g3 e3)
    (e4 gs4 e3 fs4 g4 gs3 d4 cs4))
Opusmodus                                                   text-map   5

Here we map a letter to a list of two pitches:

(defparameter *map-pitch2*
  '(((a à á â ã ä å æ ą) (c4 c3))
    (b (cs4 b3))
    ((c ç ć) (d4 bb3))
    (d (eb4 a3))
    ((e è é ê ë ę) (e4 gs3))
    (f (f4 g3))
    (g (fs4 fs3))
    (h (g4 f3))
    ((i ì î ï) (gs4 e3))
    (j (a4 eb3))
    (k (bb4 d3))
    ((l ł) (b4 cs3))
    (m (c5 c3))
    ((n ñ ń) (cs5 b2))
    ((o ò ó ô õ ö) (d5 bb2))
    (p (eb5 a2))
    (q (e5 gs2))
    (r (f5 g2))
    ((s ś ß) (fs5 fs2))
    (t (g5 f2))
    ((u ù ú û ü) (gs5 e2))
    (v (a5 eb2))
    (w (bb5 d2))
    (x (b5 cs2))
    ((y ý ÿ) (c6 c2))
    ((z ż ź) (cs6 b1))))

(text-map *map-pitch2* text)
=> ((g5 bb2) (b3 e4) (bb2 f5) (b2 d5 f2) (f2 d5) (b3 gs3)
    (f2 f3 c4 f2) (gs4 fs5) (g5 g4 gs3)
    (gs2 gs5 gs3 fs2 f2 gs4 bb2 cs5))
Opusmodus                                        text-map   6

Example with a velocity map:

(defparameter *map-velocity*
  '(((a à á â ã ä å æ ą) ppp)
    (b ppp)
    ((c ç ć) ppp)
    (d pp)
    ((e è é ê ë ę) pp)
    (f pp)
    (g p)
    (h p)
    ((i ì î ï) p)
    (j mp)
    (k mp)
    ((l ł) mp)
    (m mf)
    ((n ñ ń) mf)
    ((o ò ó ô õ ö) mf)
    (p f)
    (q f)
    (r f)
    ((s ś ß) ff)
    (t ff)
    ((u ù ú û ü) ff)
    (v fff)
    (w fff)
    (x fff)
    ((y ý ÿ) ffff)
    ((z ż ź) ffff)))

(text-map *map-velocity* '(o p u s m o d u s))
=> (mf f ff ff mf mf pp ff ff)
Opusmodus                                                  text-map   7

Example with binary map:

(defparameter *map-binary*
  '(((a à á â ã ä å æ ą) ((1)))
    (b ((1 0)))
    ((c ç ć) ((1 1)))
    (d ((1 0 0)))
    ((e è é ê ë ę) ((1 0 1)))
    (f ((1 1 0)))
    (g ((1 1 1)))
    (h ((1 0 0 0)))
    ((i ì î ï) ((1 0 0 1)))
    (j ((1 0 1 0)))
    (k ((1 0 1 1)))
    ((l ł) ((1 1 0 0)))
    (m ((1 1 0 1)))
    ((n ñ ń) ((1 1 1 0)))
    ((o ò ó ô õ ö) ((1 1 1 1)))
    (p ((1 0 0 0 0)))
    (q ((1 0 0 0 1)))
    (r ((1 0 0 1 0)))
    ((s ś ß) ((1 0 0 1 1)))
    (t ((1 0 1 0 0)))
    ((u ù ú û ü) ((1 0 1 0 1)))
    (v ((1 0 1 1 0)))
    (w ((1 0 1 1 1)))
    (x ((1 1 0 0 0)))
    ((y ý ÿ) ((1 1 0 0 1)))
    ((z ż ź) ((1 1 0 1 0)))))

(text-map *map-binary* '(o p u s m o d u s))
=> ((1 1 1 1) (1 0 0 0 0) (1 0 1 0 1) (1 0 0 1 1)
    (1 1 0 1) (1 1 1 1) (1 0 0) (1 0 1 0 1) (1 0 0 1 1))

Example with otherwise option.

(setf map4
      '((e e3)
        (f f3)
        (g fs3)
        (h g3)
        (i gs3)
        (j a4)
        (k bb3)
        (l b3)
        (m c4)
        (n cs4)
        (o d4)))

(text-map map4 '(o p u s m o d u s))
=> (d4 c4 d4)
Opusmodus                                                                      text-map     8

The result of the expression above is not equal to the length of the (o p u s m o d u
s) list because the letters d, p, s and u are not in the map. Use the otherwise option to
get the same count:

(text-map map4 '(o p u s m o d u s) :otherwise '((eb4e5) (f3fs4)))
=> (d4 (eb4e5) (f3fs4) (eb4e5) c4 d4 (eb4e5) (f3fs4) (f3fs4))


Examples:

In the following examples our maps are created algorithmically:

(setf map
      (mapcar 'list
              (make-alphabet)
              (integer-to-pitch (gen-integer-step 0 26 '(1 -2 3 1)))))
=> ((a c4) (b cs4) (c b3) (d d4) (e eb4) (f e4) (g d4) (h f4)
    (i fs4) (j g4) (k f4) (l gs4) (m a4) (n bb4) (o gs4) (p b4)
    (q c5) (r cs5) (s b4) (t d5) (u eb5) (v e5) (w d5) (x f5)
    (y fs5) (z g5))

(text-map map text)
=> ((d5 gs4) (cs4 eb4) (gs4 cs5) (bb4 gs4 d5) (d5 gs4)
    (cs4 eb4) (d5 f4 c4 d5) (fs4 b4) (d5 f4 eb4)
    (c5 eb5 eb4 b4 d5 fs4 gs4 bb4))

(setf map2
      (mapcar 'list
              (make-alphabet)
              (mapcar 'list
                      (integer-to-pitch
                       (gen-integer-step 0 26 '(1 -2 3 1)))
                      (integer-to-pitch
                       (gen-integer-step -6 26 '(1 -2 3 1))))))
=> ((a (c4 fs3)) (b (cs4 g3)) (c (b3 f3)) (d (d4 gs3))
    (e (eb4 a3)) (f (e4 bb3)) (g (d4 gs3)) (h (f4 b3))
    (i (fs4 c4)) (j (g4 cs4)) (k (f4 b3)) (l (gs4 d4))
    (m (a4 eb4)) (n (bb4 e4)) (o (gs4 d4)) (p (b4 f4))
    (q (c5 fs4)) (r (cs5 g4)) (s (b4 f4)) (t (d5 gs4))
    (u (eb5 a4)) (v (e5 bb4)) (w (d5 gs4)) (x (f5 b4))
    (y (fs5 c5)) (z (g5 cs5)))

(text-map map2 text :seed 63)
=> ((d5 d4) (g3 a3) (d4 cs5) (bb4 gs4 d5) (d5 d4) (g3 a3)
    (d5 b3 c4 d5) (c4 f4) (d5 f4 eb4)
    (c5 eb5 eb4 b4 d5 c4 gs4 bb4))
Opusmodus                                                                      text-map    9

In the next example we map a group of letters to a group of pitches.
Example: a = (c4 cs4 d4) b = (c4 cs4 d4) and c = (c4 cs4 d4) etc…

(setf map3
      (mapcar 'list
              (gen-divide 3 (make-alphabet))
              (integer-to-pitch (gen-divide 3 (gen-integer 26)))))
=> (((a b c) (c4 cs4 d4)) ((d e f) (eb4 e4 f4))
    ((g h i) (fs4 g4 gs4)) ((j k l) (a4 bb4 b4))
    ((m n o) (c5 cs5 d5)) ((p q r) (eb5 e5 f5))
    ((s t u) (fs5 g5 gs5)) ((v w x) (a5 bb5 b5))
    ((y z) (c6 cs6 d6)))

(text-map map3 text)
=> ((g5 c5) (cs4 f4) (c5 f5) (cs5 d5 g5) (gs5 d5)
    (c4 f4) (fs5 gs4 d4 g5) (g4 fs5) (gs5 g4 f4)
    (e5 gs5 f4 fs5 g5 gs4 c5 d5))

=> ((gs5 c5) (c4 e4) (c5 eb5) (c5 c5 g5) (gs5 c5)
    (c4 e4) (g5 gs4 cs4 fs5) (gs4 fs5) (gs5 fs4 e4)
    (eb5 gs5 eb4 fs5 gs5 fs4 cs5 c5))

=> . . .

Creating music from pieces of text goes back to the 14C and the chansons of Guillaume de
Machaut, but has become well-known through the thematic use of the name of BACH by
Liszt and Shostakovich. Many, many composers have used the text of poems to create
musical structures from Boulez (Le Marteau sans Maitre) http://memory.loc.gov/ammem/
collections/moldenhauer/2428115.pdf to Keith Jarrett (Re ections).
                                                 fl
Opusmodus                                                                   text-map   10

More Examples:
(setf to-be-or-not-to-be
      "To be, or not to be, that is the question—
       Whether 'tis Nobler in the mind to suffer
       The Slings and Arrows of outrageous Fortune,
       Or to take Arms against a Sea of troubles,
       And by opposing end them? To die, to sleep—
       No more; and by a sleep, to say we end
       The Heart-ache, and the thousand Natural shocks
       That Flesh is heir to? 'Tis a consummation
       Devoutly to be wished. To die, to sleep,
       To sleep, perchance to Dream; Aye, there's the rub,
       For in that sleep of death, what dreams may come,
       When we have shuffled off this mortal coil,
       Must give us pause. There's the respect
       That makes Calamity of so long life:
       For who would bear the Whips and Scorns of time,
       The Oppressor's wrong, the proud man's Contumely,
       The pangs of despised Love, the Law’s delay,
       The insolence of Office, and the Spurns
       That patient merit of the unworthy takes,
       When he himself might his Quietus make
       With a bare Bodkin? Who would these Fardels bear,
       To grunt and sweat under a weary life,
       But that the dread of something after death,
       The undiscovered Country, from whose bourn
       No Traveler returns, Puzzles the will,
       And makes us rather bear those ills we have,
       Than fly to others that we know not of.
       Thus Conscience does make Cowards of us all,
       And thus the Native hue of Resolution
       Is sicklied o'er, with the pale cast of Thought,
       And enterprises of great pitch and moment,
       With this regard their Currents turn awry,
       And lose the name of Action. Soft you now,
       The fair Ophelia. Nymph, in all thy Orisons
       Be thou all my sins remembered.")

(text-map map2 to-be-or-not-to-be)
=> ((gs4 d4) (cs4 eb4) (d4 g4) (bb4 d4 gs4)
    (d5 gs4) (g3 a3) (d5 f4 c4 gs4) (fs4 f4)
    . . .)

The example score takes just the rst sentence of Hamlet’s soliloquy. Such a sentence is
often quite enough material on which to build a musical structure. The direct TEXT-MAP
conversion is interleaved (using GEN-COMBINE) with the PITCH-INVERT-START 'c4.
                         fi
Opusmodus                                                      text-map   11

(setf text '("To be, or not to be, that is the question"))

(setf up (text-map map2 text :seed 21))
=> ((d5 gs4) (g3 eb4) (d4 cs5) (e4 d4 d5) (d5 d4) (g3 a3)
    (d5 b3 c4 d5) (fs4 f4) (gs4 f4 a3)
    (c5 a4 eb4 b4 gs4 c4 d4 bb4))

(setf down (pitch-invert-start 'c4 up))
=> ((bb2 e3) (f4 a3) (bb3 b2) (gs3 bb3 bb2) (bb2 bb3)
    (f4 eb4) (bb2 cs4 c4 bb2) (fs3 g3) (e3 g3 eb4)
    (c3 eb3 a3 cs3 e3 c4 bb3 d3))

(chordize-list (gen-combine (flatten up) (flatten down)))
=> (d5bb2 gs4e3 g3f4 eb4a3 d4bb3 cs5b2 e4gs3 d4bb3 d5bb2
    d5bb2 d4bb3 g3f4 a3eb4 d5bb2 b3cs4 c4c4 d5bb2 fs4fs3
    f4g3 gs4e3 f4g3 a3eb4 c5c3 a4eb3 eb4a3 b4cs3 gs4e3
    c4c4 d4bb3 bb4d3)

Poem by Paul Valéry (1st strophe).

(setf text2 '("Ce toit tranquille, où marchent des colombes,
               Entre les pins palpite, entre les tombes;
               Midi le juste y compose de feux
               La mer, la mer, toujours recommencée
               O récompense après une pensée
               Qu'un long regard sur le calme des dieux!"))

(text-map map2 text2 :seed 764)
=> ((b3 a3) (gs4 gs4 fs4 gs4) (gs4 cs5 c4 bb4 fs4 eb5 fs4 gs4 d4 a3)
    (gs4) (a4 fs3 g4 b3 f4 a3 e4 gs4) (d4 eb4 b4)
    (f3 gs4 gs4 d4 eb4 g3 a3 b4) (a3 e4 gs4 cs5 a3) (gs4 a3 b4)
    (b4 fs4 bb4 b4) (b4 c4 d4 f4 c4 gs4 eb4) (a3 e4 gs4 cs5 a3)
    (gs4 eb4 b4) (d5 gs4 eb4 cs4 eb4 f4) (eb4 fs4 d4 fs4) (d4 eb4)
    (cs4 eb5 b4 d5 a3) (fs5) (b3 gs4 eb4 f4 gs4 b4 a3) (d4 eb4)
    (e4 a3 eb5 f5) (d4 c4) (a4 a3 cs5) (gs4 c4) (a4 a3 g4)
    (gs4 d4 eb5 cs4 d4 eb5 g4 b4) (cs5 a3 f3 d4 a4 eb4 eb4 e4 b3 eb4)
    (d4) (g4 b3 gs4 a4 b4 eb4 e4 b4 a3) (fs3 b4 cs5 f4) (a4 e4 a3)
    (b4 a3 bb4 f4 a3) (c5 eb5 a4 e4) (d4 gs4 e4 d4)
    (cs5 eb4 gs3 fs3 cs5 d4) (f4 eb5 g4) (gs4 eb4) (b3 fs3 d4 a4 eb4)
    (d4 a3 b4) (gs3 c4 eb4 eb5 b4))
Opusmodus                                                      text-map   12

Score Example:
(setf text '("To be, or not to be, that is the question"))
(setf up (text-map *map-pitch1* text))
(setf down (pitch-invert-start 'c4 up))

(setf sig (append
           (chord-pitch-unique
            (chordize (text-map *map-pitch1* '("William"))))
           (chord-pitch-unique
            (chordize
             (pitch-invert-start 'c4
             (text-map *map-pitch1* '("Shakespeare")))))))

(setf pitch (flatten (list (gen-combine up down) sig)))
(setf len (rnd-sample (length pitch) '(s -s e -e q)))
(setf vel (rnd-sample (length pitch) '(f p mp ff)))

(setf hseq (make-omn
            :length len
            :pitch pitch
            :velocity vel
            :span :pitch))

(def-score tobeornottobe
           (:key-signature 'chromatic
            :time-signature '(8 8)
            :tempo 120
            :layout (piano-grand-layout 'piano))

  (piano :omn hseq
         :channel 1
         :sound 'gm
         :program 0))
