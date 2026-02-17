Opusmodus                                                                          gen-tendency     1

gen-tendency n values &key variance type list seed
[Function]

Arguments and Values:
n                       an integer (a sample size).
values                    oating number (greater than zero).
variance                  oating number (greater than zero). The default is 0.1.
type                    :around :above or :below. The default is :around.
list                    NIL or T (each tendency as a list). The default is NIL.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:
The GEN-TENDENCY function generates N samples of given values (floating numbers) with
a tendency (direction) given by the values next to each-other. The :variance is an
additional value for increasing or decreasing the size of the fluctuations :around :above
or :below the tendency values.


Examples:
(gen-tendency 1 '(.3))
=> (0.29397872)

(gen-tendency 2 '(.3))
=> (0.3025233 0.29332578)

(gen-tendency 3 '(.1 .2 .4 .9))
=> (0.14426714 0.29824898 0.6325151)

(gen-tendency 3 '(.1 .2 .4 .9) :list t)
=> ((0.14864373) (0.28626302) (0.62264633))

How it works.
In the next example the values (.1 .2 .4 .9) will create 3 tendency groups:

(.1 .2) (.2 .4) and (.4 .9)
                  fl
                  fl
                                               fi
Opusmodus                                                                 gen-tendency   2

The possible tendency values of N 4 in 3 is:

(1 1 2) or (1 2 1) or (2 1 1)

(gen-tendency 4 '(.1 .2 .4 .9))
=> (0.14974983 0.20703919 0.40744513 0.6226709)

(gen-tendency 4 '(.1 .2 .4 .9) :list t)
=> ((0.15583917) (0.19163068 0.38744956) (0.6622523))
The order (1 2 1) is selected at random:

(.1 .2) = (0.15583917)
(.2 .4) = (0.19163068 0.38744956)
(.4 .9) = (0.6622523)

(gen-tendency 5 '(.1 .2 .4 .9))
=> (0.14324442 0.2004259 0.38904634 0.38662517 0.91766244)

(gen-tendency 5 '(.1 .2 .4 .9) :list t)
=> ((0.14750676) (0.20688045 0.3961046) (0.40451384 0.88213545))

In the example below the list of 10 values will create 9 tendency groups with 2 or 3
tendency values:

(gen-tendency 24 '(.1 .4 .1 .6 .45 .16 .75 .8 1 .1))
=> (0.09755284 0.40647396 0.41514164 0.25146967
    0.09626603 0.101731405 0.3458745 0.5849952
    0.5732197 0.54853994 0.44525683 0.4455172
    0.3197731 0.15781203 0.16389403 0.4497044
    0.7473873 0.7838641 0.7817212 0.76141274
    0.7822219 1.0079482 1.0058099 0.1000852)

(gen-tendency 24 '(.1 .4 .1 .6 .45 .16 .75 .8 1 .1) :list t)
=> ((0.1034663 0.25737536 0.3821386)
    (0.4029612 0.25414562 0.09705795)
    (0.099517845 0.34423387 0.580991)
    (0.5754832 0.54729754 0.46916515)
    (0.44790837 0.16324237)
    (0.15400366 0.43888775 0.76149017)
    (0.77739173 0.8218779)
    (0.83111495 0.8583931 1.0226852)
    (0.95973295 0.09610219))
Opusmodus                                                   gen-tendency   3

With default :variance 0.1:

(list-plot
 (gen-tendency 200 '(.1 .4 .1 .6 .45 .16 .75 .8 1 .1))
 :join-points t)




With :variance 0.5:

(list-plot
 (gen-tendency 200 '(.1 .4 .1 .6 .45 .16 .75 .8 1 .1) :variance 0.5)
 :join-points t)
Opusmodus                                                   gen-tendency   4

With :variance 0.9:

(list-plot
 (gen-tendency 200 '(.1 .4 .1 .6 .45 .16 .75 .8 1 .1) :variance 0.9)
 :join-points t)




Mapping tendency result to pitch symbols:

(setf values '(.1 .4 .2 .6 .45 .16 .75 .8 1 .1))
(setf tendency (gen-tendency 200 values))

(setf pitch (vector-to-pitch '(c2 c7) tendency))
=> (c2 cs2 d2 eb2 eb2 f2 fs2 fs2 gs2 a2 a2 bb2 c3 b2 c3 eb3 eb3
    e3 e3 fs3 gs3 gs3 a3 gs3 g3 fs3 e3 e3 eb3 e3 d3 d3 d3 c3 c3
    c3 bb2 bb2 a2 a2 a2 g2 g2 g2 fs2 gs2 a2 b2 c3 cs3 d3 d3 e3
    f3 g3 a3 b3 b3 c4 eb4 e4 f4 f4 e4 a4 bb4 g4 gs4 g4 a4 g4 fs4
    f4 fs4 fs4 e4 eb4 d4 eb4 d4 cs4 c4 d4 b3 b3 bb3 b3 b3 bb3 b3
    a3 gs3 gs3 f3 fs3 f3 f3 eb3 d3 cs3 c3 bb2 bb2 bb2 gs2 g2 g2
    fs2 f2 e2 e2 fs2 g2 a2 b2 cs3 eb3 fs3 fs3 g3 b3 b3 eb4 d4 f4
    fs4 g4 c5 c5 cs5 f5 f5 gs5 fs5 g5 fs5 e5 g5 a5 fs5 g5 gs5 fs5
    a5 g5 g5 gs5 gs5 bb5 a5 bb5 b5 b5 gs5 gs5 c6 c6 bb5 c6 bb5 c6
    e6 b5 eb6 fs6 cs6 fs6 eb6 eb6 eb6 g6 bb6 a6 b6 c7 a6 b6 gs6
    f6 f6 cs6 cs6 bb5 f5 eb5 cs5 c5 g4 f4 cs4 b3 a3 fs3 f3 d3
    b2 gs2 f2 eb2 c2)

Mapping tendency result to velocity symbols:

(vector-to-velocity 'pp 'f
 (gen-tendency 40 (gen-noise 5 :seed 56)))
=> (f f f mf mf mf mf mp mp mp mp mp mp
    p p p p p p p p p p p p pp pp pp
    pp pp pp pp p p p mp mp mf mf mf)
Opusmodus                                                                  gen-tendency   5

Let us test - see and hear - the 4 examples below with the Snippet command. To audition the
examples the rst thing we need to do is to evaluate the expression values.

(setf values '(.1 .4 .2 .6 .45 .16 .75 .8 1 .1))

With default :variance 0.1:

(make-omn :length '(3e)
          :pitch (filter-repeat 1
                  (tonality-map '(c4e4fs4gs4a4c5d5)
                   (vector-to-pitch '(c2 c7)
                    (gen-tendency 200 values))))
          :span :pitch)

With :variance 0.5 and :type :below:

(make-omn :length '(3e)
          :pitch (filter-repeat 1
                  (tonality-map '(c4e4fs4gs4a4c5d5)
                   (vector-to-pitch '(c2 c7)
                    (gen-tendency 200 values
                                  :variance 0.5 :type :below))))
          :span :pitch)

Here we randomise the values order:

(make-omn :length '(3e)
          :pitch (filter-repeat 1
                  (tonality-map '(c4e4fs4gs4a4c5d5)
                   (vector-to-pitch '(c2 c7)
                    (gen-tendency 200 (rnd-order values)
                                  :variance 0.8 :type :above))))
          :span :pitch)

In the following examples we generate the values using GEN-NOISE function:

(make-omn :length '(3e)
          :pitch (filter-repeat 1
                  (tonality-map '(c4e4fs4gs4a4c5d5)
                   (vector-to-pitch '(c2 c7)
                    (gen-tendency 200 (gen-noise 7)
                                  :variance 0.05))))
          :span :pitch)
       fi
