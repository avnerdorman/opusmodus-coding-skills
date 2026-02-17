Opusmodus                                                              create-assignment   1

create-assignment index-name lists
[Function]

Arguments and Values:
index-name               an index name.
lists                    a lists.


Description:
The function CREATE-ASSIGNMENT provides a way of labelling items as variables. It uses
a similar mechanism to that found in the function CREATE-LIBRARY. In the process of
assembling library material it is necessary to identify every entry by a variable identi er.

There are often instances when short percussion gures or mosaic-like material for melodic
instruments need to be assembled as a temporary 'on-the- y' collection of assignments. The
function CREATE-ASSIGNMENT enables a quick semi-automatic labelling of such material.


Examples:
(setf perc-motifs (gen-divide 5 (integer-to-pitch (rndn 20 -1 5))))
=> ((d4 cs4 eb4 c4 d4) (f4 d4 cs4 f4 e4)
    (d4 eb4 d4 e4 cs4) (cs4 d4 eb4 cs4 cs4))

(setf p-list (create-assignment 'perc perc-motifs))
=> (setf
     perc1 '(d4 cs4 eb4 c4 d4)
     perc2 '(f4 d4 cs4 f4 e4)
     perc3 '(d4 eb4 d4 e4 cs4)
     perc4 '(cs4 d4 eb4 cs4 cs4)
   )

Once this list of assignments is printed in the LISTENER it needs to be copied and pasted in
the working SCORE-FILE and then evaluated.

Now test the output within an expression, for example:

(rnd-sample 8 (list perc1 perc2 perc3 perc4))
=> ((d4 eb4 d4 e4 cs4) (cs4 d4 eb4 cs4 cs4)
    (cs4 d4 eb4 cs4 cs4) (cs4 d4 eb4 cs4 cs4)
    (cs4 d4 eb4 cs4 cs4) (f4 d4 cs4 f4 e4)
    (cs4 d4 eb4 cs4 cs4) (d4 eb4 d4 e4 cs4))
                                          fi
                                                  fl
                                                                              fi
