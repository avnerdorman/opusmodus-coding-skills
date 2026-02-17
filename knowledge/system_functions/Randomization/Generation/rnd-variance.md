Opusmodus                                                                                rnd-variance     1

rnd-variance value variance &key type seed

[Function]

Arguments and Values:
value                         a oating number.
variance                      a oating number.
type                          :around :above or :below. The default is :around.
seed                          This is an integer that guarantees consistent results each time the code is
                              evaluated. By providing a speci c seed, you can ensure that the randomness in
                              your code is reproducible. The default value for seed is NIL, which means the
                              seed is not set, resulting in different outputs on each run due to natural
                              randomness.


Description:

This function returns a random oating number below, above or around a given value.

(rnd-variance 0.3 .1)
=> 0.2873123

(rnd-variance 0.3 .1 :type :above)
=> 0.31935114

(rnd-variance 0.3 .1 :type :below)
=> 0.2792454


Examples:

A :seed can also be set to ensure the same result each time the code is evaluated.

(rnd-variance 0.67 .1 :seed 765)
=> 0.6379429

(rnd-variance '(.3 .2 .5 .7 .1) .1 :type :above :seed 45)
=> (0.30191597 0.21447599 0.5098131 0.7311327 0.109751835)
                    fl
                    fl
                         fl
                                                     fi
