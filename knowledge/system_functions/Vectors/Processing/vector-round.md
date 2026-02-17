Opusmodus                                                                 vector-round      1

vector-round low high vector
[Function]

Arguments and Values:
low                     lower scaling limit.
high                    upper scaling limit.
vector                  a vector array or list.


Description:

The function VECTOR-ROUND will scale a vector array or list or values between two
upper and lower limits. The output is itself a vector array or list comprising of integer
values.

(vector-round -5 10 (gen-noise 10))
=> (0 3 10 7 -4 -3 -5 -4 7 6)

(vector-to-pitch '(c3 c5)
 (vector-round 0 12
  (gen-accumulate (rndn 12 -1.0 1.0))))
=> (c3 d3 c3 fs3 e3 fs3 bb3 d4 fs4 e4 fs4 c5)


Examples:

In the following examples we use LIST-PLOT function to visualise the input (blue) and the
result (red) in a graph.

(setf num (rndn 12 -5 12))
(setf round (vector-round -0.5 3.5 num))
Opusmodus                                                                 vector-round     2

(list-plot (list num round)
           :zero-based t :point-radius 2 :join-points t)


    1010


     88


     66


     44


     22


     00
             11        22   33    44     55   66         77    88   99         10
                                                                                10   11
                                                                                      11
    -2-2


    -4-4


    -6-6




(setf num2 (rndn 32 -1.0 1.0))
(setf round2 (vector-round -0.2 0.2 num2))

(list-plot (list num2 round2)
           :zero-based t :point-radius 2 :join-points t)


   1.01.0

   0.80.8

   0.60.6

   0.40.4

   0.20.2

   0.00.0
                  55        10
                             10        15
                                        15         20
                                                    20        25
                                                               25        30
                                                                          30         35
                                                                                      35
  -0.2-0.2

  -0.4-0.4

  -0.6-0.6

  -0.8-0.8
Opusmodus                                                    vector-round    3

(setf wnoise (gen-noise 100 :seed 6562))

(list-plot
 (list wnoise (vector-round -5 10 wnoise))
 :point-radius 1.5 :zero-based t :point-radius 2 :join-points t)


   10.10.


    8.8.


    6.6.


    4.4.


    2.2.


    0.0.
            10
             10   20
                   20   30
                         30   40
                               40   50
                                     50    60
                                            60   70
                                                  70   80
                                                        80    90
                                                               90    100
                                                                       100
   -2.-2.


   -4.-4.


   -6.-6.
