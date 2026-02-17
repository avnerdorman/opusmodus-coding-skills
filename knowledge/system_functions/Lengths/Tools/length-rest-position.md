Opusmodus                                                             length-rest-position   1

length-rest-position length
[Function]

Arguments and Values:
length                   a sequence of length or OMN form sequence.


Description:

This function returns a list of position (integer) numbers of all rest length values. The note
length values are omitted in the output stream.

(length-rest-position
 '((1/16 1/4 1/16 3/16 1/16 -1/4 1/8)
   (1/16 1/8 1/16 1/8 1/8 -1/8 1/8 -1/4)))
=> ((5) (5 7))

(length-rest-position
 '((e. s == e. - 5q == = =) (s ==== s - = - = s - = - = =)))
=> ((4) (3 5 8 10))


Examples:

Here's how it might be used:

(setf sl-pat
     (gen-repeat-seq
      '(4 5 4) 1 1 '((c4 cs4) (cs4 fs4 g4) (cs4 fs4 g4 c5))))
=> ((c4 cs4 c4 cs4) (cs4 fs4 g4 cs4 fs4) (cs4 fs4 g4 c5))

(setf len-lis
     (length-rest-series
      '(1 2 1 2 1 1 1 2 1)
      '((1/8 1/8 1/8) (1/4 1/4 1/4 1/4 1/4) (1/16 1/16 1/16 1/16))))
=> ((-1/8 1/8 -1/8) (-1/4 1/4 -1/4 -1/4 -1/4) (-1/16 1/16 -1/16 -1/16))

(setf rest-pos (length-rest-position len-lis))
=> ((0 2) (0 2 3 4) (0 2 3))

(position-replace (flatten rest-pos) '(c4 d4 fs4 bb4 c5) sl-pat)
=> ((d4 cs4 fs4 bb4) (d4 fs4 fs4 bb4 c4) (d4 fs4 fs4 bb4))
Opusmodus                                            length-rest-position   2

OMN:

(length-rest-position
 '(e. g3 s b3 - d4 g4 s a4 s e s - g4 - fs4 e4 e. fs4 s g4 - a4))
=> (2 7 8 11)
