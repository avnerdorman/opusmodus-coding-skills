Opusmodus                                                                     find-between   1

find-between low high list
[Function]

Arguments and Values:
low                      a number.
high                     a number.
list                     a list of numbers.


Description:

This function returns all numbers that lie between the low and high values.

(find-between 2 5 '(4 1 2 6 7 8 9 3))
=> (4 2 3)


Examples:

Use this function to create three 'voices' from a single data stream. The example below
demonstrates how to extract the 'inner' voice.

(setf lis '(9 1 6 7 4 5 2 3 8))

(setf map-2 (gen-binary-remove (find-between 2 5 lis) lis))
=> (1 1 1 1 0 0 0 0 1)

(binary-map map-2 (integer-to-pitch lis))
=> (a4 db4 gb4 g4 ab4)

(binary-map map-2 's)
=> (1/16 1/16 1/16 1/16 -1/16 -1/16 -1/16 -1/16 1/16)
