Opusmodus                                                                 find-complement    1

find-complement numbers &key low high remove
[Function]

Arguments and Values:
numbers                  list or lists of numbers.
low                      an integer or NIL. The default is NIL.
high                     an integer or NIL. The default is NIL.
remove                   NIL or T. The default is NIL.


Description:

The function FIND-COMPLEMENT returns complementary integers from a sequence of
integers. If no low or high keyword is used then the lowest and highest number from the
sequence is used to de ne the range.

(find-complement '(1 3 6 8))
=> (2 4 5 7)

(find-complement '(1 3 6 8) :low 0)
=> (0 2 4 5 7)

(find-complement '(1 3 6 8) :low 0 :high 11)
=> (0 2 4 5 7 9 10 11)

Using this function can be invaluable when creating pitch material from integers, particularly
chords and scales. See an example in the Stages Tutorial Guide series number 23.


Examples:

The function could be used to create hocketing effects between parts common in systems or
minimalist music.

(setf part-1 '(9 1 6 5 3 8))
(setf part-2 (find-complement part-1))

(setf rhy-1 '(-e q q q q q e))
(setf rhy-2 '(q q q q q q))

(setf r-3 (span rhy-1 part-1))
(setf r-4 (span rhy-2 part-2))

(setf hocket-1 (make-omn
                :length rhy-1
                :pitch (integer-to-pitch r-3)))
                fi
Opusmodus                                                                  find-complement   2

(setf hocket-2 (make-omn
                :length rhy-2
                :pitch (integer-to-pitch r-4)))

The following examples demonstrate the different possibilities of this function.

(find-complement '(9 1 6 5 3 8))
=> (2 4 7)

(find-complement '((1 3 6 8) (1 3) (1 2 3 4)))
=> ((2 4 5 7) (2) nil)

(find-complement '((1 3 6 8) (1 3) (1 2 3 4)) :remove t)
=> ((2 4 5 7) (2))
