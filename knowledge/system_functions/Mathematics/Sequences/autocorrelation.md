Opusmodus                                                                     autocorrelation     1

autocorrelation data
[Function]

Arguments and Values:
data                a sequence of numbers.


Description:

The AUTOCORRELATION function takes a list of numerical data as input and calculates
the autocorrelation values for different lags of the input data. Autocorrelation is a measure
of the similarity between a signal or time series and a lagged version of itself over successive
time intervals. It is a statistical measure that quanti es the extent to which a variable's values
are correlated with its own past values over time. AUTOCORRELATION is often used in time
series analysis to understand the underlying patterns and trends in a dataset.

(setf num (rndn 24 -10 10)
=> (-5 -9 5 1 8 -8 1 -1 -9 -10 4 4 -9 10 -10 -9 4 -5 -6 0 -7 0 6 4)

(autocorrelation num)
=> (1.0151765 -0.20868625 -0.1558232 0.1498604 -0.23008847 -0.20171069
    0.17751824 -0.012725707 -0.11805454 0.24058348 -0.0986312
    0.016496974 0.03220686 -0.0638113 -0.06363413 -0.035435386
    -0.060325377 0.024498329 0.010440929 0.1296873 0.07749194
    -0.02528541 -0.071974926 -0.020186177)

(list-plot
 (autocorrelation (flatten (gen-loop 5 (rnd-row))))
 :join-points t)

   1.2

   1.0

  0.8

  0.6

  0.4

   0.2

  0.0
                   10             20               30          40             50             60
  -0.2

  -0.4
                                              fi
Opusmodus                                                                autocorrelation   2

Differences between the high and low tide levels in the Venice lagoon in 2019:

(setf series '(101 79 86 80 90 145 86 64 76 56 60 76
               79 70 77 76 58 118 108 95 77 142 130 145))

(setf lags (autocorrelation series))

   1.2

   1.0

  0.8

  0.6

  0.4

  0.2

  0.0
                   4                8         12              16         20           24
  -0.2

 -0.4




(setf pitch-profile (vector-to-pitch '(c2 c5) lags))

                                2       3          4      5        6
