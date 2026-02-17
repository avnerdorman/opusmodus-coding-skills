Opusmodus                                                                    ratio-to-msec   1

ratio-to-msec n &key ratio bpm
[Function]

Arguments and Values:
n                        an integer or list of ratios.
ratio                    a ratio. The default is 1/4.
bpm                      an integer. (beat per minute). The default is 60.


Description:

This function converts frequency ratios to milliseconds values.


Examples:
(ratio-to-msec 1/4)
=> 1000

(ratio-to-msec 1/4 :bpm 120)
=> 500

(ratio-to-msec '(1/20 2/20 2/20))
=> (200 400 400)

(ratio-to-msec '(1/20 2/20 2/20) :bpm 120)
=> (100 200 200)

(ratio-to-msec '((1/4 1/8 1/40) (1/8 1/20 3/40)))
=> ((1000 500 100) (500 200 300))

(ratio-to-msec '((1/4 1/8 1/40) (1/8 1/20 3/40)) :ratio 1/8 :bpm 72)
=> ((5000/3 2500/3 500/3) (2500/3 1000/3 500))


Composers may like to explore time and frequency data as a source for structural ideas. This
website might be invaluable for demonstrating the linkage between such data.
http://www.sengpielaudio.com/calculator-centsratio.htm
