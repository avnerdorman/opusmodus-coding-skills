Opusmodus                                                                        setf     1

setf place value
[Macro]

Arguments and Values:
place                     a place.
value                     a form.


Description:

Takes pairs of arguments like SETQ. The rst is a place and the second is the value that
is supposed to go into that place. Returns the last value. The place argument may be
any of the access forms for which SETF knows a corresponding setting form.


Examples:
(setf pitch '(c4 e4 g4 c5))
=> (c4 e4 g4 c5)

pitch
=> (c4 e4 g4 c5)

If more than one pair is supplied, the pairs are processed sequentially.

(setf place-1 newvalue-1
      place-2 newvalue-2
      ...
      place-N newvalue-N)

equivalent to

(progn
 (setf place-1 newvalue-1)
 (setf place-2 newvalue-2)
  ...
 (setf place-N newvalue-N))
                                     fi
