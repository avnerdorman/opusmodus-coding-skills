Opusmodus                                                            assign-variable     1

assign-variable index-name lists &key start
[Function]

Arguments and Values:
index-name              an index name.
lists                   a lists.
start                   staring number. The default is 1.


Description:
The function ASSIGN-VARIABLE provides a way of labelling items as variables. It uses a
similar mechanism to that found in the function CREATE-ASSIGNMENT but without the
need for additional evaluation.

(assign-variable 'var '((c4 cs4 d4)
                        (ds4 e4 f4)
                        (fs4 g4 gs4)
                        (a4 bb4 b4)))

var1
=> (c4 cs4 d4)

var2
=> (ds4 e4 f4)

var3
=> (fs4 g4 gs4)

var4
(a4 bb4 b4)



Examples:
(setf perc-motifs
      (gen-divide 5 (integer-to-pitch (rndn 20 -1 5))))
=> ((c4 c4 cs4 cs4 eb4) (eb4 e4 cs4 f4 cs4)
    (d4 cs4 e4 cs4 cs4) (cs4 cs4 c4 cs4 cs4))

(assign-variable 'perc perc-motifs)
=> (perc1 perc2 perc3 perc4)

perc3
=> (cs4 d4 d4 eb4 cs4)
