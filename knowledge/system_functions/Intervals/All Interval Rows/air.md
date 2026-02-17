     Opusmodus                                                                                air     1

     air row variant &key type
     [Function]

     Arguments and Values:
     row                       an integer (row id).
     variant                   :group :prime :retrograde :invert :retrograde-invert
                               :4th :5th :retrograde-4th :retrograde-5th.
     type                      :integer :pitch or :interval. The default in :integer.


     Description:

     In music, an all-interval twelve-tone row is a twelve-tone tone row arranged so that it
     contains one instance of each interval within the octave, 1 through 11: a "twelve-note spatial
     set made up of the eleven intervals [between consecutive pitches]. There are 1,928 distinct
     all-interval twelve-tone rows. "Distinct" in this context means in transpositionally and
     rotationally normal form (yielding 3856 such series), and disregarding inversionally related
     forms.

     The rst all-interval row, devised by Fritz Heinrich Klein: F, E, C, A, G, D, Ab, Db, Eb, Gb,
     Bb, Cb. (0 11 7 4 2 9 3 8 10 1 5 6) This row was also used by Alban Berg in his
     Lyric Suite (1926).

     Related to this is THE GRANDMOTHER CHORD. It is an eleven-interval, twelve-note,
     invertible chord with all of the properties of the Mother chord. Additionally, the intervals are
     so arranged that they alternate odd and even intervals (counted by semitones) and that the
     odd intervals successively decrease by one while the even intervals successively increase by
     one. It was invented by Nicolas Slonimsky. The sum of numbers 1 through 11 = 66 and thus
     the chord contains a tritone between its outer notes and as its sixth (middle) interval, and
     between the two notes directly outside of those, etc... All-interval series can be found in
     many works including Luigi Nono's Il canto sospeso and Night Fantasies by Eliott Carter.

     This function offers very many different ways of varying all-interval groups or
     'sets' (American usage), both in input and output forms.
fi
Opusmodus                                           air   2

(air 126 :group)
=> ((0 1 5 2 4 11 9 3 8 7 10 6)
    (6 10 7 8 3 9 11 4 2 5 1 0)
    (0 11 7 10 8 1 3 9 4 5 2 6)
    (6 2 5 4 9 3 1 8 10 7 11 0)
    (0 5 1 10 8 7 9 3 4 11 2 6)
    (0 7 11 2 4 5 3 9 8 1 10 6)
    (6 2 11 4 3 9 7 8 10 1 5 0)
    (6 10 1 8 9 3 5 4 2 11 7 0))

(pitch-list-plot (air 126 :group :type :pitch)
 :join-points t :point-radius 2.5 :line-width 0.5
 :height 256 :width 480)




Examples:
(air 126 :group :type :interval)
=> ((1 4 -3 2 7 -2 -6 5 -1 3 -4)
    (4 -3 1 -5 6 2 -7 -2 3 -4 -1)
    (11 -4 3 -2 -7 2 6 -5 1 -3 4)
    (-4 3 -1 5 -6 -2 7 2 -3 4 -11)
    (5 -4 9 -2 -1 2 -6 1 7 -9 4)
    (7 4 -9 2 1 -2 6 -1 -7 9 -4)
    (-4 9 -7 -1 6 -2 1 2 -9 4 -5)
    (4 -9 7 1 -6 2 -1 -2 9 -4 -7))

(air 126 :retrograde)
=> (6 10 7 8 3 9 11 4 2 5 1 0)
Opusmodus                                       air   3

(air 126 :retrograde :type :interval)
=> (4 -3 1 -5 6 2 -7 -2 3 -4 -1)

(air 126 :invert :type :interval)
=> (11 -4 3 -2 -7 2 6 -5 1 -3 4)

(air 126 :retrograde-invert)
=> (6 2 5 4 9 3 1 8 10 7 11 0)

(air 126 :4th :type :pitch)
=> (c4 f4 db4 bb4 ab4 g4 a4 eb4 e4 b4 d4 gb4)
(air 126 :4th)
=> (0 5 1 10 8 7 9 3 4 11 2 6)

(air 126 :retrograde-4th)
=> (6 2 11 4 3 9 7 8 10 1 5 0)

(air 126 :5th :type :pitch)
=> (c4 g4 b4 d4 e4 f4 eb4 a4 ab4 db4 bb4 gb4)

(air 126 :retrograde-5th)
=> (6 10 1 8 9 3 5 4 2 11 7 0)
