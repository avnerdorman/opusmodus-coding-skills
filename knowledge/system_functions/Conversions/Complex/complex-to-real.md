Opusmodus                                                                        complex-to-real   1

complex-to-real complex
[Function]

Arguments and Values:
complex                          A list of complex numbers. Each element in the list should be
                                 a complex number from which the real part will be extracted.


Description:

Converts a list of complex numbers to a list of their real parts.

(complex-to-real '(#C(-2.5521299839019825D0 2.725165003280214D0)
                   #C(-1.9904654026031459D0 1.392790020354448D0)
                   #C(4.4728901386261D0 1.7098078722567718D-15)
                   #C(-1.9904654026031499D0 -1.392790020354464D0)
                   #C(-2.5521299839019616D0 -2.7251650032802237D0)))
=> (-2.5521299839019825D0
    -1.9904654026031459D0
    4.4728901386261D0
    -1.9904654026031499D0
    -2.5521299839019616D0)
