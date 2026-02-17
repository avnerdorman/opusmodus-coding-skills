Opusmodus                                                                               filter-remove   1

filter-remove item sequence &key section exclude
[Function]

Arguments and Values:
item                     an item or list of items.
sequence                 a sequence.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The function FILTER-REMOVE will remove a speci ed item or items from a sequence.

(filter-remove '(1 4) '(1 2 3 4 5 6))
=> (2 3 5 6)

With sublists:

(filter-remove '(1 4 6 8) '((1 2 3 4 5 6) (7 8 9 10 11)))
=> ((2 3 5) (7 9 10 11))


Examples:

This can be used effectively in composing for percussion instruments. The pitches used here
are the General MIDI percussion keys on Channel 10.

(setf perc-group (rnd-sample 20 '(c4 cs4 d4 ds4 fs5 gs5) :seed 43))
=> (cs4 fs5 cs4 gs5 d4 ds4 gs5 fs5 fs5 d4
    ds4 gs5 fs5 fs5 cs4 c4 d4 ds4 cs4 gs5)

(setf congas (filter-remove '(d4 ds4 fs5 gs5) perc-group))
=> (cs4 cs4 cs4 c4 cs4)

(setf bongos (filter-remove '(c4 cs4 fs5 gs5) perc-group))
=> (d4 ds4 d4 ds4 d4 ds4)

(setf cow-bells (filter-remove '(c4 cs4 d4 ds4) perc-group))
=> (fs5 gs5 gs5 fs5 fs5 gs5 fs5 fs5 gs5)
                                                   fi
Opusmodus                                                  filter-remove   2

(setf conga-part (gen-binary-remove '(cs4 cs4 c4 c4 c4) perc-group))
=> (0 1 0 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0 1)

(setf conga-lengths (length-invert (binary-map conga-part 's) :omn t))
=> (s - = - - - - - - - - - - - = = - - = -)
