Opusmodus                                                              twelve-tone-filter    1

twelve-tone-filter sequence &key segment rest
[Function]

Arguments and Values:
sequence                 list of pitches.
segment                  an integer from 1 to 12. The default is 12.
rest                     NIL or T. The default is NIL.


Description:

The function TWELVE-TONE-FILTER provides an ef cient way to analyse the interval
content of list of pitches.

(twelve-tone-filter '(e4 bb4 cs6 eb4 f4 d7 gb4 gs4 a3
                        b4 a4 g4 c4 fs4 fs5 fs6 d4))
=> (4 10 1 3 5 2 6 8 9 11 7 0)

In the integer model of pitch, all pitch classes and intervals between pitch classes are
designated using the numbers 0 through 11. It is a common analytical and compositional
tool when working with chromatic music, including twelve-tone, serial, or otherwise atonal
music.


Examples:

The function can divide its interval analysis into hexachords, as the two examples below
illustrate. Notice how the keywords :segment and :rest are used.

(twelve-tone-filter '(e4 bb4 cs6 eb4 f4 d7 gb4 gs4 a3
                      b4 a4 g4 c4 fs4 fs5 fs6 d4) :segment 6)
=> (4 10 1 3 5 2)

(twelve-tone-filter '(e4 bb4 cs6 eb4 f4 d7 gb4 gs4 a3
                      b4 a4 g4 c4 fs4 fs5 fs6 d4) :segment 6 :rest t)
=> (6 8 9 11 7 0)

Analysis can be adjusted to non-standard groupings:

(twelve-tone-filter '(e4 bb4 cs6 eb4 f4 d7 gb4 gs4 a3
                      b4 a4 g4 c4 fs4 fs5 fs6 d4) :segment 5)
=> (4 10 1 3 5)

(twelve-tone-filter '(e4 bb4 cs6 eb4 f4 d7 gb4 gs4 a3
                      b4 a4 g4 c4 fs4 fs5 fs6 d4) :segment 5 :rest t)
                                                    fi
Opusmodus                                              twelve-tone-filter   2

The function can also be used to analyse OMN lists.

(twelve-tone-filter '(h e4 bb4 q cs6eb4 e f4d7 s gb4
                      gs4 a3 b4 g4 c4 fs4 fs5 fs6 q d4))
=> (4 10 1 3 5 2 6 8 9 11 7 0)
