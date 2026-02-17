Opusmodus                                                                            filter-preserve   1

filter-preserve item sequence &key section exclude
[Function]

Arguments and Values:
item                     an item or list of items.
sequence                 a sequence.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.



Description:

The function FILTER-PRESERVE will preserve a speci ed item or items from a
sequence.

(filter-preserve '(1 4) '(1 2 3 1 4 5 1 6 4))
=> (1 1 4 1 4)

(filter-preserve
 '(c5 cs5)
 (vector-to-pitch '(g4 g5) (gen-noise 64 :seed 3246)))
=> (cs5 c5 cs5 c5 c5 cs5 cs5 cs5 cs5 cs5 c5 cs5 c5 cs5)

With sublists:

(filter-preserve '(1 6) '((1 6 2 3 6 4 5 6) (6 7 8 9 1 10 1 1)))
=> ((1 6 6 6) (6 1 1 1))


Examples:

This can be used effectively in composing for percussion instruments. The pitches used here
are the General MIDI percussion keys on Channel 10.

(setf perc-group (rnd-sample 20 '(c4 cs4 d4 ds4 fs5 gs5)))
=> (fs5 ds4 d4 ds4 gs5 d4 gs5 cs4 d4 ds4
    ds4 fs5 cs4 ds4 gs5 c4 gs5 d4 c4 c4)

(setf congas (filter-preserve '(c4 cs4) perc-group))
=> (cs4 cs4 c4 c4 c4)

(setf bongos (filter-preserve '(d4 ds4) perc-group))
=> (ds4 d4 ds4 d4 d4 ds4 ds4 ds4 d4)
                                                        fi
Opusmodus                                                  filter-preserve   2

(setf cow-bells (filter-preserve '(fs5 gs5) perc-group))
=> (fs5 gs5 gs5 fs5 gs5 gs5)

(setf conga-part (gen-binary-remove '(cs4 cs4 c4 c4 c4) perc-group))
=> (1 1 1 1 1 1 1 0 1 1 1 1 0 1 1 0 1 1 0 0)

(setf conga-lengths (length-invert (binary-map conga-part 's)))
=> (-1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16
    1/16 -1/16 -1/16 -1/16 -1/16 1/16 -1/16
    -1/16 1/16 -1/16 -1/16 1/16 1/16)
