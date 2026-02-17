Opusmodus                                                       gen-markov-from-transitions       1

gen-markov-from-transitions transitions &key start seed
                                                 (size (length transitions))

[Function]

Arguments and Values:
transitions               a list of Markov transitions.
start                     'first ( rst symbol) '? (at random) or symbol. The default is '?.
size                      an integer - length of chain to generate.
seed                      NIL or an integer. The default is NIL.


Description:

The function GEN-MARKOV-FROM-TRANSITIONS is able to generate Markov chain
sequences from Markov transitions tables.

(setf transition1
      '((a (e 1) (d 1) (a 1) (b 2))
        (b (c 1) (a 1))
        (c (e 1) (d 1))
        (d (a 1) (c 1) (d 1))
        (e (a 1))))

(gen-markov-from-transitions transition1
                               :size 20 :start 'b)
=> (b a e a d d c e a b c d c e a d a b c d)

With this function it would be possible to use transitions tables created from an analysis of a
Bach keyboard prelude and then use the transition table data as the basis for creating an
original keyboard work. To implement such a project the composer has to use GEN-
MARKOV-FROM-TRANSITIONS. This kind of project has been undertaken and
documented by composer David Cope in his book Computers and Musical Style. In
Opusmodus the ability to import a MIDI le and separate its musical parameters into OMN
makes this kind of work very straightforward.


Examples:
(gen-markov-from-transitions transition1
                             :size 20 :start '?)
=> (c d a d a b a b a b c d a b c e a e a d)

(gen-markov-from-transitions transition1
                             :size 20 :start 'first)
=> (a b c e a e a b a a a d c d c e a e a b)
                             fi
                                   fi
Opusmodus                                       gen-markov-from-transitions   2

(setf transition2
      '((c4 (g4 1) (f4 1) (c4 1) (d4 2))
        (d4 (g4 1) (e4 1) (c4 1))
        (e4 (f4 1)) (f4 (c4 1) (d4 1) (f4 1))
        (g4 (c4 1))))

(gen-markov-from-transitions transition2
                             :size 20 :start 'f4 :seed 235)
=> (f4 c4 d4 e4 f4 f4 f4 c4 c4 d4 e4 f4 c4 c4 f4 c4 d4 c4 f4 f4)
