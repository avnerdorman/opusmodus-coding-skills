Opusmodus                                                           difference   1

difference sequence &key start end lag
[Function]

Arguments and Values:
sequence              a sequence of numbers.
start                 start index. The default is 0.
end                   end index plus 1.
lag                   lag for differencing. The default is 1.


Description:

Returns a sequence of length (- end start lag) with lag-th order difference of
sequence from index start to index end-1.

(difference '(1 2 4 5 7 9 11))
=> (1 2 1 2 2 2)

(difference '(1 2 4 -5 7 9 -11))
=> (1 2 -9 12 2 -20)

(difference '(1 2 4 5 7 9 11) :start 3)
=> (2 2 2)
