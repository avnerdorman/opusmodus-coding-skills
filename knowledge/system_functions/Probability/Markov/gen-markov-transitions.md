Opusmodus                                                                    gen-markov-transitions   1

gen-markov-transitions sequence &key level

[Function]

Arguments and Values:
sequence                  a list of items.
level                     an integer - level of transitions. The default is 1.


Description:

The function GEN-MARKOV-TRANSITIONS generates Markov transition tables based on a
given sequence. The transitions can be stored and use to generate Markov chain.

(gen-markov-transitions
 '(c4 d4 c4 c4 d4 e4 f4 f4 d4 g4 c4 f4 c4 g4))
=> ((c4 (g4 1) (f4 1) (c4 1) (d4 2))
    (d4 (g4 1) (e4 1) (c4 1))
    (e4 (f4 1))
    (f4 (c4 1) (d4 1) (f4 1))
    (g4 (c4 1)))

A Markov process demonstrates a kind of conditional probability. This means that the
probability of the next outcome depends on one or more previous outcomes. A transition
table is very like a table of probabilities. Each transition represents the probability
distribution given a speci c set of past outcomes. In a rst order/ level Markov process there
is only one past outcome for each transition. In a second order process each transition would
refer to a pair of past outcomes.

With this function it would be possible to construct transitions tables of, for example, a Bach
keyboard prelude and then use the transition table data as the basis for creating an original
keyboard work. To implement such a project the composer has to use the function GEN-
MARKOV-FORM-TRANSITIONS.
                   fi
                                                      fi
Opusmodus                                          gen-markov-transitions   2

Examples:

:level 2 transitions tables:

(setf transition
      (gen-markov-transitions
       '(c4 d4 c4 c4 d4 e4 f4 f4 d4 g4 c4 f4 c4 g4) :level 2))
=> (((c4 d4) (e4 1) (c4 1))
    ((d4 c4) (c4 1))
    ((c4 c4) (d4 1))
    ((e4 f4) (f4 1))
    ((f4 f4) (d4 1))
    ((f4 d4) (g4 1))
    ((d4 g4) (c4 1))
    ((g4 c4) (f4 1))
    ((c4 f4) (c4 1))
    ((f4 c4) (g4 1)))

(gen-markov-from-transitions transition)
=> (d4 e4 f4 f4 d4 g4 c4 f4 c4 g4)
