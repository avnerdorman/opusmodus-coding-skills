Opusmodus                                                                          gen-lake-size   1

gen-lake-size lake size series
[Function]

Arguments and Values:
leak                          Integer. A leak number.
size                          Integer. Number of return series.
series                        Integer. Initial value for the series calculation.


Description:

This function calculates the ‘lake size’ based on a speci c formula involving the lake,
size, and series arguments.


Examples:

First lake with 4 3-series:

(gen-lake-size 1 3 4)
=> 12

Fourth lake with 4 3-series:

(gen-lake-size 4 3 4)
=> 324

Second lake with 8 7-series:

(gen-lake-size 2 7 8)
=> 392

Fourth lake with 2 3-series:

(gen-lake-size 4 3 2)
=> 162
                                                           fi
