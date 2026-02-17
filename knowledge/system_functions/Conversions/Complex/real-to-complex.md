Opusmodus                                                                          real-to-complex        1

real-to-complex numbers
[Function]

Arguments and Values:
numbers                  A list of real numbers. Each element in the list is a real number that will be
                         converted into a complex number.


Description:

Converts a list of real numbers into a list of complex numbers, each with the imaginary part
set to 0.0.

(real-to-complex '(-2.5521299839019825D0
                   -1.9904654026031459D0
                   4.4728901386261D0
                   -1.9904654026031499D0
                   -2.5521299839019616D0))
=> (#C(-2.5521299839019825D0 0.0D0)
    #C(-1.9904654026031459D0 0.0D0)
    #C(4.4728901386261D0 0.0D0)
    #C(-1.9904654026031499D0 0.0D0)
    #C(-2.5521299839019616D0 0.0D0))
