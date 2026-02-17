Opusmodus                                                                             choralis   1

choralis chords &key index path rotation ambitus interval
               time-signature set methods edit seed

[Function]

Arguments and Values:
chords                          omn-form list (one chord list). Chord size: minimum 3, maximum 4.
index                           voice index (name).
path                            closest path. relative, comparative or '? (at random).
                                The default is NIL (closest).
rotation                        chord-inversion. An integer or '? (at random: 1 -1 2 -2).
                                The default is NIL.
ambitus                         ambitus list, (<bass><tenor><alto><soprano>.
                                The default is '((-20 5) (-10 9) (-7 14) (2 21)).
interval                        max interval step. The default is 6.
time-signature                  time signature. The default is '(4 4).
set                             'om or user de ned def-unfold-set. The default is 'om.
methods                         unfold-method names, Form: (<method><bar-number><event-number>).
                                The default is NIL.
edit                            bar replacement with given events. (<omn-form><bar-number>).
                                The default is NIL.
seed                            NIL or an integer. The default is NIL.


Description:

The function CHORALIS returns four voice polyphony (soprano, alto, tenor and bass) by
sorting the voices and taking the closest path to the previous chord. There are three path
options: :closest, :relative and :comparative.

The ambitus for each voice can be de ned with the :ambitus option. The default
ambitus for bass is (-20 5), for tenor (-10 9), for alto (-7 14) and for soprano (2
21). The ambitus form is: '((-20 5) (-10 9) (-7 14) (2 21)) or '(bass
tenor alto soprano).

The :interval option, de nes the largest interval step in a voice.

Each of the voices can be modi ed by :methods which are de ned in the DEF-UNFOLD-
SET library. The method symbols are method names used in the UNFOLD function. The
default set 'om can be found in the "Library/Default-Unfold-Sets" library.
                      fi
                           fi
                                      fi
                                           fi
                                                               fi
Opusmodus                                                                        choralis    2

The methods can be applied to a bar and events:

Transposition 6 applied to 6th bar:

(t5 6)

Transposition -12 applied to 4th bar, events 1 and 2 only:

(t-12 4 (1 2))

The :edit option allows to replace the entire bar with a new events. This option is useful
for creating a melodic movement in a voice.

Number of chords in a omn-form should be one:

(h g4b4d5)

To repeat a voice polyphony we add an additional length value:

(q e4g4b4 q)
(q g4bb4d5 q q q)

Examples:

I.
(setf chords
      '((w c4e4g4) (h g4b4d5) (h c4e4g4) (-h) (q e4g4b4 q)
        (q a4c5e5 mp leg q leg) (q g4b4d5 leg) (q f4a4c5) (w d4f4a4)
        (w a4cs5e5 mf) (-q) (q d4f4a4 q q) (q a4c5e5) (h c4e4g4)
        (h d4f4a4) (q d4fs4a4 leg q leg q) (h g4b4d5 h) (-q)
        (q bb4d5f5 q q) (w eb4g4bb4) (-q) (q c4eb4g4 q) (q g4bb4d5)
        (h c4eb4g4) (h bb4d5f5) (w f4a4c5 h) (-q) (q d4fs4a4)
        (q g4bb4d5 q q q) (h d4fs4a4 h) (-q) (q g4bb4d5) (h c4eb4g4)
        (h g4bb4d5) (h d4fs4a4 h) (h. g4bb4d5) (-q) (w g4bb4d5)
        (h d4f4a4 h) (-q) (q a4c5e5) (q a4c5e5) (q a4c5e5)
        (h c4eb4g4) (h c4eb4g4) (h g4bb4d5) (q g4bb4d5) (q g4bb4d5)
        (h d4f4a4) (h d4f4a4) (-q) (q d4f4a4 mf) (q a4c5e5 f)
        (q d4f4a4 p) (h. b4d5fs5 p) (q d4f4a4 mp) (q f4a4c5 q q q)
        (w e4g4b4) (h a4c5e5) (-h) (h d4fs4a4) (q d4fs4a4 q)
        (h g4b4d5) (h g4b4d5) (h e4g4b4) (q e4g4b4) (q e4g4b4)
        (h. c4e4g4) (q c4e4g4) (h f4a4c5) (q f4a4c5) (q bb4d5f5)
        (h. g4b4d5) (q c4e4g4) (h a4cs5e5) (h d4f4a4) (q g4b4d5)
        (q d4fs4a4) (w g4b4d5 p) (w g4b4d5 pp)))

(choralis chords :index 'v)

(ps 'gm :satb (list v1 v2 v3 v4) :flexible-clef nil :tempo 60)
Opusmodus                                                                                                                                                   choralis         3


             = 60
                         2              3                  4                            5    6         7                   8                  9              10

 Soprano




      Alto




  Tenor




      Bass




      11
                    12             13                 14                 15        16            17         18                 19                 20        21

 S.




 A.




 T.




 B.




      22
                         23                 24                 25                  26             27             28                 29                 30

 S.




 A.




 T.




 B.




      31
               32             33                 34                 35        36            37         38             39                 40            41    42

 S.




 A.




 T.




 B.



                                                                                                                                                                 Opusmodus
Opusmodus                                            choralis   4

II.
Example with :edit option:

(progn
  (choralis
   '((w a4c5e5 p<)
     (w g4bb4db5 mp< :r 3)
     (q a4c5eb5 < :r 15)
     (q a4c5eb5 f)
     (q a4c5eb5 > :r 16)
     (w e4g4bb4 > :r 2)
     (w a4c5e5 pp :r 2))
   :rotation '?
   :path 'relative
   :index 'voice
   :methods '(:soprano dyn
               :alto dyn
               :tenor dyn
               :bass dyn)
   :edit '(:alto ((q as4 p c5 f4 e4) 2)
            :tenor ((q as4 p c5 eb5 as4) 3)
            :bass ((q a3 p c4 f3 eb3) 4))
   :seed 45)

  (ps 'gm :satb (list voice1 voice2 voice3 voice4)
      :time-signature '(4 4)
      :flexible-clef nil
      :tempo 60)
  )
Opusmodus                                                             choralis      5


             = 60
                    2       3        4        5        6         7

 Soprano




      Alto




  Tenor




      Bass




      8
                        9       10       11       12   13   14   15    16

 S.




 A.




 T.




 B.



                                                                        Opusmodus




Relevant Functions
---------------------------------------------------------
GEN-CHORALIS
UNFOLD
CLOSEST-PATH
COMPARATIVE-CLOSEST-PATH
RELATIVE-CLOSEST-PATH

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Choralis/
Documentation/3. How-to/Unfold/
