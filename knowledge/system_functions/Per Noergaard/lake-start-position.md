Opusmodus                                                                   lake-start-position    1

lake-start-position size step series-length &key type
[Function]

Arguments and Values:
size                    Integer. The size of the ‘tone lake’.
start                   Integer. The step size for generating positions.
series-length           Integer, The length of the series for the rst ‘lake’. The default is 1.
type                    The type (1, 2 or 3) of calculation to be used for generating positions.
                        The default is 3.


Description:

This function generates starting positions for a TONE-LAKES function.


Examples:
(lake-start-position 12 4 3)
=> (0 6 1 7)

(lake-start-position 36 4 3)
=> (0 18 3 21)

(lake-start-position 108 4 3)
=> (0 54 9 63)

(lake-start-position 324 4 3)
=> (0 162 27 189)

Examples with TONE-LAKES function:

(setf lake1 (tone-lakes 12 '(0 -14 -7) (lake-start-position 12 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic
                        '(p i ri r) :ambitus '(c2 b6)))

(setf lake2 (tone-lakes 36 '(0 -14 -7) (lake-start-position 36 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic
                        '(i p r ri) :ambitus '(c2 b6)))

(setf lake3 (tone-lakes 108 '(0 -14 -7) (lake-start-position 108 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic
                        '(p i ri r) :ambitus '(c2 b6)))

(setf lake4 (tone-lakes 324 '(0 -14 -7) (lake-start-position 324 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic
                        '(i p r ri) :ambitus '(c2 b6)))
                                                        fi
Opusmodus                                             lake-start-position   2

(lake-everyother 108 0 3 lake3) ; every 3rd of lake 3, same as lake 2
(lake-everyother 108 0 9 lake3) ; every 9th of lake 3, same as lake 1
(lake-everyother 324 0 3 lake4) ; every 3rd of lake 4, same as lake 3
(lake-everyother 324 0 9 lake4) ; every 9th of lake 4, same as lake 2
(lake-everyother 324 0 27 lake4) ; every 27th of lake 4, same as lake 1
