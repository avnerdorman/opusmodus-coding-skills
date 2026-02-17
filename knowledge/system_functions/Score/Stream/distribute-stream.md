Opusmodus                                                                  distribute-stream        1

distribute-stream stream lists &key index
[Function]

Arguments and Values:
stream                    a sequence.
lists                     lists of list lengths.
index                     voice index (name).


Description:

This function is related to mapping functions associated with length. It takes (usually) a
single pitch stream and distributes its content amongst to a series of voices or parts. Other
parameters like dynamics could distributed in a similar way. It does this by mapping - as in
the example below - the single pitch stream sequentially to existing lists of length. Use this
function for 'orchestrating' the items in a pitch-list sequentially to players in an ensemble. In
the example below a list of is processed against lists of variables containing note-lengths
belonging to an ensemble of players.

(setf sym '(c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 c5 cs5 d5 eb5 e5))

(setf v1 '(1/8 1/8 -1/8 2/8 -1/8 5/8))
(setf v2 '(1/8 1/8 1/8 -1/8 2/8 1/8))
(setf va '(-2/8 1/8 1/8 -5/8 1/8))
(setf vc '(-1/8 3/8 3/8 1/8 1/8))

(setf inst (distribute-stream sym (list v1 v2 va vc)))
(setf in1 (make-omn :length v1 :pitch (1~ inst)))
(setf in2 (make-omn :length v2 :pitch (2~ inst)))
(setf in3 (make-omn :length va :pitch (3~ inst)))
(setf in4 (make-omn :length vc :pitch (4~ inst)))

(list in1 in2 in3 in4)




                                                              Opusmodus
Opusmodus                                                   distribute-stream   2

Examples:
(progn
  (setf len1
        '((-t = = -s. t = -) (t = - = =) (-s = = = =)
          (-t = =) (s) (-s = =) (-t = = = - = =) (e -s =)
          (-t = = = =) (-t s. -s =) (t = -) (s = = = =)
          (t = - = = = = = = - = =))

            len2
            '((-s = =) (s - s. -t) (s = = = -) (-e t = -)
              (-s = = -) (t = - = =) (e -s =) (-t = = -) (s =)
              (t = - = = = - = =) (-t = = = -) (t = -) (s)
              (t = = = - =)))

  (setf population (gen-population 64 3 7))
  (setf p-stream (vector-to-pitch 'piano (flatten population)))
  (setf v-stream (vector-to-velocity 'ppp 'ff (flatten population)))
  (setf p-dist (distribute-stream p-stream (list len1 len2)))
  (setf v-dist (distribute-stream v-stream (list len1 len2)))

  (setf v1 (make-omn
            :length len1
            :pitch (1~ p-dist)
            :velocity (1~ v-dist)))

  (setf v2 (make-omn
            :length len2
            :pitch (2~ p-dist)
            :velocity (2~ v-dist)))

  (ps 'gm
      :p (list (ambitus '(0 30) v1) (ambitus '(-35 -1) v2))
      :tempo 56
      :time-signature '(1 4))
  )
Opusmodus                                             distribute-stream     3




              = 56
                             2                    3




 Piano




         4
                         5                    6




 Pno.




         7
                     8                    9




 Pno.




         10
                                     11




 Pno.




                                 8                              Opusmodus
