Opusmodus                                                                 count-item   1

count-item item sequence
[Function]

Arguments and Values:
item                    an item.
sequence                a sequence.


Description:

COUNT-ITEM will count the number of times a speci ed item or group of items occurs in a
list. This function can be used to create new material from data lists.


Examples:
(count-item 1 '(0 1 0 1 1 0))
=> (3)

To count both the 1s and the 0s we could write:

(count-item '(1 0) '(0 1 0 1 1 0))
=> (3 3)

To count occurrence of 'c4:

(count-item 'c4 '(c4 d4 e4 c4 g4 c5))
=> (2)

Here is an example of how new material can be derived using COUNT-ITEM:

(setf motif (rnd-sample 20 '(1 2 3 4 5 6 7 8 9 10 11 12)))
=> (1 5 7 8 6 10 3 6 12 6 8 10 6 5 6 10 5 1 12 8)

(setf new-motif (count-item '(1 2 3 4 5 6 7 8 9 10 11 12) motif))
=> (1 1 2 1 1 2 2 5 2 1 2 0)

(integer-to-pitch new-motif)
=> (cs4 cs4 d4 cs4 cs4 d4 d4 f4 d4 cs4 d4 c4)
                                             fi
