     Opusmodus                                                                       find-below   1

     find-below n list &key first
     [Function]

     Arguments and Values:
     n                        a number.
     list                     a list of numbers.
     first                    NIL or T. The default is NIL.


     Description:

     This function returns numbers in a list below a certain value.

     (find-below 5 '(9 1 6 7 4 5 2 3 8))
     => (1 4 2 3)

     To return only the rst value below N, use :first T.

     (find-below 5 '(1 2 3 4 5 6 7 8 9) :first t)
     => 4


     Examples:

     Use this or its partner function FIND-ABOVE to split an integer stream into different 'voices'
     having a lower and higher range. See the example below showing how to create two voices
     from one data stream. This is an example of how to create two 'voices' in a hocketing texture.
     The rst is the higher of the two voices.

     (setf lis '(9 1 6 7 4 5 2 3 8))

     (setf map-1 (gen-binary-remove (find-below 5 lis) lis))
     => (1 0 1 1 0 1 0 0 1)

     (binary-map map-1 (integer-to-pitch lis))
     => (a4 gb4 g4 f4 ab4)

     (binary-map map-1 's)
     => (1/16 -1/16 1/16 1/16 -1/16 1/16 -1/16 -1/16 1/16)
fi
                  fi
Opusmodus                                                 find-below   2

Here's the second and lower voice.

(setf map-2 (gen-binary-remove (find-above 5 lis) lis))
=> (0 1 0 0 1 1 1 1 0)

(binary-map map-2 (integer-to-pitch lis))
=> (db4 e4 f4 d4 eb4)

(binary-map map-2 's)
=> (-1/16 1/16 -1/16 -1/16 1/16 1/16 1/16 1/16 -1/16)
