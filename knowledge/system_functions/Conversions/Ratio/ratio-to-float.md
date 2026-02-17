Opusmodus                                                                     ratio-to-float   1

ratio-to-float n &key ratio bpm
[Function]

Arguments and Values:
n                         an integer or list of ratios.
ratio                     a ratio. The default is 1/4.
bpm                       an integer. (beat per minute). The default is 60.


Description:

Converts ratios to oating point values.


Examples:
(ratio-to-float 1/12)
=> 0.333

(ratio-to-float '(1/20 1/10 1/10))
=> (0.2 0.4 0.4)

(ratio-to-float '(1/5 2/5 2/5))
=> (0.8 1.6 1.6)

(ratio-to-float '(3/20 3/10 3/10) :bpm 180)
=> '(0.2 0.4 0.4)

(ratio-to-float '((1/20 1/10 1/10) (1/12 1/12 1/12) (1/8)))
=> ((0.2 0.4 0.4) (0.333 0.333 0.333) (0.5))

There are several ways to represent real numbers on computers. Fixed point places a radix
point somewhere in the middle of the digits, and is equivalent to using integers that represent
portions of some unit. For example, one might represent 1/100ths of a unit; if you have four
decimal digits, you could represent 10.82, or 00.01. Another approach is to use rationals, and
represent every number as the ratio of two integers.
               fl
Opusmodus                                                                ratio-to-float   2



Using the Kirnberger tuning example we could convert its usual ratio format into oating
point values.

(ratio-to-float '(1 256/243 9/8 32/27 5/4 4/3 45/32
                   3/2 128/81 16771/10000 16/9 15/8))
=> (4.0 4.214 4.5 4.741 5.0 5.333 5.625 6.0 6.321 6.708 7.111 7.5)

(vector-round 0 12 '(4.0 4.214 4.5 4.741 5.0 5.333
                     5.625 6.0 6.321 6.708 7.111 7.5))
=> (0 1 2 3 3 5 6 7 8 9 11 12)




                                                                         fl
