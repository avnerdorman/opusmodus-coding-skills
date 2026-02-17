Opusmodus                                                section-to-timeline   1

section-to-timeline list &key binary explode
[Function]

Arguments and Values:
list                     an integer list.
binary                   T or NIL. The default is NIL.
explode                  T or NIL. The default is NIL.


Description:

Converts section number list to timeline formats.


Example:
(section-to-timeline
 '(0 1 2 5 6 7 8 10 11 15 16 23 24 25 27 28 29 30 31 32 33 36 37))
=> (xxx--xxxx-xx---xx------xxx-xxxxxxx--xx)

(section-to-timeline '(0 1 2 5 6 7 8 10 11))
=> (xxx--xxxx-xx)

(section-to-timeline '(0 1 2 5 6 7 8 10 11) :binary t)
=> (111001111011)

(section-to-timeline '(0 1 2 5 6 7 8 10 11) :binary t :explode t)
=> (1 1 1 0 0 1 1 1 1 0 1 1)

(section-to-timeline
 '((0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 17 21 22 23)
   (0 1 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
   (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
   (0 1 2 3 4 5 10 11 12 13 14 15 16 18 19 21 22 23)
   (0 1 2 3 4 5 6 7 8 9 11 13 14 15 16 17 18 19 20 21 22 23)
   (0 1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 19 21)
   (0 1 2 4 5 7 8 9 10 11 12 14 16 18 19 20 21 22 23)))
=> ((xxxxxxxxxxxxxxxx-x---xxx)
    (xx---xxxxxxxxxxxxxxxxxxx)
    (xxxxxxxxxxxxxxxxxxxxxxxx)
    (xxxxxx----xxxxxxx-xx-xxx)
    (xxxxxxxxxx-x-xxxxxxxxxxx)
    (xx-xx-xxxxxxxxxxxx-x-x)
    (xxx-xx-xxxxxx-x-x-xxxxxx))
