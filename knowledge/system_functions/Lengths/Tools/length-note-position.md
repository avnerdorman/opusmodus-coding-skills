Opusmodus                                                             length-note-position   1

length-note-position length
[Function]

Arguments and Values:
length                   a sequence of length or OMN form sequence.


Description:

This function returns a list of position (integer) numbers of all note length values. The rest
length values are omitted in the output stream.


Examples:
(length-note-position
 '((1/16 1/4 1/16 3/16 1/16 -1/4 1/8)
   (1/16 1/8 1/16 1/8 1/8 -1/8 1/8 -1/4)))
=> ((0 1 2 3 4 6) (0 1 2 3 4 6))

(length-note-position
 '((e. s == e. - 5q == = =)
   (s ==== s - = - = s - = - = =)))
=> ((0 1 2 3 5 6 7 8) (0 1 2 4 6 7 9 11 12))

OMN:

(length-note-position
 '(e. g3 s b3 - d4 g4 s a4 s e
   s - g4 - fs4 e4 e. fs4 s g4 - a4))
=> (0 1 3 4 5 6 9 10)

Here's another way it might be used:

(setf rhy-1
 (gen-length-cartesian 1 1 'm 's 4 '(2 3) '(2 5 7 2 4) '(1 2 3 4)
                       :seed 12))
=> ((1/4 1/4)
    (1/4 1/4 -1/12 1/12 1/12)
    (-1/16 1/16 1/16 1/16 -1/12 1/12 1/12)
    (1/4 1/4)
    (-1/12 1/12 1/12 1/4))

(setf new-list (length-note-position rhy-1))
=> ((0 1) (0 1 3 4) (1 2 3 5 6) (0 1) (1 2 3))
Opusmodus                                                             length-note-position   2


(setf sl-4 '(c4 f4 fs4 b4 c5))

(setf cart-lis
 (gen-divide '(2 5 7) (rnd-sample 20 '(c4 cs4 fs4 g4 c5))))
=> ((c5 c5) (fs4 fs4 c4 cs4 c4)
    (cs4 c4 fs4 c4 c4 fs4 fs4)
    (c4 fs4) (g4 c4 g4 c5))

(position-replace (flatten new-list) sl-4 cart-lis)
=> ((f4 b4) (f4 b4 c5 c4 c4)
    (f4 b4 c5 c4 c4 c5 c4)
    (f4 b4) (f4 b4 c5 c4))


Score Example:

The potential of the output of this function lies in its use as a kind of ll-template. Imagine
you have a given rhythmic phrase and you want to use it as the basis of a rhythmic unison in
a passage for several instruments.

(setf rhy '(1/4 -1/4 -1/16 1/16 1/16 1/16 1/8 1/8 -1/8 1/8))
(setf r-template (length-note-position rhy))
(setf p1 '(c4 cs4 fs4 g4 c5))
(setf p2 '(c4 g3 fs4 cs5 c5))
(setf clr-p (span r-template p1))
(setf bassoon-p (pitch-transpose -12 (span r-template p2)))

(def-score duo
         (:title "duo"
          :key-signature 'atonal
          :time-signature '(4 4)
          :tempo 72)

             (clarinet
              :length rhy
              :pitch clr-p
              :velocity '(f)
              :channel 1 :sound 'gm :program 'clarinet)

            (bassoon
              :length rhy
              :pitch bassoon-p
              :velocity '(f)
              :channel 2 :program 'bassoon))

(display-midi (compile-score 'duo))
                                                               fi
