Opusmodus                                                                                  gen-combine   1

gen-combine &rest args &key rest revolving
[Function]

Arguments and Values:
args                      lists of items.
rest                      NIL or T. If T the rest of the list is add it. The default is NIL.
revolving                 NIL or T. If T, revolving to longest list. The default is NIL.


Description:

Make a list of lists such that the rst list contains all the rst elements of lists, the 2nd
sublist all the 2nd elements, and so on. The length of the value equals the length of the
shortest list of lists if :rest NIL.

(setf mat1 '(c4e4 g4c5 e5g5 c6e6))
(setf mat2 '(f4a4 c5f5 f5a5 f6a6))

(gen-combine mat1 mat2)
=> ((c4e4 f4a4) (g4c5 c5f5) (e5g5 f5a5) (c6e6 f6a6))




(setf pch1 '(c4db4 ab4f4 g4bb4 a4eb4 b4e4 d4gb4))
(setf pch2 '(db4ab4 f4g4 bb4a4 eb4b4 e4d4 gb4c4))

(gen-combine pch1 pch2)
=> ((c4db4 db4ab4) (ab4f4 f4g4) (g4bb4 bb4a4)
      (a4eb4 eb4b4) (b4e4 e4d4) (d4gb4 gb4c4))




The keyword :revolving, when followed by T (true) makes GEN-COMBINE continue
when the shortest list is exhausted, but with revolving lists. Examples are often clearer:

(gen-combine '(a a a a) '(b b b) '(c c) :rest t)
=> ((a b c) (a b c) (a b) (a))
                          fi
                                                        fi
Opusmodus                                                                    gen-combine      2

(gen-combine '(a a a a) '(b b b) '(c c) :revolving t)
=> ((a b c) (a b c) (a b c) (a b c))

and, to avoid ambiguities:

(gen-combine '(a a a a) '(b b b) '(c c) :rest t :revolving t)
> Error: Invalid keyword combination: (:rest t :revolving t).
> While executing: gen-combine, in process Listener-3(10).



Examples:

The interleaving of musical material is common-place in putting together musical structures
at macro and micro levels. Although the POSITION-INSERT function can achieve a
similar result GEN-COMBINE gives a more comprehensive result.

(position-insert '(0 2 4 6 8) 'g4 '(c4 c4 c4 c4 c4))
=> (g4 c4 g4 c4 g4 c4 c4 c4)

(gen-combine (gen-repeat 5 'g4) '(c4 c4 c4 c4 c4))
=> ((g4 c4) (g4 c4) (g4 c4) (g4 c4) (g4 c4))

Lengths:
(setf len1 '(q = = 3q = = q = = =))
(setf len2 '(q = = = = =))

(gen-combine len1 len2)
=> ((1/4 1/4) (1/4 1/4) (1/4 1/4)
    (1/12 1/12 1/12 1/4)
    (1/4 1/4) (1/4 1/4))

(gen-combine len1 len2 :rest t)
=> ((1/4 1/4) (1/4 1/4) (1/4 1/4)
    (1/12 1/12 1/12 1/4)
    (1/4 1/4) (1/4 1/4)
    (1/4) (1/4))

(gen-combine len1 len2 :revolving t)
=> ((1/4 1/4) (1/4 1/4) (1/4 1/4)
    (1/12 1/12 1/12 1/4)
    (1/4 1/4) (1/4 1/4)
    (1/4 1/4) (1/4 1/4))

Building up a piano part where a bass and chordal mix is required can be achieved very
successfully with GEN-COMBINE.
Opusmodus                                                    gen-combine   3

(setf c-chords-rh
      (gen-cluster
       (rnd-sample 24 '(2 3 2 4 3) :seed 76)
       :type '?
       :transpose (rnd-sample 24 (gen-integer 12 24))
       :seed 76))
=> ((e5f5fs5) (d5 ds5 e5) (c6 cs6 d6 ds6) (as5 b5) (e5 f5)
    (as5b5c6) (a5as5) (fs5g5gs5) (a5as5b5) (g5gs5a5)
    (ds5 e5 f5) (ds5 e5 f5 fs5) (fs5g5) (a5 as5 b5 c6)
    (cs5 d5 ds5) (c5 cs5 d5) (b5c6) (g5 gs5 a5 as5)
    (cs5 d5) (as5 b5 c6 cs6) (e5 f5 fs5 g5) (a5as5b5)
    (d5 ds5 e5) (g5gs5a5))

(setf bass-lh (pitch-transpose
               -24 (filter-first 1 (pitch-melodize c-chords-rh))))
=> ((e3) (d3) (c4) (as3) (e3) (as3) (a3) (fs3) (a3) (g3)
    (ds3) (ds3) (fs3) (a3) (cs3) (c3) (b3) (g3) (cs3)
    (as3) (e3) (a3) (d3) (g3))

(setf rh-lh (flatten (gen-combine bass-lh c-chords-rh)))
=> (e3 e5f5fs5 d3 d5 ds5 e5 c4 c6 cs6 d6 ds6 as3 as5 b5
    e3 e5 f5 as3 as5b5c6 a3 a5as5 fs3 fs5g5gs5 a3 a5as5b5
    g3 g5gs5a5 ds3 ds5 e5 f5 ds3 ds5 e5 f5 fs5 fs3 fs5g5
    a3 a5 as5 b5 c6 cs3 cs5 d5 ds5 c3 c5 cs5 d5 b3 b5c6
    g3 g5 gs5 a5 as5 cs3 cs5 d5 as3 as5 b5 c6 cs6 e3 e5
    f5 fs5 g5 a3 a5as5b5 d3 d5 ds5 e5 g3 g5gs5a5)

OMN:

(setf omn1 '(q c4 mp d4 e4 3q f4 f g4 a4 q cs4 mf ds4 c4 f d4 p))
(setf omn2 '(q db4ab4 f4g4 bb4a4 eb4b4 e4d4 gb4c4))

(gen-combine omn1 omn2)
=> ((q c4 mp db4ab4 mf) (q d4 mp f4g4 mf) (q e4 mp bb4a4 mf)
    (3q f4 f g4 a4 q eb4b4 mf) (q cs4 mf e4d4) (q ds4 mf gb4c4))

(gen-combine omn1 omn2 :rest t)
=> ((q c4 mp db4ab4 mf) (q d4 mp f4g4 mf) (q e4 mp bb4a4 mf)
    (3q f4 f g4 a4 q eb4b4 mf) (q cs4 mf e4d4) (q ds4 mf gb4c4)
    (q c4 f) (q d4 p))

(gen-combine omn1 omn2 :revolving t)
=> ((q c4 mp db4ab4 mf) (q d4 mp f4g4 mf) (q e4 mp bb4a4 mf)
    (3q f4 f g4 a4 q eb4b4 mf) (q cs4 mf e4d4) (q ds4 mf gb4c4)
    (q c4 f db4ab4 mf) (q d4 p f4g4 mf))
