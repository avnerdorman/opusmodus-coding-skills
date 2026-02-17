Opusmodus                                                                       cumulative-sums   1

cumulative-sums sequence &key start end
[Function]

Arguments and Values:
numbers                 a sequence of numbers.
start                   start index of sequence to be used. The default is 0.
end                     1 + end index of sequence to be used.
                        The default is the length of the sequence.


Description:

Returns sequence with cumulative sum of elements in speci ed subsequence.

(cumulative-sums '(2 3 4))
=> (2 5 9)

(cumulative-sums '(2 3 4) :start 1)
=> (3 7)

(cumulative-sums '(2 5 9 11 14 18 20 23) :end 5)
=> (2 7 16 27 41)

(cumulative-sums '(2 5 9 11 14 18 20 23) :start 2 :end 5)
=> '(9 20 34)


Example:
(cumulative-sums (rndn 10 -1.0 1.0))
=> (-0.32140082 -0.928878 -0.29896694 0.3788038 0.9125022
    1.5120397 1.6170708 0.94851595 1.8562555 2.7714977)
                                                         fi
