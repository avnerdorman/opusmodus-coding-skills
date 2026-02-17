Opusmodus                                                                    interval-class    1

interval-class intervals
[Function]

Arguments and Values:
intervals                 list of intervals.


Description:

In musical set theory, an interval class also known as unordered pitch-class interval, interval
distance, undirected interval as 'interval mod 6', is the shortest distance in pitch class space
between two unordered pitch classes. For example, the interval class between pitch classes 4
and 9 is 5 because 9 − 4 = 5 is less than 4 − 9 = −5 ≡ 7 (mod 12). The largest interval class is
6 since any greater interval n may be reduced to 12 − n.


Example:
(interval-class '(0 1 2 11 10 9 5 4 3 6 7 8))
=> (1 1 3 1 1 4 1 1 3 1 1)

(interval-class '(0 1 3 8 4 9 10 7 6 5 11 2))
=> (1 2 5 4 5 1 3 1 1 6 3)

(interval-class '(0 11 5 7 6 1 3 4 2 9 8 10))
=> (1 6 2 1 5 2 1 2 5 1 2)
