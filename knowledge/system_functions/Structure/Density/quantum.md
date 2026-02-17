Opusmodus                                                                                  quantum   1

quantum sequence &key fraction prob quantize tolerance
                               legato span prob seed

[Function]

Arguments and Values:
sequence                a sequence (omn-form).
fraction                a oating point value. The default is 0.1.
prob                    a oating point value between 0.1 and 0.9. The default is 0.5.
quantize                a list of integers. The default is '(1 2 3 4 5 6 7 8).
tolerance               a oating-point number. The default is 0.05.
legato                  T or NIL. The default is NIL.
span                    T or NIL. The default is NIL.
prob                    a oating-point number (probability value) between 0.0 and 1.0.
                        The default is 0.5.
seed                    an integer. Ensures the same result each time the code is evaluated.
                        The default is NIL.

Quantize Values:

1 = 1/4
2 = 1/8
3 = 1/12
4 = 1/16
5 = 1/20
7 = 1/28
8 = 1/32


Description:

The QUANTUM function will increase or decrease length values by a given fraction value.
The built-in quantize option will rewrite the lengths back to ‘readable’ values.


Examples:
(setf mat '(e c4 d4 cs4 gs4 g4 e4 b4 bb4 a4 f4 eb4 fs4))
                   fl
                   fl
                   fl
                   fl
Opusmodus                                                                        quantum   2

If a :fraction value is not given, the 0.1 value is used by default and it will increase
every length value between 0.0 and 0.1 randomly.

(quantum mat)




The :span option will preserve the original bar span:

(quantum mat :span t)




In this example the :quantize option is set to 1 = 1/4, 2 = 1/8 and 4 = 1/16:

(quantum mat :quantize '(1 2 4))




Decreasing the length values between -0.2 and 0.0:

(quantum mat :fraction -0.2 :quantize '(1 2 4))
Opusmodus                                                                    quantum     3

The :legato option will extend the length-note with a sum of length-rests in sequence:

(quantum mat :fraction -0.2 :quantize '(1 2 4) :legato t)




Increasing the probability closer to value -0.2:

(quantum mat :fraction -0.2 :prob 0.7 :quantize '(1 2 4))




(quantum mat :fraction -0.2 :prob 0.7
             :quantize '(1 2 4) :span t)




(setf p1 '(q d4 pp s eb4 leg g4 p leg bb4 leg a4 q. cs5 mf
           -e 3q gs5 leg fs5 leg c5 b4 ff leg f4 leg e4))

(setf p2 '(t d4 p leg eb4 leg g4 leg bb4 f q. a4 marc
           t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg
           d5 leg eb5 f 3q bb5 a4 bb5 e a4 pp stacc -e))

(setf p3 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc
           e. cs4 marc s gs4 leg q gs4 -q))

(setf p4 '(q. fs5 pp 3e c5 leg b4 leg f4 e d5 mf s eb5 leg
           g5 leg bb5 leg a5 e fs5 leg fs5 3e gs4 > stacc
           c5 stacc b5 stacc t f5 pp e.. e5))
Opusmodus                                   quantum   4

(setf patterns (list p1 p2 p3 p4))




(quantum patterns :quantize '(1 2 3 4 5))
Opusmodus                                                    quantum   5

Relevant Functions
----------------------------------------------------------
DENSITY
QUANTIZE

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Density/
