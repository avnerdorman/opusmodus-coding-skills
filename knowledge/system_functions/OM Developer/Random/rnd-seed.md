Opusmodus                                                                       rnd-seed   1

rnd-seed n
[Function]

Arguments and Values:
n                        a number or NIL.


Description:

To add a seed to your own function and make it work you need to follow the three simple
rules:

add keyword seed into the function arguments: &key seed

next:
(let (state)
(setf state *init-seed*)
(setf seed (rnd-seed seed))

The code above should be placed at the beginning of the function. Nested functions that use
seed need to use a seed function and not a seed argument. The (init-state state)
should be placed after the random function. The sequential seed numbers give us greater
control if a seed needs to be changed or a new one added. All other init-seeds stay
unchanged and in the same sequential position.


Examples:

Function example with embedded RND-SEED function:

(defun rnd-foo (n sequence &key seed)
  (let (state)
    (setf state *init-seed*)
    (setf seed (rnd-seed seed))
    (do-verbose ("rnd-foo seed: ~s" seed)
      (let ((result (loop repeat n
                      collect (rnd-pick sequence :seed (seed)))))
        (init-state state)
        result))))

Each time we evaluate the expression we get a different result:

(rnd-foo 5 '(1 2 3 4 5))
=> (4 5 5 3 2)
Opusmodus                                                            rnd-seed   2

Adding seed to the expression will produce always the same result:

(rnd-foo 5 '(1 2 3 4 5) :seed 748)
=> (5 3 1 2 3)

Test:

(progn
  (init-seed 1)
  (rnd-sample 4 '(1 2 3 4))
  (gen-loop 4 (rnd-sample 4 '(1 2 3 4)) :seed 567)
  (rnd-sample 4 '(1 2 3 4))
  (rnd-sample 4 '(1 2 3 4) :seed 67538)
  (rnd-sample 4 '(1 2 3 4) :seed 345)
  (rnd-sample 4 '(1 2 3 4))
  (rnd-sample 4 '(1 2 3 4))
  (rnd-pick '(1 2 3 4) :seed 9756)
  (rnd-pick '(1 2 3 4))
  (rnd-pick '(1 2 3 4))
  (rnd-pick '(1 2 3 4))
  (init-seed nil)
  )

Result:
? init-seed state: 1
rnd-sample n: 4 seed: 1
gen-loop count: 4 seed: 567
rnd-sample n: 4 seed: 3
rnd-sample n: 4 seed: 67538
rnd-sample n: 4 seed: 345
rnd-sample n: 4 seed: 6
rnd-sample n: 4 seed: 7
rnd-pick seed: 9756
rnd-pick seed: 9
rnd-pick seed: 10
rnd-pick seed: 11
init-seed state: nil
