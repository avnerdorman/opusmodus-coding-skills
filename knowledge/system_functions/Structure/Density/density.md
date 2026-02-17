     Opusmodus                                                                                   density   1

     density density sequence &key ratio intervals legato section exclude
     seed

     [Function]

     Arguments and Values:
     density                  a number ( oating-point number).
     sequence                 a sequence (omn-form).
     ratio                    Density ratio. The default is 1/16.
     intervals                list of intervals. The default is (-1 1 -2 2).
     legato                   T or NIL. The default is NIL.
     section                  an integer or list of integers. Selected list or lists to process.
                              The default is NIL.
     exclude                  an integer or list of integers. Excluded list or lists from process.
                              The default is NIL.
     seed                     an integer. Ensures the same result each time the code is evaluated.
                              The default is NIL.


     Description:

     The DENSITY function will increase or decrease the number of events in a sequence. It will
     allow you on the y to change the density and expression of the pattern without changing the
     original sequence span.

     (setf pattern '(e f4 e4 c4 - a4 g4 d4 - ab4 db4 eb4 - gb4 bb4 b4 -))




     To nd out the density of a sequence we call the DENSITY-ANALYSIS function:

     (density-analysis pattern :type :length)
     => 0.38

     Let’s set the density of the sequence to a 0.9 value. This will increase the number of
     events, knowing the original density is 0.38:

     (density .9 pattern :seed 45)
     => (s f4 f4 e4 t t s c4 c4 -e s a4 a4 g4 t t s d4 t t -e
         s ab4 ab4 t db4 db4 s t eb4 eb4 s -e s gb4 gb4 bb4 bb4 b4 b4 -e)
fi
                  fl
                                 fl
Opusmodus                                                                     density    2




The :intervals option allows you to de ne intervals to align with newly created lengths.

(density .9 pattern :intervals '(0 6 1 6) :seed 45)
=> (s f4 b4 e4 t bb4 e5 s c4 fs4 -e s a4 eb5 g4 t cs5 g5
    s d4 t gs4 d5 -e s gs4 d5 t cs4 g4 s t eb4 a4 s -e
    s fs4 c5 bb4 e5 b4 f5 -e)




In the next example we set the density value to 0.5:

(density .5 pattern :seed 45)
=> (e f4 s e4 e4 e c4 - a4 g4 d4 - s ab4 ab4
    e db4 s eb4 eb4 -e gb4 bb4 s b4 b4 -e)




Below is an example with a low density value 0.2. This will decrease (swallow) a
number of events from the sequence:

(density .2 pattern :seed 45)
=> (e f4 mf - c4 - a4 g4 d4 -q e db4 -h.)




The :legato option will extend the length-note with a sum of length-rests in sequence:

(density .2 pattern :seed 45 :legato t)
=> (q f4 c4 e a4 g4 q. d4 h.. db4)
                                   fi
Opusmodus                                                       density   3




Examples:
(setf sequence
      '((s eb1 p g2 cs3 f e3 mp bb3 g3 a3 b3 3h d4 eb4 d4 p)
        (3h cs4 p b3 f bb3 e a3 mf bb3 gs3 g3)
        (q g3 pp 3h gs3 3q q bb3 5h mp b3 5q c4 p tie)
        (5q c4 p 5h b3 b3 q bb3 mp e bb3 a3 5h. a3 5h gs3 p)
        (q gs3 mf 5h. gs3 5h g3 5q g3 g3 fs3 fs3 mp f3 s f3 - f3 =)))




Original density:

(density-analysis sequence :type :length)
=> (0.69 0.44 0.44 0.5 0.69)


(density '(.3 .1 .1 .2 .1 .2) sequence :seed 23)
Opusmodus                                                    density   4




(density '(1.0 .95 .8 .75 .8) sequence
          :intervals '(0 13 1 11) :seed 23)




(density '(.3 .1 .1 .2 .1 .2) sequence :legato t :seed 23)
Opusmodus                                                    density   5




Relevant Functions
----------------------------------------------------------
DENSITY-ANALYSIS
FILTER-DENSITY
QUANTUM

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Density/
