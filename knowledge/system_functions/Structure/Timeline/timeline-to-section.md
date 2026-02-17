Opusmodus                                                              timeline-to-section   1

timeline-to-section timeline
[Function]

Arguments and Values:
timeline               symbol list (x -). x equal section number,
                       or binary list (1 0). 1 equal section number.


Description:

Converts timeline format to section number list.


Example:
(timeline-to-section '(xxx--xxxx-xx---xx------xxx-xxxxxxx--xx))
=> (0 1 2 5 6 7 8 10 11 15 16 23 24 25 27 28 29 30 31 32 33 36 37)

(timeline-to-section '(x x x - - x x x x - x x))
=> (0 1 2 5 6 7 8 10 11)

(timeline-to-section '(1 1 1 0 0 1 1 1 1 0 1 1))
=> (0 1 2 5 6 7 8 10 11)

(timeline-to-section '(0 1 0 1 0 1 0 1 0 1 0 1))
=> (1 3 5 7 9 11)

(timeline-to-section '(- x - x - x - x - x - x))
=> (1 3 5 7 9 11)

(timeline-to-section '(111001111011))
=> (0 1 2 5 6 7 8 10 11)

(timeline-to-section
 '((xxxxxxxxxxxxxxxx-x---xxx)
   (xx---xxxxxxxxxxxxxxxxxxx)
   (xxxxxxxxxxxxxxxxxxxxxxxx)
   (xxxxxx----xxxxxxx-xx-xxx)
   (xxxxxxxxxx-x-xxxxxxxxxxx)
   (xx-xx-xxxxxxxxxxxx—x-x--)
   (xxx-xx-xxxxxx-x-x-xxxxxx)))
=> ((0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 17 21 22 23)
    (0 1 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
    (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
    (0 1 2 3 4 5 10 11 12 13 14 15 16 18 19 21 22 23)
    (0 1 2 3 4 5 6 7 8 9 11 13 14 15 16 17 18 19 20 21 22 23)
    (0 1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 19 21)
    (0 1 2 4 5 7 8 9 10 11 12 14 16 18 19 20 21 22 23))
