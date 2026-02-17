Opusmodus                                                                     interference3   1

interference3 sequence
[Function]

Arguments and Values:
sequence                  3 integer list.


Description:

When calculating the interference of three integers there are two possible results ie. the
interference could be described in two ways.

     Example of interference (5 3 2)

1) Method 1, is the same as the function INTERFERENCE2. In other words if you type in 3
integers the result will be calculated as method 1.

     6 repetitions of the pulse 5
     10 repetitions of the pulse 3
     15 repetitions of the pulse 2

2) Method 2 represents the function INTERFERENCE2.

     5 repetitions of the pulse 6
     3 repetitions of the pulse 10
     2 repetitions of the pulse 15

As you can see method 2 is the reverse or the complimentary of Method 1. 3 repetitions of
10 as opposed to 10 repetitions of 3. In general the results of Method 2
(INTERFERENCE2) contains larger numbers than that of Method 1.

(interference3 '(5 3 2))
=> (6 4 2 3 3 2 4 6)

(interference3 '(8 5 3))
=> (15 9 6 10 5 3 12 12 3 5 10 6 9 15)

(interference3 '(17 11 7))
=> (77 42 35 33 44 7 70 49 17 11 77 14 63 22 34 21 77
    21 34 22 63 14 77 11 17 49 70 7 44 33 35 42 77)
Opusmodus                                                                   interference3   2

Examples:

Here is a demonstration of how an interference sequence could be transferred to create
phrases of note length and note length rests.

(setf 7-is3 (interference3 '(5 3 2)))
=> (6 4 2 3 3 2 4 6)

Using the function GEN-LENGTH to make the conversion to lengths:

(gen-length 7-is3 8)
=> (3/4 1/2 1/4 3/8 3/8 1/4 1/2 3/4)

(gen-length 7-is3 16)
=> (3/8 1/4 1/8 3/16 3/16 1/8 1/4 3/8)

(gen-length 7-is3 '(8 16))
=> ((3/4 1/2 1/4 3/8 3/8 1/4 1/2 3/4)
    (3/8 1/4 1/8 3/16 3/16 1/8 1/4 3/8))

Now to add rest lengths into the rhythmic phrases. Note that series suggested in the rst
argument of LENGTH-REST-SERIES runs through the output lists:

(length-rest-series
 '(1 2 1 3 2 4) (gen-length 7-is3 '(8 16)))
=> ((-3/4 1/2 -1/4 -3/8 3/8 1/4 -1/2 3/4)
    (-3/8 1/4 1/8 3/16 -3/16 1/8 1/4 3/8))
                                                                             fi
