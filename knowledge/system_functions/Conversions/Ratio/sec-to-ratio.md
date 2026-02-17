Opusmodus                                                                     sec-to-ratio   1

sec-to-ratio n &key ratio bpm
[Function]

Arguments and Values:
n                         an integer or list of numbers.
ratio                     a ratio. The default is 1/4.
bpm                       an integer. (beat per minute). The default is 60.


Description:

This function converts seconds values to ratios.


Examples:
(sec-to-ratio 1.0)
=> 1/4

(sec-to-ratio '(0.2 0.4 0.4))
=> (1/20 1/10 1/10)

(sec-to-ratio '(0.2 0.4 0.4) :bpm 120)
=> (1/10 1/5 1/5)

(sec-to-ratio '((0.2 0.4 0.4) (0.33 0.33 0.33) (0.5)))
=> ((1/20 1/10 1/10) (1/12 1/12 1/12) (1/8))

(sec-to-ratio '((0.2 0.4 0.4) (0.33 0.33 0.33)) :bpm 120)
=> ((1/10 1/5 1/5) (1/6 1/6 1/6))

See the help documents for RATIO-TO-SEC. Composers may like to explore time and
frequency data as a source for structural and parametric ideas. This website might be
invaluable for demonstrating the linkage between such data.
http://www.sengpielaudio.com/calculator-centsratio.htm
