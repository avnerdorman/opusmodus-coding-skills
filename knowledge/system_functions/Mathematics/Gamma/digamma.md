Opusmodus                                                                               digamma      1

digamma x &key recursion small
[Function]

Arguments and Values:
x                       a sequence of positive numbers.
recursion               if small < x < recursion, recursive formula is used. The default in 100.0.
small                   if x <= small, small x approximation is used. The default in 1.0.


Description:

Returns value of DIGAMMA (psi, derivative of log(gamma)) function at x.

(digamma '(1 4 3 7 5 8))
=> (-0.5772156649015329D0 1.2561176684318005D0 0.9227843350984671D0
      1.8727843350984672D0 1.5061176684318005D0 2.01564147795561D0)
