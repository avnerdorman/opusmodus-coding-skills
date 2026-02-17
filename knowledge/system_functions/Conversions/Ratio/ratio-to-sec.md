Opusmodus                                                                     ratio-to-sec   1

ratio-to-sec n &key ratio bpm
[Function]

Arguments and Values:
n                         an integer or list of ratios.
ratio                     a ratio. The default is 1/4.
bpm                       an integer. (beat per minute). The default is 60.


Description:

This function converts ratios to seconds values.


Examples:
(ratio-to-sec 1/4)
=> 1.0

(ratio-to-sec '(1/20 2/20 2/20))
=> (0.2 0.4 0.4)

(ratio-to-sec '(1/20 2/20 2/20) :bpm 120)
=> (0.4 0.8 0.8)

(ratio-to-sec '((1/20 2/20 2/20) (1/12 1/12 1/12)))
=> ((0.2 0.4 0.4) (0.333 0.333 0.333))

(ratio-to-sec '((1/20 2/20 2/20) (1/12 1/12 1/12)) :ratio 1/8)
=> ((0.4 0.8 0.8) (0.667 0.667 0.667))

See the help documents for RATIO-TO-MSEC. Composers may like to explore frequency
data and time as a source for structural and parametric ideas. This website might be
invaluable for demonstrating the linkage between such data.
http://www.sengpielaudio.com/calculator-centsratio.htm
