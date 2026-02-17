Opusmodus                                                              hertz-to-radian    1

hertz-to-radian x &key sample-rate
[Function]

Arguments and Values:
x                       a number or a list of numbers.
sample-rate             a number. The default is 44100.


Description:

This function converts frequency in hertz (Hz) to angular velocity in radian per second
(rad/s).

(hertz-to-radian 440)
=> 0.062689

1 Hz = 2π rad/s = 6.2831853 rad/s

(hertz-to-radian 1 :sample-rate 1)
=> 6.283185


Examples:
(hertz-to-radian '(1178.9136 2548.98 1304.0593 1651.8359))
=> (0.167967 0.363168 0.185797 0.235347)
