Opusmodus                                                                        melodize-to-length   1

melodize-to-length low high sequence &key select
                                section exclude seed

[Function]

Arguments and Values:
low                     length test (lowest chord size).
high                    length test (highest chord size).
sequence                omn sequence.
select                  's (start) 'e (end) or '? (at random). The default is 's.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
seed                    NIL or an integer. The default is NIL.


Description:

This function returns a copy of sequence in which each element has to satisfy a test. If
chord is found in range of low and high value the rst symbol of the chord is chosen by
default.

In the preliminary example below note lengths between a 1/16 and an 1/8 will trigger the
melodising of a chord.

(setf sequence '((e fs3c5 p s f4cs4)
                 (s fs4cs4 p c5fs3eb4 a3c5as4 a4e4fs3)))




(melodize-to-length 1/16 1/8 sequence)
=> ((e fs3 p s f4) (s fs4 p c5 a3 a4))
                                                 fi
Opusmodus                                              melodize-to-length   2

Examples:
(melodize-to-length 's 's sequence)
=> ((e fs3c5 p s f4) (s fs4 p c5 a3 a4))




(melodize-to-length 's 's sequence :select 'e)
=> ((e fs3c5 p s cs4) (s cs4 p eb4 as4 fs3))




(melodize-to-length '(e s) '(e q) sequence)
=> ((e fs3 p s f4cs4) (s fs4 p c5 a3 a4))




(melodize-to-length '((e s)) '((e q)) sequence)
=> ((e fs3 p s f4cs4) (s fs4cs4 p c5 a3 a4e4fs3))




or ((e fs3 p s f4) (s fs4cs4 p c5fs3eb4 a3 a4e4fs3))
Opusmodus                                              melodize-to-length   3

or ((e fs3 p s f4cs4) (s fs4 p c5 a3 a4))




...

(melodize-to-length '((e s)) '((e q)) sequence :select '? :seed 12)
=> ((e fs3 p s cs4) (s cs4 p c5 c5 a4e4fs3))




(melodize-to-length '((e s)) '((e q)) sequence :section 1 :seed 45)
=> ((e fs3c5 p s f4cs4) (s fs4 p c5fs3eb4 a3 a4e4fs3))
