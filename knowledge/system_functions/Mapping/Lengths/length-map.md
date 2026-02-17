Opusmodus                                                                                   length-map   1

length-map map sequence &key rnd group otherwise section exclude seed
[Function]

Arguments and Values:
map                      A list of pairs (<length> <item>), where <length> is a duration and
                         <item> is the value to map. <length> with two values indicates a duration
                         range (min max).

sequence                 A list of lengths or an OMN-form sequence.

otherwise                A required item or list of items to use when no mapping is found.

rnd                      (optional): If T, map items are selected at random. The default is NIL, meaning
                         map items are selected consecutively. If T and group is set to T, one item is
                         selected at random and is applied to the length group.

group                    (optional): If T, map items are selected at random for the entire group.
                         The default is NIL, meaning map items are selected consecutively.

section                  (optional): An integer or a list of integers specifying the sections of the
                         sequence to which the function should be applied. If not provided,
                         the function processes the entire sequence.

exclude                  (optional): An integer or a list of integers indicating the sections of the
                         sequence that should be excluded from processing. By default,
                         all sections are included.

seed                     (optional): integer; sets a speci c seed for reproducible randomness in
                         transformations. Default is NIL, which allows for natural randomness.


Description:

LENGTH-MAP returns a copy of the sequence in which each element that matches a
length in the map (<length><item>) is replaced with the corresponding item. If a length is
not found in the map, the element is replaced with an item from :otherwise.


Examples:

Basic usage with consecutive mapping:

(length-map
 '((1/16 (mf f))
   (1/8 (p mp)))
'(1/16 1/16 1/16 1/8 1/8 1/2 1/16 1/16 1/8 1/8) :otherwise '(ppp))
=> (mf f mf mp mp ppp f mf mp mp)
                                                  fi
Opusmodus                                                    length-map   2

Random mapping without grouping:

(length-map
 '((1/16 (mf f))
   (1/8 (p mp)))
 '(1/16 1/16 1/16 1/8 1/8 1/2 1/16 1/16 1/8 1/8)
 :otherwise '(ppp) :rnd t)
=> (mf f f mp mp ppp f mf p mp)

Consecutive mapping with grouping:

(length-map
 '((1/16 (mf f))
   (1/8 (p mp)))
 '(1/16 1/16 1/16 1/8 1/8 1/2 1/16 1/16 1/8 1/8)
 :otherwise '(ppp) :group t)
=> (mf mf mf p p ppp f f mp mp)

Random mapping with grouping:

(length-map
 '((1/16 (mf f))
   (1/8 (p mp)))
 '(1/16 1/16 1/16 1/8 1/8 1/2 1/16 1/16 1/8 1/8)
 :otherwise '(ppp) :group t :rnd t)
=> (f f f p p ppp f f mp mp)

Mapping articulation to length:

(length-map
 '((1/8 marc) (1/16 stacc) (1/4 leg))
 '(1/16 1/16 1/8 1/2 1/16 1/16 1/8 1/4 1/2 1/4)
 :otherwise 'tr2)
=> (stacc stacc marc tr2 stacc stacc marc leg tr2 leg)

Randomised articulation mapping:

(length-map
 '((1/8 (spicc marc)) (1/16 (pizz stacc)) (1/4 (vib leg)))
 '(1/16 1/16 1/8 1/2 1/16 1/16 1/8 1/4 1/2 1/4)
 :otherwise 'ord :rnd t)
=> (pizz stacc spicc ord pizz stacc spicc vib ord leg)

Random mapping with grouping:

(length-map
 '((1/8 (spicc marc)) (1/16 (pizz stacc)) (1/4 (vib leg)))
 '(1/16 1/16 1/8 1/2 1/16 1/16 1/8 1/4 1/2 1/4)
 :otherwise 'ord :rnd t :group t)
=> (pizz pizz marc ord stacc stacc marc leg ord leg)
Opusmodus                                                    length-map   3

OMN:

(setf omn '((e c4 fff cs5 f q d4 f ds5 p s f4 p fs5 p c5 p pp)
            (s cs4 p f d4 f e eb5 p f4 p eb4 f h d3 p ff)))

Mapping pitch to length:

(length-map '((s (c4fs4 fs3f4)) (e c6ds6) (q (fs4 fs3 gs5))) omn
            :otherwise '(c3fs4g4 gs5))
=> ((e c6ds6 fff f q fs4 fs4 p s c4fs4 fs3f4 c4fs4 fs3f4 pp)
    (s c4fs4 p fs3f4 f c4fs4 e c6ds6 p c6ds6 c6ds6 f
     h c3fs4g4 p gs5 ff))

Random articulation mapping with grouping:

(length-map '(((s e) (stacc det)) (h (tr1 tasto+trem))) omn
            :otherwise 'ord :rnd t :group t)
=> ((e c4 fff stacc cs5 f stacc q d4 ord ds5 p ord
     s f4 stacc fs5 stacc c5 stacc c5 pp stacc)
    (s cs4 p stacc f stacc d4 stacc e eb5 p stacc f4 stacc eb4 f stacc
     h d3 p tasto+trem ff tasto+trem))

Mapping velocity to length:

(length-map '((s ff) (e f) (q (pp ppp))) omn
            :otherwise 'ppp :rnd t)
=> ((e c4 f cs5 q d4 ppp ds5 s f4 ff fs5 c5 c5)
    (s cs4 ff cs4 d4 e eb5 f f4 eb4 h d3 ppp d3))
