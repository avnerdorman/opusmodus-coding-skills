Opusmodus                                                                 gen-choralis   1

gen-choralis length chords &key velocity attributes
[Function]

Arguments and Values:
length                list of length values.
chords                list of chords. Chord size: minimum 3, maximum 4.
velocity              list of velocity values.
attributes            list of attributes (articulation).


Description:

This function allows you to generate a list of CHORALIS chords with
optional :velocity and :attributes values. This function is a companion to the
CHORALIS function.


Examples:

I.
(setf bartok '(c4eb4g4 c4e4g4 db4fs4a4 eb4g4bb4 e4g4bb4
               fs4a4c5 bb4c5ds5 a4c5eb5 a4c5e5 b4db5fs5))

(setf chords (rnd-sample 31 bartok :seed 857438))
=> (fs4a4c5 a4c5e5 b4db5fs5 b4db5fs5 b4db5fs5 c4e4g4
    db4fs4a4 fs4a4c5 bb4c5ds5 b4db5fs5 b4db5fs5 b4db5fs5
    eb4g4bb4 b4db5fs5 c4eb4g4 c4eb4g4 e4g4bb4 c4e4g4
    eb4g4bb4 b4db5fs5 bb4c5ds5 bb4c5ds5 db4fs4a4
    a4c5eb5 c4eb4g4 a4c5eb5 c4e4g4 a4c5e5 db4fs4a4
    c4eb4g4 fs4a4c5)

(setf lengths
      (gen-prob 31 '((h .4)
                     (q .2)
                     (h. .4)
                     (q .3)
                     (-h .2)
                     (-q .3)
                     (w .5))
      :seed 441896))
=> (-1/2 1 1/4 1 -1/4 3/4 1 1 -1/2 3/4 1/4 1/2 3/4 1 1/2 1
    1/4 1/2 1/2 1/4 -1/4 1/4 1/2 1/4 1 3/4 -1/4 1 -1/2 1/2 1)

(setf velocity (gen-prob 31 '((p .4) (mp .4) (mf .3) (f .2)) :seed 435))
=> (mp f f mf mp mp mp p p p mp p mf mp f mp
    mf p mp mf f f mf p p mf mp f mf f p)
Opusmodus                                                                         gen-choralis             2

(setf chords (gen-choralis lengths chords :velocity velocity))
=> ((-h) (w fs4a4c5 mp) (q a4c5e5 f) (w b4db5fs5 f) (-q)
    (h. b4db5fs5 mf) (w b4db5fs5 mp) (w c4e4g4 mp) (-h)
    (h. db4fs4a4 mp) (q fs4a4c5 p) (h bb4c5ds5 p) (h. b4db5fs5 p)
    (w b4db5fs5 mp) (h b4db5fs5 p) (w eb4g4bb4 mf) (q b4db5fs5 mp)
    (h c4eb4g4 f) (h c4eb4g4 mp) (q e4g4bb4 mf) (-q) (q c4e4g4 p)
    (h eb4g4bb4 mp) (q b4db5fs5 mf) (w bb4c5ds5 f) (h. bb4c5ds5 f)
    (-q) (w db4fs4a4 mf) (-h) (h a4c5eb5 p) (w c4eb4g4 p))

(choralis chords
          :index 'v
          :seed 653886
          :methods '(:soprano dyn
                     :alto dyn
                     :tenor dyn
                     :bass dyn))

(ps 'gm :satb (list v1 v2 v3 v4)
    :flexible-clef nil
    :time-signature '(4 4)
    :tempo 60)


             = 60
                    2        3        4   5        6        7        8        9           10

 Soprano




      Alto




  Tenor




      Bass




      11
               12       13       14           15       16       17       18          19

 S.




 A.




 T.




 B.



                                                                                               Opusmodus
Opusmodus                                                                         gen-choralis             3

II.
Microtonal example with quarter and eighth tone intervals:

(setf mbartok '(c4eb4-g4 c4e4g4+ db4fs4+a4 eb4-..g4bb4 e4g4bb4-
                fs4a4+c5. bb4c5ds5 a4c5.eb5 a4c5e5+ b4+db5fs5))

(setf mchords (rnd-sample 31 mbartok :seed 857438))
(setf chords2 (gen-choralis lengths mchords :velocity velocity))

(choralis chords2
          :index 'm
          :seed 653886
          :methods '(:soprano dyn
                     :alto dyn
                     :tenor dyn
                     :bass dyn))

(ps 'gm :satb (list m1 m2 m3 m4)
    :flexible-clef nil
    :time-signature '(4 4)
    :tempo 60)


              = 60
                     2        3    4      5        6        7        8        9           10

 Soprano




       Alto




   Tenor




       Bass




       11
                12       13       14          15       16       17       18          19

  S.




 A.




 T.




 B.


                                                                                               Opusmodus
Opusmodus                                                   gen-choralis   4

Relevant Functions
---------------------------------------------------------
CHORALIS
UNFOLD
CLOSEST-PATH
COMPARATIVE-CLOSEST-PATH
RELATIVE-CLOSEST-PATH

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Choralis/
Documentation/3. How-to/Unfold/
