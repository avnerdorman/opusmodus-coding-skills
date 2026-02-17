Opusmodus                                                                           interval-insert     1

interval-insert insert intervals &key position seed
[Function]

Arguments and Values:
interval-insert            insert list of intervals to insert.
intervals                  lists of intervals.
position                   'e (end), 's (start) or '? (at random) insertion point. The default is '?.
seed                       NIL or an integer. The default is NIL.


Description:

INTERVAL-INSERT inserts new intervals into an existing interval list.

(interval-insert '(12 7) '(0 0 0 0))
=> (7 0 0 0 0)

(interval-insert '(12 7) '((0 0) (0 0) (0 0)))
=> ((7 0 0) (-7 0 0) (0 0 -12))

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2))
                 :seed 1124 :position 's)
=> ((5 2 -2) (12 2 -2) (-5 2 -2))

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2))
                 :seed 1125 :position 's)
=> ((5 2 -2) (-12 2 -2) (5 2 -2))

The example above begins with a row of new intervals to be inserted. Notice that by
changing the random :seed the output does not necessarily input the whole row of new
intervals.


Example:

To insert a new interval at the start of each sublist:

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2)) :position 's)
=> ((12 2 -2) (5 2 -2) (5 2 -2))

Note that the intervals inserted may also be randomly inverted:

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2)) :position 's)
=> ((-7 2 -2) (-5 2 -2) (-5 2 -2))
Opusmodus                                                        interval-insert   2

By default, INTERVAL-INSERT will randomly choose whether to add the newly chosen
interval at either the start or end of the existing intervals:

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2)))
=> ((5 2 -2) (5 2 -2) (2 -2 -12))

Add intervals to the end of lists:

(interval-insert '(5 7 12) '((2 -2) (2 -2) (2 -2))
                 :position 'e)
=> ((2 -2 -5) (2 -2 12) (2 -2 7))
