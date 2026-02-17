Opusmodus                                                                    msec-to-ratio   1

msec-to-ratio n &key ratio bpm
[Function]

Arguments and Values:
n                        an integer or list of integers.
ratio                    a ratio. The default is 1/4.
bpm                      an integer. (beat per minute). The default is 60.


Description:

This function converts milliseconds values to ratios.


Examples:
(msec-to-ratio 1000)
=> 1/4

(msec-to-ratio '(1000 500 333) :bpm 120)
=> (1/2 1/4 1/6)

(msec-to-ratio '(1000 500 333) :bpm 72)
=> (3/10 1/7 1/10)

(msec-to-ratio '((1000 500 100) (500 200 300)))
=> ((1/4 1/8 1/40) (1/8 1/20 1/13))

(msec-to-ratio '((1000 1000 1000) (1000 1000 1000))
                  :ratio 1/8 :bpm 120)
=> ((1/4 1/4 1/4) (1/4 1/4 1/4))

Composers may like to explore time and frequency data as a source for structural ideas. This
website might be invaluable for demonstrating the linkage between such data.
http://www.sengpielaudio.com/calculator-centsratio.htm
