Opusmodus                                                                           harmonic-path   1

harmonic-path path sequence &key type time loop
                         octave prob section exclude seed

[Function]

Arguments and Values:
path                     a list of tonalities, chords or pitches.
sequence                 a list of pitches.
type                     NIL, 'a (ascending), 'd (descending), 'ro (random order)
                         and '? (at random). The default is NIL (original path pitch order).
time                     a list of length symbols or ratios.
                         The default is the time-signature of a given sequence.
loop                     NIL or T. If T the span values are looped. The default is NIL.
octave                   'seq (octave numbers from the sequence),
                         'path (octave numbers from the path) and '? (at random).
                         The default is NIL (octave numbers from the sequence).
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5. The prob is an addition to type 'ro.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or an integer. The default is NIL.


Description:

In its simplest form HARMONIC-PATH creates a path made up of any number of harmonic
items to map onto a list or lists making up a pitch sequence.

(harmonic-path '(major)
                 '(c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4))
=> (c4 d4 e4 f4 g4 a4 b4 c4 d4 e4 f4 g4)

Here the function takes the tonality-name description major:

major
=> (0 2 4 5 7 9 11)

These intervals are now used to map directly on to the chromatic scale:

'(c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)

The output is a scale of C major, but one that loops as it will contain the same number of
items as the chromatic scale.

=> (c4 d4 e4 f4 g4 a4 b4 c4 d4 e4 f4 g4)
                    fl
Opusmodus                                                                     harmonic-path      2

(harmonic-path '(cs major) '(c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4))
=> (cs4 eb4 f4 fs4 gs4 bb4 c4 cs4 eb4 f4 fs4 gs4)


Examples:

Below the examples show how this path parameter can contain many different
representations of tonality. These include chords, lists of scales, mixtures of tonality-names
and scales or chords.

(harmonic-path '(c3e3d3f3e3g3f3)
               '(c3 d3 e3 f3 g3 a3 b3 c4 d4 e4 f4 g4))
=> '(c3 e3 d3 f3 e3 g3 f3 c4 e4 d4 f4 e4)

(harmonic-path '(m) '(c3 cs3 d3 ds3 e3 f3 fs3 g3 gs3 a3 as3 b3))
=> (c3 ds3 g3 c3 ds3 g3 c3 ds3 g3 c3 ds3 g3)

(harmonic-path '(c3e3d3f3e3g3f3)
               '(c3 cs3 d3 ds3 e7 f5 fs6 g6 gs7 a7 as7 b3))
=> '(c3 e3 d3 f3 e7 g5 f6 c6 e7 d7 f7 e3)

(harmonic-path '((s d4 e4 q e4 fs4 e c4 e4) m)
                 '((c3 d3 e3 f3) (g4 f4 e4 d4) (c4 cs4)))
=> ((d3 e3 e3 fs3) (c4 eb4 g4 c4) (d4 e4))

(harmonic-path '(b3d4f4g4 c4e4g4c5 m)
               '((c3 d3 e3 f3 g3 a3 b3 c4 d4 e4 f4 g4)
                 (c3 d3 e3 f3g4 a3 b3 c4 d4 e4 f4 g4)
                 (c3 d4 e3 f3g4 a4 b3 c5 d4 e4 f3g4))
               :section '(0 1))
=> ((b3 d3 f3 g3 b3 d3 f3 g4 b4 d4 f4 g4)
      (c3 e3 g3 c3c4 e3 g3 c4 c4 e4 g4 c4)
      (c3 d4 e3 f3g4 a4 b3 c5 d4 e4 f3g4))

(harmonic-path '(b3d4f4g4 c4e4g4c5 m)
               '((c3 d3 e3 f3 g3 a3 b3 c4 d4 e4 f4 g4)
                 (c3 d3 e3 f3g4 a3 b3 c4 d4 e4 f4 g4)
                 (c3 d4 e3 f3g4 a4 b3 c5 d4 e4 f3g4))
               :type 'ro)
=> ((d3 b3 g3 f3 d3 b3 g3 f4 d4 b4 g4 f4)
    (e3 c3 g3 c3e4 c3 g3 c4 e4 c4 g4 c4)
    (eb3 c4 g3 eb3c4 g4 eb3 c5 g4 eb4 c3g4))

In this example we use variable span (3/8 5/8). If the sum of the :time values of the
instrument does not add-up to the span of a sequence, then the last value of the :time list
will be added consecutively to add-up to the span of the sequence (3/8 5/8 5/8
5/8 . .)
Opusmodus                                                                      harmonic-path   3

(harmonic-path '(b3d4f4g4 c4e4g4c5 m)
               '((q c3 d3 e3 f3 g3 a3 b3 c4 d4 e4 f4 g4)
                 (q c3 d3 e3 f3 g4 a3 b3 c4 d4 e4 f4 g4)
                 (q c3 d4 e3 f3 g4 a4 b3 c5 d4 e4 f3 g4))
               :time '(3/8 5/8))
=> ((q b3 d3 c3 e3 c3 eb3 b3 d4 c4 e4 c4 eb4)
    (q b3 d3 c3 e3 c4 eb3 b3 d4 c4 e4 c4 eb4)
    (q b3 d4 c3 e3 c4 eb4 b3 d5 c4 e4 c3 eb4))




It is however when the keywords are applied to HARMONIC-PATH that the possibilities of
this function are opened up. In the example below a short pitch series, a rhythmic gure and
a dynamic list have been devised.

Integers are transformed into pitches:

(setf pitch (integer-to-pitch
             (gen-integer-step 0 12 (rnd-sample 4 '(1 2 3 -1 -2)))))
=> (c4 cs4 eb4 cs4 eb4 e4 fs4 e4 fs4 g4 a4 g4)

24 triplets are generated by the QL (quick-length) function:

(setf length (ql '(24 3e)))

Pitches are mapped to velocity values between p and mf:

(setf velocity (pitch-to-velocity 'p 'mf pitch :type :symbol))

All these are put together as an OMN list:

(setf omn-form
        (make-omn
         :pitch (gen-repeat 4 (list (gen-palindrome pitch)))
         :length (gen-repeat 4 (list length))
         :velocity (gen-repeat 4 (list velocity))))
                                                                          fi
     Opusmodus                                                                     harmonic-path   4

     Now a Harmonic Path is made. This consists of 4 chords.

     (setf path '(b3f4g4d5 c4e4g4c5 cs4a4e5a5 d4a4d5f5))

     The variable path is then applied to the omn-form. Being OMN format it's possible to hear
     the full effect of the expression without compiling a DEF-SCORE. Just audition this:

     (harmonic-path path omn-form)

     At this point the special keyword functions can be applied. This results in the generation of 8
     triplet arpeggios playing through the four chord sequence. It's rather like those arpeggiation
       gures once found on electronic keyboards! For textural effects this could have serious
     potential for the composer searching for harmonic underlay.

     (harmonic-path path omn-form :type 'a)

     Alongside 'a there are several other 'types' of pitch ordering possible.
     :type '? = a, d and ro at random will be chosen:

     (harmonic-path path omn-form :type '?)

     With path :type '(a d a ro) and with KLANGREIHEN generated harmonic path:

     (harmonic-path
      (klangreihen 1 '(3 3 3 3) (rnd-row) :type :pitch :chord t)
      omn-form :type '(a d a ro))

     (harmonic-path
      (klangreihen 1 '(3 3 3 3) (rnd-row) :type :pitch :chord t)
      omn-form :type '(a d a ro) :octave '?)

     Use AUDITION Cmd-1 for each of the expressions.
fi
Opusmodus                                                  harmonic-path   5

(setf pitch (gen-loop 12 (rnd-row :type :pitch)))
(setf length (gen-loop 12 (gen-repeat 12 '(s))))
(setf omn (make-omn :length length :pitch pitch :velocity '(mf)))

(setf path
      (get-harmonic-path omn
                         :row t
                         :chord t
                         :remove 2
                         :time '(1/4 3/8 5/8)
                         :loop t))
Opusmodus                                                            harmonic-path     6

Here the :time is a list of three ratios 1/4, 3/8 and 5/8 with the optional :loop T.
The :loop T will create a :time list (1/4 3/8 5/8 1/4 3/8 5/8 . . .). The
sum of the :time values equals the span of the sequence.

(harmonic-path path omn
               :time '(1/4 3/8 5/8)
               :loop t
               :type '?
               :octave '?)
Opusmodus                                                                  harmonic-path      7

Finally, here's a good example of a score bringing the harmonic path mechanism into action.

(progn
 (setf
  pitch1 (integer-to-pitch
          (gen-integer-step 0 12 (rnd-sample 4 '(1 2 3 -1 -2))))

  pitch2 (integer-to-pitch
          (gen-integer-step 0 12 (rnd-sample 4 '(1 2 3 -1 -2))))

  pitch3 '(c4 eb4 e4 fs4 a4 c5 cs5 eb5 fs5 a5 bb5 c6)

  pitch4 (integer-to-pitch
          (gen-integer-step 0 12 (rnd-sample 4 '(1 2 3 -1 -2)))))

 (setf length1 (ql '(24 3e)))

 (setf
  velocity1 (pitch-to-velocity 'p 'mf pitch1 :type :symbol)
  velocity2 (pitch-to-velocity 'p 'f pitch2 :type :symbol)
  velocity3 (pitch-to-velocity 'p 'mp pitch3 :type :symbol)
  velocity4 (pitch-to-velocity 'p 'mf pitch4 :type :symbol))

 (setf
  omn1 (make-omn
        :pitch (gen-loop 6 (gen-palindrome pitch1))
        :length (gen-repeat 6 (list length1))
        :velocity (gen-repeat 6 (list velocity1)))

  omn2 (make-omn
        :pitch (gen-loop 6 (gen-curve '? '? pitch2))
        :length (gen-repeat 6 (list length1))
        :velocity (gen-repeat 6 (list velocity2)))

  omn3 (make-omn
        :pitch (gen-loop 6 (gen-palindrome pitch3))
        :length (gen-repeat 6 (list length1))
        :velocity (gen-repeat 6 (list velocity3)))

  omn4 (make-omn
        :pitch (gen-loop 6 (gen-curve '? '? pitch4))
        :length (gen-repeat 6 (list length1))
        :velocity (gen-repeat 6 (list velocity4))))
Opusmodus                                                     harmonic-path   8

    (setf
     part1 (harmonic-path
            (klangreihen 1 '(3 3 3 3) (rnd-row) :type :pitch :chord t)
            omn1
            :type '(a d a ro))

     part2 (harmonic-path
            (klangreihen 1 '(2 4 4 2) (rnd-row) :type :pitch :chord t)
            omn2
            :type '(a d a))

     part3 (harmonic-path
            (klangreihen 3 '(3 2 2 2 3) (rnd-row) :type :pitch :chord t)
            omn3
            :type '(a d a))

     part4 (harmonic-path
            (klangreihen 2 '(3 3 3 3) (rnd-row) :type :pitch :chord t)
            omn4
            :type '?))

    (def-score harmonic-path
               (:title "Harmonic Path"
                :copyright "Copyright © 2013 Opusmodus"
                :key-signature 'chromatic
                :time-signature '(4 4)
                :tempo 120)

     (inst
      :omn (assemble-seq part1 part2 part3 part4)
      :sound 'gm :channel 1 :program 0))

    (audition-musicxml-last-score)
)
