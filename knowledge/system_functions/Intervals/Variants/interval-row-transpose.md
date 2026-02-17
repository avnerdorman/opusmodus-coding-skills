Opusmodus                                                          interval-row-transpose      1

interval-row-transpose transpose intervals &key mod
[Function]

Arguments and Values:
transpose                an integer (transpose to).
intervals                a list of intervals.
mod                      row size. The default is 12.


Description:

This function transposes a row from an integer which is then applied to the head of the row
altering all subsequent intervals by the same amount.

(interval-row-transpose 2 '(0 1 2 3 4 5 6))
=> (2 3 4 5 6 7 8)

(interval-row-transpose
 0 '(3 -7 8 -2 5 -10 6 -11 9 -4 1))
=> (0 -4 5 11 2 -7 3 -8 6 -1 -10)

(interval-row-transpose
 9 '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12) :mod 14)
=> (9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12)

(interval-row-transpose
 -1 '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12) :mod 14)
=> (-1 11 -10 -2 -13 8 -12 6 7 -9 0 3 -5 -4)

(interval-row-transpose
 -10 '(-9 5 -4 10 -7 2 -6 0 1 -3 8 -11) :mod 11)
=> (-10 6 -5 0 -8 3 -7 1 2 -4 9 1)



Example:

This can be particularly useful in making the kind of tonic sonorities found in the music of
Elliott Carter.

(setf my-air-rnd (rnd-air :seed 45))
=> (0 1 8 5 7 10 9 3 11 4 2 6)

(setf my-air-rnd-p (rnd-air :type :pitch :seed 45))
=> (c4 db4 ab4 f4 g4 bb4 a4 eb4 b4 e4 d4 gb4)
Opusmodus                                                     interval-row-transpose   2

(interval-row-transpose 2 my-air-rnd)
=> (2 3 10 7 9 0 11 5 -1 6 4 8)

(interval-to-pitch (interval-row-transpose 2 my-air-rnd))
=> (c4 d4 f4 eb5 bb5 g6 g6 gb7 b7 bb7 e7 c7 e6)

Note that the pitch output here is cumulative. Use AMBITUS-INTERVAL to avoid a large
interval progression.

(setf row-t (ambitus-interval '(c4 g5)
              (interval-row-transpose 2 my-air-rnd))))
=> (2 3 10 -7 9 0 -11 -5 1 6 4 -8)

(interval-to-pitch row-t)
=> (c4 d4 f4 eb5 ab4 f5 f5 gb4 db4 d4 ab4 c5 e4)
