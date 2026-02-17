Opusmodus                                                                  radian-to-hertz   1

radian-to-hertz n &key sample-rate
[Function]

Arguments and Values:
n                         a number or a list of numbers.
sample-rate               a number. The default is 44100.


Description:

This function converts angular velocity in radian per second (rad/s) to frequency in hertz
(Hz).

(radian-to-hertz 0.062689)
=> 439.99734

1 Hz = 2π rad/s = 6.2831853 rad/s

(radian-to-hertz 1 :sample-rate 1)
=> 0.159155


Examples:
(radian-to-hertz '(0.167967 0.363168 0.185797 0.235347))
=> (1178.9156 2548.9792 1304.0596 1651.8378)
