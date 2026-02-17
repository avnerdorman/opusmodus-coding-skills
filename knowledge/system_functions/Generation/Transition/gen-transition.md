Opusmodus                                                                          gen-transition   1

gen-transition begin end samples curve &key rounded sort chords type
[Function]

Arguments and Values:
begin                     integer / oat or list of integers / oats.
end                       integer / oat or list of integers / oats.
samples                   number of steps between (including) begin and end.
curve                     type of transition: <1 = concave, 1 = linear, >1 = convex.
rounded                   NIL or T. The default is NIL.
sort                      'a (ascending) or 'd (descending). The default is NIL.
chords                    NIL or T. The default is NIL.
type                      :integer or :pitch. The default is :integer.


Description:

GEN-TRANSITION is a function which inserts a number of interpolated values samples
between begin and end. Both can be integers, oats or lists of both. The type of
interpolation is set by a curve: <1 means concave interpolation, 1 is a linear and >1
interpolates the values in a convex function.

Linear transition with integers:

(gen-transition 1 10 10 1)
=> (1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0)

Linear transition with oats:

(gen-transition 0.5 11.2 10 1)
=> (0.5 1.6888889 2.8777778 4.0666666 5.2555556
    6.4444447 7.633333 8.822223 10.011111 11.2)
                fl
                           fl
                           fl
                                             fl
                                                   fl
                                                   fl
Opusmodus                                          gen-transition   2

Concave transition:

(list-plot
 (gen-transition 0 10 50 0.7)
 :zero-based t :point-radius 1.5 :join-points t)




Convex transition:

(list-plot
 (gen-transition 0 10 50 1.3)
 :zero-based t :point-radius 1.5 :join-points t)
Opusmodus                                                            gen-transition   3

Three transitions: convex, linear and concave:

(list-plot
 (gen-transition '(0 1 2) '(10 11 12) 10 '(1.5 1 0.5))
 :zero-based t :point-radius 1.5 :join-points t)




If the curve list is shorter than begin and end list it is looped:

(list-plot
 (gen-transition '(2 1 0) '(10 11 12) 10 '(1.5 0.5))
 :zero-based t :point-radius 1.5 :join-points t)
Opusmodus                                                 gen-transition   4

The values are rounded, e.g. for midi etc.

(list-plot
 (gen-transition '(0 1) '(10 30) 50 1 :rounded t)
 :zero-based t :point-radius 1.5 :join-points t)




Begin and end lists are sorted in ascending order:

(list-plot
 (gen-transition '(2 1 0) '(10 11 12) 10 '(1 0.8) :sort 'a)
 :zero-based t :point-radius 1.5 :join-points t)
Opusmodus                                                                 gen-transition   5

Begin and end lists are sorted in descending order:

(list-plot
 (gen-transition '(3 1 0) '(11 12 10) 10 '(2 1 0.5) :sort 'd)
 :zero-based t :point-radius 1.5 :join-points t)




Values of similar indexes from all transitions are collected as chords:

(list-plot
 (gen-transition '(3 1 0) '(11 12 10) 10 '(1.5 1 0.5) :chords t)
 :zero-based t :point-radius 1.5 :join-points t)
Opusmodus                                                              gen-transition   6

Examples:

Linear chord transition (rounded for midi):

(chordize-list
 (gen-transition '(0 4 7) '(11 22 33) 10 1
                 :chords t :rounded t :type :pitch))
=> (c4e4g4 cs4fs4bb4 d4gs4cs5 e4bb4e5 f4c5g5
    fs4d5a5 g4e5c6 a4fs5eb6 bb4gs5fs6 b4bb5a6)

Concave chord transition (rounded for midi):

(chordize-list
 (gen-transition '(0 4 7) '(11 22 33) 10 .5
                 :chords t :rounded t :type :pitch))
=> (c4e4g4 e4bb4e5 f4c5g5 fs4d5bb5 g4e5c6
    gs4f5d6 a4g5e6 bb4gs5fs6 bb4a5gs6 b4bb5a6)

Convex chord transition (rounded for midi):

(chordize-list
 (gen-transition '(0 4 7) '(11 22 33) 10 2
                 :chords t :rounded t :type :pitch))
=> (c4e4g4 c4e4g4 cs4f4gs4 cs4fs4bb4 d4gs4c5
    eb4bb4eb5 f4c5g5 g4eb5b5 a4fs5e6 b4bb5a6)

Different transitions for each note in the chord (rounded for midi):

(chordize-list
 (gen-transition '(0 4 7) '(11 22 33) 10 '(1.5 1 0.5)
                 :chords t :rounded t :type :pitch))
=> (c4e4g4 c4fs4e5 cs4gs4g5 d4bb4bb5 eb4c5c6
    f4d5d6 fs4e5e6 gs4fs5fs6 a4gs5gs6 b4bb5a6)
