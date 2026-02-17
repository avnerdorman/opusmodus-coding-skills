     Opusmodus                                                                         make-tempo   1

     make-tempo tempo length &key type
     [Function]

     Arguments and Values:
     tempo                  a list of tempo values.
     length                 a list of lengths, omn form list or time-signature form.
     type                   :length or :bars. The default is :bars.


     Description:

     The function MAKE-TEMPO brings together lists of changing tempo and number of bars of
     speci c tempo that belong to a piece. This provides the information required by
     the :tempo slot in the DEF-SCORE template.

     (make-tempo '(32 44 72 88) '(1/2 5/4 1/2 5/4 1/2 1/4))
     => ((32 :bars 1) (44 1) (72 1) (88 1) (32 1) (44 1))

     (make-tempo '(32 44 72 88) '(1/2 5/4 1/2 5/4 1/2 1/4) :type :length)
     => ((32 :length 1/2) (44 5/4) (72 1/2) (88 5/4) (32 1/2) (44 1/4))

     (make-tempo '(32 44 72 88) '(1 2 2 1 1 2 2 3 1) :type :bars)
     => ((32 :bars 1) (44 1) (72 1) (88 1) (32 1) (44 1) (72 1) (88 1) (32
     1))

     (make-tempo '(32 44 72 88) '(1 2 2 1 1 2 2 3 1) :type :length)
     => ((32 1) (44 2) (72 2) (88 1) (32 1) (44 2) (72 2) (88 3) (32 1))


     Examples:

     Here is where the tempo information is lodged inside DEF-SCORE.

     (setf tempo (make-tempo '(80 72 32 44 44) '(4 3/4 4 3/2 5/2)))
     => ((80 :bars 1) (72 1) (32 1) (44 2))

     (def-score myscore
                 (:title "Score"
                  :key-signature '(c maj)
                  :time-signature '((4 4 4) (3 4 1) (4 4 4) (3 4 2) (5 4 2))
                  :tempo tempo)

     (time-signature-length '((4 4 4) (3 4 1) (4 4 4) (3 4 2) (5 4 2)))
     => (4 3/4 4 3/2 5/2)
fi
Opusmodus                                                    make-tempo   2

Example with time-signature form:

(make-tempo '(98 60 79 109 52 55)
            '((2 4 1) (3 4 1) (5 8 1) (2 4 2) (3 4 1) (2 4 1)))
=> ((98 :bars 1) (60 1) (79 1) (109 2) (52 1) (55 1))

OMN:

(make-tempo '(60 72 60 96)
              '((-q ab3 p mp mf e3)
                (-e ab3 p a4 mp mf ab3 p)
                (-s ab3 p mp mf e3)
                (-e ab3 p a4 mp mf ab3 p))
            :type :bars)
=> ((60 :bars 1) (72 1) (60 1) (96 1))

(make-tempo '(60 72 60 96)
              '((-q ab3 p mp mf e3)
                (-e ab3 p a4 mp mf ab3 p)
                (-s ab3 p mp mf e3)
                (-e ab3 p a4 mp mf ab3 p))
             :type :length)
=> ((60 :length 5/4) (72 5/8) (60 5/16) (96 5/8))
