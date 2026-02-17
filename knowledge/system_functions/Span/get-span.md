Opusmodus                                                                      get-span    1

get-span length &key sum section
[Function]

Arguments and Values:
length                  list of lengths.
section                 NIL or a list of integers - sublists to process.
sum                     NIL or T. The default is NIL.


Description:

This function returns a single length value by adding lengths together.

(setf lengths '((1/4 1/8 1/8) (1/2 1/4 1/4)
                (-1/8 1/8 1/8 1/8 1/8) (1/4 1/2)))

(get-span lengths)
=> (1/2 1 5/8 3/4)

Note: 1 = 4/4

Minus values (rests) are treated as absolute numbers so that the accurate SPAN length is
obtained. The function has similarities to GET-TIME-SIGNATURE.


Examples:

Here is an example from a composition Venetian Prelude by Stephane Boussuge. Although
it's best to view the whole composition to see the context, the following expressions
highlight the use of the SPAN functions.

(setf len1 (rnd-sample 32 '((s = -s = = -s = = = = -s = = = = =)
                            (h) (e = -s = -s =) (q - q - e =))))
=> ((q - q - e =) (e = -s = -s =) (q - q - e =)
    (s = -s = = -s = = = = -s = = = = =) . . .)

(setf chlen1 (gen-repeat 16 (rnd-sample 64 '(h h h e q q q e))))
=> (h e q q h q h q q h e q h e q q h q q . . .)

(setf main-span (get-span len1))
=> (1 1 1 1/2 1/2 1/2 1 1/2 1/2 1 1/2 1 1 1/2 5/4 5/4 1/2
    1/2 1/2 1/2 5/4 5/4 5/4 5/4 5/4 1 5/4 1/2 1 1/2 1/2 1)
Opusmodus                                                                   get-span   2

(length-span main-span chlen1)
=> ((1/2 1/8 1/4 1/8) (1/2 1/4 1/4)
;    1/1               1/1
    (1/4 1/4 1/2) (1/8 1/4 1/8) (1/8 1/4 1/8) . . .)
;    1/1           1/2           1/2

Notice that the length lists revealed by the output of the expression above t inside the
values listed in the main-span variable.

(mg
 :pitch chords1
 :length (length-span main-span chlen1)
 :velocity global-vel
 :port 0
 :sound 'gm
 :channel 1
 )

This expression above is part of the DEF-SCORE expression where (length-span
main-span chlen1) is situated.




                                                                      fi
