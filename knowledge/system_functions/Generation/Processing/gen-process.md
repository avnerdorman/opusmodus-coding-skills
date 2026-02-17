Opusmodus                                                                       gen-process   1

gen-process function values &key seed
[Function]

Arguments and Values:
function                   a function to execute.
values                     values of given function.
seed                       an integer or NIL. The default is NIL.


Description:

This function provides a way assigning different values to the processing of lists of material.

(gen-process '(pitch-repeat2 a b c) '(6 3 ((c4 d4 e4) (e4 f4 g4))))
=> (((c4 = =) (d4 = =) (e4 = =)) ((e4 = =) (f4 = =) (g4 = = = = =)))


Examples:

Notice the difference between using GEN-PROCESS with PITCH-REPEAT2 and the
internal mechanism of GEN-REPEAT2.

(gen-process '(pitch-repeat2 a b c) '(6 3 ((c4 d4 e4) (e4 f4 g4))))
=> (((c4 = = = =) (d4 = =) (e4 = = = =))
    ((e4 = = = = =) (f4 = = =) (g4 = = = = =)))

(pitch-repeat2 6 3 '((c4 d4 e4) (e4 f4 g4)))
=> ((c4 = = =) (d4 = =) (e4 = = =) (e4 = = =) (f4 = = = = =) (g4 = = =))

(gen-process '(pitch-transpose a b)
               '((1 4 3) ((c4 d4) (c4 d4) (f4 b4) (c4 eb4) (c4 b3))))
=> ((db4 eb4) (e4 gb4) (ab4 d5) (db4 e4) (e4 eb4))

This function is valuable for scaling lists.

(setf r-numbers (rndn 32 0 12))
=> (2 2 3 5 8 8 10 4 11 4 6 8 9 3 3 4
    4 2 5 4 4 9 4 3 6 12 5 10 3 10 4 7)

(setf velocity
      (get-velocity
       (gen-process '(percent-amount a b) '(r-numbers 15))
       :type :symbol))
=> (pppp pppp ppp pp mp mp mf ppp f ppp p mp mf ppp ppp ppp
    ppp pppp pp ppp ppp mf ppp ppp p ff pp mf ppp mf ppp p)
