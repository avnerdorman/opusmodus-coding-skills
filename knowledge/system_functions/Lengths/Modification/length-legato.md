Opusmodus                                                                            length-legato   1

length-legato sequence &key section exclude omn
[Function]

Arguments and Values:
sequence                  lists of lengths or OMN sequence form.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

LENGTH-LEGATO inverts length-rests to a length-note and adds the sum of the rests in
sequence to the previous length-note.

(length-legato '(1/8 -1/16 1/16 -1/12 2/12 2/20 -3/20 -1/8 3/8))
=> (3/16 7/48 1/6 3/8 3/8)

(length-legato '(-1/8 -1/16 1/16 -1/12 2/12 2/20 -3/20 -1/8 3/8))
=> (-3/16 7/48 1/6 3/8 3/8)

(length-legato '((-1/8 -1/16 1/16 -1/12) (2/12 2/20 -3/20 -1/8 3/8)))
=> ((-3/16 7/48) (1/6 3/8 3/8))

Processing selected lists only:

(length-legato '((-1/8 -1/16 1/16 -1/12) (2/12 2/20 -3/20 -1/8 3/8))
               :section '(1))
=> ((-1/8 -1/16 1/16 -1/12) (1/6 3/8 3/8))

(length-legato '((5q --- == -w 5q q) (q q e e)) :omn t)
=> ((5w 5ddw. 5q q) (q = e =))

Processing :omn list:

(length-legato '(s c4 -q -e s d4 - e e4 -s -))
=> (q.. c4 e d4 q e4)


Examples:
(setf bin (gen-binary-euclidean 2 12 1 9 :seed 45))
=> ((1 0 1 1 0 1 0 1 1 0 1 0) (1 0 0 1 0 1 0 0 1 0 1 0))
Opusmodus                                  length-legato   2

(setf bmap (binary-map bin 's))
=> ((1/16 -1/16 1/16 1/16 -1/16 1/16
     -1/16 1/16 1/16 -1/16 1/16 -1/16)
    (1/16 -1/16 -1/16 1/16 -1/16 1/16
     -1/16 -1/16 1/16 -1/16 1/16 -1/16))




(length-legato bmap)
=> ((1/8 1/16 1/8 1/8 1/16 1/8 1/8)
    (3/16 1/8 3/16 1/8 1/8))
