Opusmodus                                                                              gen-markov   1

gen-markov sequence &key start (size (length sequence))
                  level output section exclude type span seed

[Function]

Arguments and Values:
sequence                  a list of items.
start                     an item to start the Markov chain with. The default is '?.
size                      an integer - length of chain to generate.
level                     an integer - level of Markov chain to generate. The default is 1.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
output                    T or NIL. The default is NIL. If T and the result NIL then the sequence
                          is returned.
seed                      NIL or an integer. The default is NIL.

OMN:
type                      :length :pitch or :velocity.
span                      :length :pitch or :velocity. The default is :length.


Description:

The function GEN-MARKOV will use Markov analysis on a list of items in order to work out
relationships between each item in the list. It will then use these relationships to generate a
new, but related series of values. In a Markov process events happening in the past create a
state, or context, for working out the probabilities of events to come.

(gen-markov '(a b c a d c b))
=> (b c a d c a d)

In the above example, a may be followed by b or d; b is always followed by c; c may be
followed by a or b; and d is always followed by c. Following this analysis, GEN-MARKOV
has generated a sequence following a similar set of rules. The number of values generated
is, by default, equal to the length of the list passed to the function.


Examples:
(gen-markov '(a b c a d c b) :size 15)
=> (b c b c b c a d c a d c a d c)

(gen-markov '(a b c a d c b) :size 4)
=> (c b c b)
          Opusmodus                                                                           gen-markov   2

          Note that the item on which the output list starts is randomly selected. We can also provide a
          speci c value to begin start the chain from, although this is not included in the output. So,
          looking at the above rules if we begin our chain on a, we will get either b or d as the rst
          item in our lists:

          (gen-markov '(a b c a d c b) :size 15 :start 'a)
          => (a d c a b c b c b c a b c b c)

          The number of past events used by a Markov process is known as its order or :level. In a
           rst order process the probabilities for choosing the next event depends preceding event. In a
          second order Markov process the probabilities for the next selection depend on the last two
          events.

          When multiple lists are provided, each one will be processed individually:

          (gen-markov
           '(0 2 -2 2 24 19 -13 -21 18 2 -9 -13 2 0 11 -25 0
             13 0 6 -16 7 -7 7 12 0 -1 5 -7 1 -1 1 1 5 -9
             1 9 5 -15 1 -18 5 -4 5 -3 5 -8 5 0 5 -6 23 1
             -24 5 9 -11 5 -6 5 -7 5 4 5 -14 7 -7 14 5 -12
             5 2 5 25 -25 5)
           :size 12
           :start '(0 2 11)
           :level '(1 2))

          => ((0 2 5 9 5 -6 5 -15 1 5 9 5)
                (2 -2 2 24 19 -13 -21 18 2 -9 -13 2)
                (11 -25 0 2 -2 2 5 9 -11 5 -8 5))

          Although the :section keyword can be used to process only given sublists:

          (gen-markov '((a b c a d c b) (d e d f a e) (d e d f a e))
                      :size 15 :start 'a :section '(0 2))
          => ((a b c b c b c b c b c b c b c)
              (d e d f a e)
              (a e d f a e d f a e d e d f a))

          (gen-markov '(ds4 a4 b4 f4 ds4 e4 as4 e4 d4 ds4 d4 e4 f4
                          fs4 g4 cs4 d4 as4 b4 c4 b4 b4 cs4 d4 cs4 d4)
                        :level '(1 3))
          => ((f4 ds4 e4 as4 b4 c4 b4 f4 fs4 g4 cs4 d4 cs4
                 d4 cs4 d4 cs4 d4 e4 f4 ds4 a4 b4 c4 b4 cs4)
                (ds4 e4 as4 e4 d4 ds4 d4 e4 f4 fs4 g4 cs4 d4
                 as4 b4 c4 b4 b4 cs4 d4 cs4 d4))
fi
     fi
                                                                                         fi
Opusmodus                                                          gen-markov   3

OMN form sequence:

(gen-markov '(e c4 d4 q c4 e f4 d4))
=> (e c4 f4 q d4 e c4 d4)

Vary only the pitch, while keeping length and velocity the same:

(gen-markov '(e c4 mp d4 q c4 ff e f4 d4)
              :type :pitch :start 'f4)
=> (e f4 mp d4 q c4 ff e d4 c4)

A :seed can be introduced to produce consistent outputs:

(gen-markov '(e c4 mp d4 q c4 ff e f4 d4)
              :size 14 :seed 432)
=> (e c4 mp d4 ff c4 d4 c4 d4 c4 f4 q d4 e c4 q f4 e d4 c4 d4)
