Opusmodus                                                                         choose-option     1

choose-option option &optional choices seed
[Function]

Arguments and Values:
option                 a symbol.
choices                a list of options.
seed                   an integer or NIL. Ensure the same result each time the code is evaluated.
                       The default is NIL.


Description:

Forces an option of '? or NIL to randomly choose one of choices.


Examples:

Embedded CHOOSE-OPTION function:

(defun sort-foo (sequence &optional sort seed)
  (let (state)
    (setf state *init-seed*)
    (setf seed (rnd-seed seed))
    (do-verbose ("sort-foo sort: ~s seed: ~s" sort
                 (if (equal '? sort) seed 'none))
      (let ((sort-opt (choose-option sort '(a d o) (seed))))
        (init-state state)
        (case sort-opt
          (a (sort-asc sequence))
          (d (sort-desc sequence))
          (o sequence)
          (otherwise (error "There is no SORT named: ~s.
    Allowed SORT: 'a (ascending), 'd (descending), 'o (original)
    and '? (at random)." sort)))))))

(sort-foo '(1 3 2) '?)
=> (3 2 1)

(sort-foo '(1 3 2) 'a)
=> (1 2 3)
