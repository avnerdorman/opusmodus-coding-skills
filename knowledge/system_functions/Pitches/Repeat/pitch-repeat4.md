Opusmodus                                                                               pitch-repeat4   1

pitch-repeat4 count transpose pitch &key first
                       flat span section exclude omn seed

[Function]

Arguments and Values:
count                    an integer.
transpose                an integer (transposition value).
pitch                    list of pitches.
first                    NIL to T. The default is T.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or number. The default is NIL.
omn                      NIL or T. If true force OMN style output. The default is T.

OMN:
flat                     NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                     :length, :pitch or :velocity. The default is :length.


Description:

The function PITCH-REPEAT4 allows a pitch series to be algorithmically expanded into
either a series of repeated pitches, or an evolving melodic sequence.

(pitch-repeat4
 '(11 5) '(13 0)
 '((c4 db4 d4 eb4) (e4 f4 fs4 gs4) (e4 f4 fs4 gs4)))
=> ((c4 = = = = = = = = = =)
    (e4 = = = =)
    (e4 = = f5 e4 = = = = f5 e4))

The most simple use of any of the four pitch-repeat functions is to repeat a series of values.
However, the function can be a starting point for the most complex of transformations and
variants of material as the examples below demonstrate. This function begins where PITCH-
REPEAT3 leaves off!
                                                                       fl
Opusmodus                                                                pitch-repeat4   2

Examples:
(pitch-repeat4
 '(11 5) '(13 0)
 '((c4 db4 d4 eb4) (e4 f4 fs4 gs4) (e4 f4 fs4 gs4)))
=> ((c4 = = = = = = = = = =)
    (e4 = = = =)
    (e4 = = f5 e4 = = = = f5 e4))

=> ((c4 db5 c4 db5 c4 = = = = = =)
    (e4 = = = =)
    (e4 f5 e4 f5 e4 f5 e4 f5 e4 = =))

=> ((c4 = = db5 c4 = = db5 c4 db5 c4)
    (e4 f5 e4 = =)
    (e4 = = f5 e4 f5 e4 = = = =))

Above are three examples of output without the determining presence of :seed. List lengths
are between 11 and 5. List transposition is between 13 semitones and 0.

(pitch-repeat4 11 '(1 2 13) '(e4 f4 = fs4 = gs4))
=> ((e4 f4 e4 f5 e4 f5 e4 f5 e4 f5 e4)

(pitch-repeat4 '(11 5) '(13 0)
 '((c4 db4 d4 eb4) (e4 f4 fs4 gs4) (e4 f4 fs4 gs4))
 :section '(1))
=> ((c4 db4 d4 eb4) (e4 f5 e4 = =) (e4 f4 fs4 gs4))

(pitch-repeat4 5 '(1 2 13 4)
 (make-omn
  :length '(1/4 1/2 1/4 1/1)
  :pitch '((c4 d4 e4 f4 g4) (f4 g4 a4 b4) (f4 g4 a4 b4)))
 :first nil)
=> (q c4 h d4 q c4 w d4 q c4)
