Opusmodus                                                         gen-binary-interval     1

gen-binary-interval interval &optional number
[Function]

Arguments and Values:
interval                a list of numbers.
number                  a number.


Description:

The GEN-BINARY-INTERVAL function creates a binary series where every interval
series starts with a number 1 (or optional number) followed by 0 (zeros). The length of
the list is the sum of the interval numbers.

(gen-binary-interval '(4 6 8 2 3))
=> (1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0)

The same interval values as above with the optional number 2:

(gen-binary-interval '(4 6 8 2 3) 2)
=> (2 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0 2 0 2 0 0)


Example:
(binary-layer
 (list
  (gen-binary-interval (gen-rotate 0 '(4 6 8 2 3)) 1)
  (gen-binary-interval (gen-rotate 2 '(4 6 8 2 3)) 2)
  (gen-binary-interval (gen-rotate 1 '(4 6 8 2 3)) 3)
=> (1 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)
