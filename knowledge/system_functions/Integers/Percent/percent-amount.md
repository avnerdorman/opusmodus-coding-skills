Opusmodus                                                                 percent-amount   1

percent-amount amount percent
[Function]

Arguments and Values:
amount             an integer.
percent            an integer.


Description:

The PRECENT-AMOUNT function is able to scale an integer.

(percent-amount 100 10)
=> 1000

(percent-amount 75 50)
=> 150

This function provides an additional tool for working with percentages on integer lists.
Instead of dividing as in the percent function the function PERCENT-AMOUNT multiplies.
Thus, in the rst example the number 100 is multiplied by 10 percent giving the number
1000. This could be used as an upward scaling feature.


Examples:

In the example below a series of numbers have been generated between two low values. To
scale these numbers up to be useful as a dynamic contour of velocity values a gure of 15
percent is chosen.

(setf r-numbers (rndn 32 0 12))
=> (2 11 8 3 5 8 11 2 10 9 5 9 4 8 9 9 9
    10 1 11 4 2 11 10 5 10 9 6 9 6 3 3)

(percent-amount r-numbers 15)
=> (13 73 53 20 33 53 73 13 67 60 33 60 27 53 60 60
    60 67 7 73 27 13 73 67 33 67 60 40 60 40 20 20)
      fi
                                                                     fi
