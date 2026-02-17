Opusmodus                                                                  vector-range    1

vector-range low high vector
[Function]

Arguments and Values:
low                      lower scaling limit ( oating number).
high                     upper scaling limit ( oating number).
vector                   a vector array.


Description:

The function VECTOR-RANGE will scale a vector array between two upper and lower
limits. Note that the output is itself a vector array comprising of oating point values.

(vector-range -5.0 10.0 (gen-noise 10))
=> (0.08990192381337714D0 -5.0D0 7.532986763608401D0
      -3.0089615014546593D0 -3.4119807326933236D0
      3.7269656829228897D0 3.6063361289385494D0
      -1.6628694971343978D0 2.1229000348132967D0
      9.999992893488791D0)


Examples:

Examining the two outputs below:

(vector-to-pitch
 '(c3 c5)
 (gen-accumulate (rndn 12 -1.0 1.0)))
=> (cs4 gs3 gs3 c5 a3 c3 d3 fs4 c5 c4 f4 cs4)

(vector-to-pitch
 '(c3 c5)
 (vector-range -5 10
  (gen-accumulate (rndn 12 -1.0 1.0))))
=> (c3 f3 gs3 e4 bb4 c5 g4 d4 gs4 c4 d4 gs4)
                                     fl
                                     fl
                                                                 fl
Opusmodus                                      vector-range   2

(list-plot (rndn 100) :point-radius 1.5)




(list-plot (vector-range 0.0 5.0 (rndn 200))
 :point-radius 2)
