Opusmodus                                                            get-time-signature      1

get-time-signature sequence &key group split-lengths
[Function]

Arguments and Values:
sequence                 a sequence of lengths or OMN list format.
split-lengths            NIL or T. The default is NIL (split tuplet lengths).
group                    :auto, :numerator, :denominator, integer list (numerator) or NIL.
                         The default is NIL.


Description:

This function returns time signature form for a sequence of length or OMN list form.

(setf lengths '((1/4 1/8 1/8) (1/2 1/4 1/4)
                (-1/8 1/8 1/8 1/8 1/8) (1/4 1/2)))

(get-time-signature lengths)
=> ((1 2 1) (4 4 1) (5 8 1) (3 4 1))

(get-time-signature lengths :group :auto)
=> (((1 1) 4 1) ((1 1 1 1) 4 1) ((2 2 1) 8 1) ((1 1 1) 4 1))

(get-time-signature lengths :group :numerator)
=> (((2) 4 1) ((4) 4 1) ((5) 8 1) ((3) 4 1))

(get-time-signature lengths :group :denominator)
=> (((1 1) 4 1) ((1 1 1 1) 4 1) ((1 1 1 1 1) 8 1) ((1 1 1) 4 1))

(get-time-signature lengths :group '((2 3)))
=> ((1 2 1) (4 4 1) ((2 3) 8 1) (3 4 1))

(get-time-signature lengths :group '((5)))
=> ((1 2 1) (4 4 1) ((5) 8 1) (3 4 1))

The option segments create a new list for each tuplet 'family' lengths:

(setf lengths2 '((1/16 -1/16 1/16 -1/16 5/7 -1/28)
                 (1/5 3/10 3/20 -1/10 5/16 -1/16)))

(split-lengths lengths2)
=> ((1/16 -1/16 1/16 -1/16) (5/7 -1/28)
    (1/5 3/10 3/20 -1/10) (5/16 -1/16))

(get-time-signature lengths2)
=> ((4 4 1) (9 8 1))
     Opusmodus                                                             get-time-signature    2

     (get-time-signature lengths2 :split-lengths t)
     => ((1 4 1) (3 4 2) (3 8 1))

     Here is an example of its use in a composition for piano by Stephane Boussuge. The main
     use of GET-TIME-SIGNATURE and TIME-SIGNATURE-LENGTH is to be able to set out
     a notated score in MusicXML that groups phrases in the lists in which note-length is
     contained. The time-signature list calculated by these two functions is saved within the MIDI
      le compiled by a composition's code. Thus, when the MID le is imported to a score writer
     such as Finale, Sibelius or Nightingale the correct display will be presented.

     (setf len1 (rnd-sample 32 '((s = - = = - = = = = - = = = = =)
                                 (h) (e = -s = - =) (q - = - e =))))

     (def-score venitianPrelude
                  (:title "venitianPrelude"
                   :key-signature '(c maj)
                   :time-signature (get-time-signature len1)
                   :tempo 122)

     The variable len1 shows four phrases / bars of music repeated in a randomly generated
     structure 32 times.

     (setf ts-form (get-time-signature len1))
     => ((1 2 1) (5 4 1) (1 2 1) (4 4 1)
         (1 2 1) (5 4 1) (4 4 1) (5 4 1)
         (1 2 1) (4 4 1) (5 4 1) (1 2 2)
         (4 4 1) (1 2 1) (4 4 1) (1 2 1)
         (4 4 1) (1 2 1) (5 4 1) (1 2 3)
         (4 4 3) (1 2 1) (5 4 1) (4 4 1)
         (1 2 1) (5 4 1) (1 2 1))

     (time-signature-length ts-form)
     => (1/2 5/4 1/2 1 1/2 5/4 1 5/4 1/2 1 5/4 1 1 1/2
         1 1/2 1 1/2 5/4 3/2 3 1/2 5/4 1 1/2 5/4 1/2)


     Examples:
     (setf length '((e - = - s = =)
                    (e - = - s =)
                    (e - = - s = = = q)
                    (-q e - s = = = q)
                    (e - = - s = = =)))

     (get-time-signature length)
     => ((11 16 1) (5 8 1) (4 4 2) (3 4 1))
fi
                                                          fi
Opusmodus                                          get-time-signature   3

(setf omn '((e c4 - e d4 - s e4 = =)
            (e f4 - e g4 - s a4 =)
            (e b4 - e c5 - s d5 = = = q)
            (-q e e5 - s f5 = = = q)
            (e g5 - e - s a5 = = =)))

(get-time-signature omn)
=> ((11 16 1) (5 8 1) (4 4 2) (3 4 1))

(get-time-signature omn :group '((5) (3 3 3 2)))
=> (((3 3 3 2) 16 1) ((5) 8 1) (4 4 2) (3 4 1))
