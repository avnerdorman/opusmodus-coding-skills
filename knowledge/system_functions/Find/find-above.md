     Opusmodus                                                                       find-above   1

     find-above n list &key first
     [Function]

     Arguments and Values:
     n                        a number.
     list                     a list of numbers.
     first                    NIL or T. The default is NIL.


     Description:

     This function returns numbers in a list above a certain value.

     (find-above 5 '(9 1 6 7 4 5 2 3 8))
     => (9 6 7 8)

     To return only the rst value above n, use :first T.

     (find-above 5 '(1 2 3 4 5 6 7 8 9) :first t)
     => 6


     Examples:

     Use this or its partner function FIND-BELOW to split an integer stream into different 'voices'
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
Opusmodus                                                 find-above   2

Here's the second and lower voice.

(setf map-2 (gen-binary-remove (find-above 5 lis) lis))
=> (0 1 0 0 1 1 1 1 0)

(binary-map map-2 (integer-to-pitch lis))
=> (db4 e4 f4 d4 eb4)

(binary-map map-2 's)
=> (-1/16 1/16 -1/16 -1/16 1/16 1/16 1/16 1/16 -1/16)
