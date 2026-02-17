Opusmodus                                                                            micropolyphony       1

micropolyphony voices events min max &key start unique direction
                         direction-start intervals quantize index
                         interval-prob length-prob proportional span seed

[Function]

Arguments and Values:
voices                   an integer (number of voices).
events                   an integer (number of events).
min                      a minimum length value.
max                      a maximum length value.
start                    a pitch or integer ( rst pitch). The default is 0.
unique                   T or NIL. The default is T (generate unique intervals for every voice).
direction                NIL or a list of integers (interval direction). The default is NIL (original).
direction-start          'a (up), 'd (down) or NIL. The default is NIL (original).
intervals                a list of intervals. The default is '(-2 -1 1 2).
quantize                 a list of integers (tuplet values). The default is '(1 2 4).
index                    voice index name (variables).
interval-prob            a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
length-prob              a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
proportional             T or NIL. The default is NIL.
span                     NIL or an integer (number of bars). The default is NIL.
seed                     an integer or NIL. An integer ensures the same result each time the code
                         is evaluated. The default is NIL.


Description:

MICROPOLYPHONY is a polyphonic musical texture developed by György Ligeti which
consists of many lines of dense canons moving at different tempos or rhythms, thus resulting
in tone clusters vertically. According to David Cope, ‘micropolyphony resembles cluster
chords, but differs in its use of moving rather than static lines’; it is ‘a simultaneity of
different lines, rhythms, and timbres’.


Examples:

An expression like (micropolyphony 4 8 1/4 3) can be read as follows:

(micropolyphony
 4    ; 4 voices
 8    ; 8 events for every voice
 1/4 ; 1/4 minimum length
 3    ; 3 maximum length
 )
                    fl
                    fl
                                    fi
Opusmodus                                                            micropolyphony   2

(setf inst (micropolyphony 4 8 1/4 3))
=> ((dq c4 19/8 bb3 dh. b3 h... cs4 w c4 h.. cs4 ds b3 ds cs4 -e. c4)
    (wh... c4 wqs d4 hs c4 dh.s bb3 w. c4 dh d4 we. eb4 whe. d4)
    (he c4 dqs bb3 hs gs3 21/8 a3 17/8 g3 h f3 h. fs3 h g3)
    (qs c4 qs d4 qs e4 h eb4 w. cs4 wq. c4 wq cs4 wqe. d4))

With PS (Preview Score) we can test and hear the result:

(ps 'gm
    :fl (list (1~ inst))
    :ob (list (2~ inst))
    :cl (list (3~ inst))
    :hn (list (pitch-transpose -12 (4~ inst)))
    :time-signature '(4 4)
    :tempo 54
    :start 1 :end 8)

In the next example we de ne a list of :intervals: '(-2 -1 1 2 -.5 .5 1.5
-1.5 -.25 .25 1.25 -1.25), with a :start pitch for every voice: '(0 .5 1
1.5 -.5 -1 -1.5 2) and de ne the :index name to 'v. The :index option will
assign each voice to a variable (v1 v2 v3 v4 v5 v6 v7 v8). The :quantizer
here is set to '(1 2 4 5):

(micropolyphony
 8 20 1/4 3
 :intervals '(-2 -1 1 2 -.5 .5 1.5 -1.5 -.25 .25 1.25 -1.25)
 :quantize '(1 2 4 5)
 :start '(0 .5 1 1.5 -.5 -1 -1.5 2)
 :index 'v)
=> (v1 v2 v3 v4 v5 v6 v7 v8)

In this score we use CHOIR-SATB-LAYOUT with two list events for each voice:

(def-score micro-2
           (:key-signature 'chromatic
            :time-signature '(4 4) :tempo 54
            :layout (choir-satb-layout
                     (list 'sop1 'sop2) (list 'alto1 'alto2)
                     (list 'tenor1 'tenor2) (list 'bass1 'bass2)))

  (sop1 :omn (ambitus 'soprano v1)
        :channel 1 :sound 'gm :program 'Choir-Aahs)
  (sop2 :omn (ambitus 'soprano v1) :channel 2)
  (alto1 :omn (ambitus 'alto v3) :channel 3)
  (alto2 :omn (ambitus 'alto v3) :channel 4)
  (tenor1 :omn (ambitus 'tenor v5) :channel 5)
  (tenor2 :omn (ambitus 'tenor v5) :channel 6)
  (bass1 :omn (ambitus 'bass v7) :channel 7)
  (bass2 :omn (ambitus 'bass v8) :channel 8))
                   fi
                           fi
Opusmodus                                                             micropolyphony   3

In the following score we set the minimum length to 1/16 and the maximum length to 1/4:

(micropolyphony
 8 20 1/16 1/4
 :intervals '(-2 -1 1 2 -.5 .5 1.5 -1.5 -.25 .25 1.25 -1.25)
 :quantize '(1 2 4 5)
 :start '(c4 c4+ fs3 as2+ b3+ b3 e3+ c3)
 :index 'vox)

(def-score micro-3
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 54
            :accidentals :all
            :layout (choir-satb-layout
                      (list 'sop1 'sop2)
                      (list 'alto1 'alto2)
                      (list 'tenor1 'tenor2)
                      (list 'bass1 'bass2))
            :start 1 :end 3)

  (sop1 :omn (ambitus 'soprano vox1)
        :channel 1 :sound 'gm :program 'Choir-Aahs)
  (sop2 :omn (ambitus 'soprano vox2) :channel 2)
  (alto1 :omn (ambitus 'alto vox3) :channel 3)
  (alto2 :omn (ambitus 'alto vox4) :channel 4)
  (tenor1 :omn (ambitus 'tenor vox5) :channel 5)
  (tenor2 :omn (ambitus 'tenor vox6) :channel 6)
  (bass1 :omn (ambitus 'bass vox7) :channel 7)
  (bass2 :omn (ambitus 'bass vox8) :channel 8)
  )

In the ‘micro-4’ score we overwrite the interval :directions and add a :direction-
start value for each voice:

(setf voices
      (micropolyphony
        8 20 1/4 3
        :intervals '(-2 -1 1 2 -.5 .5 1.5 -1.5 -.25 .25 1.25 -1.25)
        :quantize '(1 2 4 5)
        :direction '((12 8) (8 12) (12 8) (8 12)
                     (12 8) (8 12) (12 8) (8 12))
        :direction-start '(a d a d a a d a)
        :start '(c4 c4+ fs3 as2+ b3+ b3 e3+ c3)
        )
      )
Opusmodus                                                              micropolyphony   4

(def-score micro-4
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 54
            :accidentals :all
            :layout (choir-satb-layout
                      (list 'sop1 'sop2)
                      (list 'alto1 'alto2)
                      (list 'tenor1 'tenor2)
                      (list 'bass1 'bass2))
            :start 1 :end 32)

     (sop1 :omn (ambitus 'soprano (1~ voices))
           :channel 1 :sound 'gm :program 'Choir-Aahs)
     (sop2 :omn (ambitus 'soprano (2~ voices)) :channel 2)
     (alto1 :omn (ambitus 'alto (3~ voices)) :channel 3)
     (alto2 :omn (ambitus 'alto (4~ voices)) :channel 4)
     (tenor1 :omn (ambitus 'tenor (5~ voices)) :channel 5)
     (tenor2 :omn (ambitus 'tenor (6~ voices)) :channel 6)
     (bass1 :omn (ambitus 'bass (7~ voices)) :channel 7)
     (bass2 :omn (ambitus 'bass (8~ voices)) :channel 8)
     )

In the nal example we use a sequence of four interval lists and an :interval-prob
(probability) value for each voice:

'((0) (1 -1 2 -2) (6 -6 11 -11) (13 -13))
:interval-prob '(.2 .2 .3 .9)

The :length-prob value will return a unique list of lengths for each of the 4 voices
depending on the probability value. The length round 1/16 and 1/2 is divided into 40
(events) proportional values:

(0.294 0.338 0.382 0.426 0.47 0.514 0.55799997 0.602 0.646
 0.69 0.73399997 0.778 0.822 0.866 0.90999997 0.954 0.998
 1.042 1.086 1.13 1.174 1.2179999 1.262 1.306 1.35 1.394
 1.438 1.482 1.526 1.5699999 1.614 1.658 1.702 1.746 1.79
 1.834 1.878 1.9219999 1.966 2.01)

The :length-prob '(.2 .9 .4 .9) returns:

((1.966 1.13 0.55799997 0.47 0.47 0.294 0.426 0.338 1.086 1.394 0.954
1.262 0.55799997 1.2179999 0.55799997 1.042 1.042 1.262 1.526 1.042
0.998 0.866 0.646 0.55799997 0.47 0.954 1.834 0.426 0.998 0.954 0.426
0.55799997 0.73399997 1.13 0.294 0.73399997 1.042 0.294 0.69 0.73399997)
fi
Opusmodus                                                   micropolyphony   5

(1.35 1.482 1.394 1.834 1.966 1.834 1.526 1.614 1.746 1.966 1.614 1.834
1.966 1.614 0.426 1.526 2.01 1.526 1.2179999 1.394 1.702 1.394 1.35
1.306 1.13 1.394 1.2179999 1.966 1.658 1.614 1.526 1.526 1.79 1.394
1.614 1.482 1.526 1.394 1.438 1.79)

(0.602 1.174 0.822 1.174 1.79 0.426 1.086 1.9219999 0.514 0.514 0.47
1.086 1.746 1.174 1.746 1.042 0.294 0.866 0.778 1.702 0.822 1.13
0.90999997 1.394 1.878 0.69 0.514 0.69 0.866 1.042 1.966 1.702 1.5699999
1.042 0.55799997 1.35 0.602 1.614 1.262 0.646)

(1.658 1.834 1.394 1.394 1.966 1.746 1.394 1.658 1.9219999 1.5699999
1.262 2.01 1.834 1.174 1.878 1.438 1.042 1.35 1.746 1.614 1.966 1.746
1.438 1.306 1.2179999 1.5699999 1.5699999 1.262 1.174 1.526 1.5699999
2.01 1.526 1.746 1.35 1.13 1.482 2.01 1.35 1.5699999))

The result (bars) is controlled by the :span number:

(setf interval-series '((0) (1 -1 2 -2) (6 -6 11 -11) (13 -13)))

(micropolyphony
 4
 40
 1/16 1/2
 :intervals interval-series
 :interval-prob '(.2 .2 .3 .9)
 :length-prob '(.2 .9 .4 .9)
 :proportional t
 :index 'b
 :seed 855650
 :span 6
 )


Relevant Examples
---------------------------------------------------------
Documentation/3. How-To/Micropholyphony
