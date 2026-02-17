Opusmodus                                                                         density-analysis        1

density-analysis sequence &key type
[Function]

Arguments and Values:
sequence                   A list representing a musical sequence where elements can vary depending on
                           the type of density being analysed.
type                       An optional keyword that speci es the type of density to calculate. Accepted
                           values are :length, :pitch, :velocity, and NIL. If not provided, the
                           function defaults to NIL, combining all types into a mean density value.

Density Types:
:length                    Analyses the density based on the duration of notes.
:pitch                     Analyses the density based on the diversity and distribution of pitches.
:velocity                  Analyses the density based on the dynamics of notes (softness or loudness).
NIL                        Provides a composite measure derived from the average densities across
                           length, pitch, and velocity.

Description:

The function DENSITY-ANALYSIS provides a quantitative measure of musical density,
which can be integral to both analytical and compositional processes. By analysing the
distribution and frequency of musical elements such as note lengths, pitches, and dynamics,
users can gain insights into the textural and dynamic complexity of musical sequences.


Example:

Length density analysis:

(density-analysis '(s s s s s s s s))
=> 1.0

(density-analysis '(s s -s s -s s -s s))
=> 0.62

(density-analysis '(-q e -e q. s))
=> 0.2

(density-analysis '(e.. s s s q s s s t -t s t))
=> 0.68

(density-analysis '(-q -e -t t t t t t -q -s. t t t))
=> 0.5
                                                  fi
Opusmodus                                               density-analysis   2

(density-analysis
 '((-w) (-w) (-w) (-w) (-h -e -t = -s. t -s. t -s)
   (-t = -s. e s = = = = = = = = = -s.) (-w) (-w) (-w)
   (-h -e -t = = = = = -s. =) (e.. s = = q s = = t - s t)
   (-t s t - s t - s t - s t - s t - s t - s t - = -s)
   (-t = -q -s. e t -s. s -e. t = =)
   (t = = = = = = = = = = = = s -e. s -e. t = =)))
=> (0.0 0.0 0.0 0.0 0.19 0.75 0.0 0.0 0.0 0.38 0.69 0.94 0.44 1.0)

Pitch density analysis:

(density-analysis 'c4e4g4)
=> 0.38888893

(density-analysis 'c4ds4fs4a4)
=> 0.41666666

(density-analysis '((bb3 e3 bb2 a4 b4 d5) (b2 bb2 b3 b4 c7 c5)
                    (eb3 gs3 gs2 a5 cs7 cs4)))
=> ((0.48333335 0.8166667 0.8833334))

Velocity density analysis:

(density-analysis '(pp pp p p mp mp mf mf f f))
=> 0.30833334

(density-analysis '((pp< < < ff> > > > >) (p< < < < mf< < < <)
                    (f> > > > > p p p)))
=> (0.4010417 0.38020834 0.30729166)

OMN density analysis:

(setf
 p00 '(-h.)
 p01 '(q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf
       -e 3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
 p02 '(t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc t fs4 mf leg
       gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg eb5 3q bb5 >
       a4 > bb5 > e a4 pp stacc -e)
 p03 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc e. cs4 marc
       s gs4 leg q gs4 -q)
 p04 '(q. fs5 pp 3e c5 < leg b4 < leg f4 e d5 mf s eb5 leg g5 leg
       bb5 leg a5 e fs5 leg fs5 3e gs4 > stacc c5 > stacc b5 > stacc
       t f5 pp e.. e5)
 p05 '(-q. e d4 pp q. eb5 mf e g4 q bb4 a4)
 p06 '(q cs4 pp -q t gs4 marc e.. fs4 mf leg e c4 -e t b4 leg
       f4 q.. e4 pp)
 p07 '(-q e d4 leg eb4 h g4 mf leg q. g4 > -e)
 p08 '(s bb4 pp leg a4 h. db4 t gs4 mp fs4 < c5 < b4 q f5 marc e5))
Opusmodus                                                           density-analysis   3

(setf pattern (assemble-seq p00 p01 p02 p03 p04 p05 p06 p07 p08))




:type NIL returns a mean value derived from the three main types:

(density-analysis pattern)
=> (0.0 0.34901094 0.47767976 0.33048615 0.4445139
    0.34777775 0.36055556 0.22449076 0.34117284)
Opusmodus                                               density-analysis   4

(density-analysis pattern :type :length)
=> (0.0 0.5 0.71 0.33 0.67 0.21 0.29 0.17 0.38)

(density-analysis pattern :type :pitch)
=> (0.0 0.27272728 0.375 0.33333334 0.36666667
    0.5 0.45833334 0.1388889 0.3333333)

(density-analysis pattern :type :velocity)
=> (0.0 0.27430555 0.34803924 0.32812503 0.296875
    0.33333334 0.33333334 0.36458337 0.3101852)


Relevant Functions
----------------------------------------------------------
FILTER-DENSITY
DENSITY
