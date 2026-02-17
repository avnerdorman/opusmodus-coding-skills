Opusmodus                                                                     float-to-ratio   1

float-to-ratio n &key ratio bpm
[Function]

Arguments and Values:
n                         a oating-point number.
ratio                     a ratio. The default is 1/4.
bpm                       an integer. (beat per minute). The default is 60.


Description:

Converts oating point values to ratios.


Examples:
(float-to-ratio 0.33)
=> 1/12

(float-to-ratio '(0.2 0.4 0.4))
=> (1/20 1/10 1/10)

(float-to-ratio '(0.2 0.4 0.4) :ratio 1/1)
=> (1/5 2/5 2/5)

(float-to-ratio '(0.2 0.4 0.4) :bpm 180)
=> (3/20 3/10 3/10)

(float-to-ratio '((0.2 0.4 0.4) (0.33 0.33 0.33) (0.5)))
=> ((1/20 1/10 1/10) (1/12 1/12 1/12) (1/8))

The example above shows how simple oating-point numbers could be used to create ratios
that could be used to design musical phrase structure. Remember velocity values are oating
point numbers.

There are several ways to represent real numbers on computers. Fixed point places a radix
point somewhere in the middle of the digits, and is equivalent to using integers that represent
portions of some unit. For example, one might represent 1/100ths of a unit; if you have four
decimal digits, you could represent 10.82, or 00.01. Another approach is to use rationals,
and represent every number as the ratio of two integers.
   fl
                     fl
                                  fl
                                                                                 fl
Opusmodus                                                                float-to-ratio   2

Using the Kirnberger tuning example we could convert its oating point values to ratios.

(float-to-ratio '(0.0 90.225 193.8783 294.135 386.3137
                  498.045 590.2237 696.6377 792.18
                  889.6827 996.09 1088.2687))
=> (0 203/9 824/17 1103/15 1835/19 5603/45 1328/9
    4354/25 4357/22 4226/19 10957/44 4081/15)




                                                   fl
