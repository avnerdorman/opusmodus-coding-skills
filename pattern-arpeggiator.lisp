;;;---------------------------------------------------------
;;; Pattern Arpeggiator and List Utilities
;;;
;;; A collection of functions for applying 1-based index patterns
;;; to pitch sequences or MIDI numbers, generating arpeggiations 
;;; through random permutations, and performing targeted list modifications.
;;;---------------------------------------------------------

;;;---------------------------------------------------------
;;; Function: random-permute
;;; Description: Performs a Fisher-Yates shuffle on a list.
;;;
;;; Arguments:
;;;   lst: The list to shuffle.
;;;
;;; Returns: list
;;;---------------------------------------------------------

(defun random-permute (lst)
  "
  Randomly permutes a list using the Fisher-Yates shuffle algorithm.
  
  Examples:
  (random-permute '(1 2 3 4 5))
  => (3 1 5 2 4)
  "
  (let ((copy (copy-list lst)))
    (loop for i from (length lst) downto 2
          do (rotatef (elt copy (random i))
                      (elt copy (1- i))))
    copy))

;;;---------------------------------------------------------
;;; Function: apply-pattern
;;; Description: Maps a list of 1-based indices to elements of a source list.
;;;
;;; Arguments:
;;;   midi-list: A source list of elements (e.g., pitches or MIDI numbers).
;;;   pattern: A list of 1-based indices (1, 2, 3...) referencing the source.
;;;
;;; Returns: list
;;;---------------------------------------------------------

(defun apply-pattern (midi-list pattern)
  "
  Applies a 1-based index pattern to a source list.
  
  Examples:
  (apply-pattern '(60 62 64) '(3 1 2))
  => (64 60 62)
  "
  (mapcar #'(lambda (p) (nth (1- p) midi-list)) pattern))

;;;---------------------------------------------------------
;;; Function: apply-pattern-set
;;; Description: Applies multiple index patterns sequentially to a single source list.
;;;
;;; Arguments:
;;;   midi-list: A source list of elements.
;;;   pattern-set: A list of index lists.
;;;
;;; Returns: list
;;;---------------------------------------------------------

(defun apply-pattern-set (midi-list pattern-set)
  "
  Applies a set of patterns to a single source list and concatenates the results.
  
  Examples:
  (apply-pattern-set '(60 62 64) '((1 2 3) (3 2 1)))
  => (60 62 64 64 62 60)
  "
  (mapcan #'(lambda (pattern) (apply-pattern midi-list pattern)) pattern-set))

;;;---------------------------------------------------------
;;; Function: pattern-arpeggiator
;;; Description: Transforms sequences using patterned mappings, with optional random permutation.
;;;
;;; Arguments:
;;;   midi-lists: A list of source lists (e.g., sequences of chords).
;;;   pattern-set: A list of base patterns given as 1-based indices.
;;;   repetitions: How many times to repeat the arpeggiation cycle per list.
;;;   &optional fixed-pattern: A specific 1-based permutation to map patterns against instead of generating a random one.
;;;
;;; Returns: list
;;;---------------------------------------------------------

(defun pattern-arpeggiator (midi-lists pattern-set repetitions &optional fixed-pattern)
  "
  Applies a randomized or fixed pattern mapping to a list of source groups (midi-lists).
  If no fixed-pattern is given, it generates a single random permutation of the first pattern.
  "
  (let ((random-perm (if fixed-pattern fixed-pattern (random-permute (first pattern-set)))))
    (format t "Randomly generated pattern: ~a~%" random-perm)
    (loop for midi-list in midi-lists
          append (loop repeat repetitions
                       append (apply-pattern-set midi-list 
                                                 (mapcar #'(lambda (pattern) 
                                                             (mapcar #'(lambda (p) (nth (1- p) random-perm)) pattern)) 
                                                         pattern-set))))))

;;;---------------------------------------------------------
;;; Function: run-pattern-arpeggiator
;;; Description: An Opusmodus-specific wrapper grouping pattern-arpeggiator and midi-to-pitch.
;;;
;;; Arguments:
;;;   midi-lists: A list of source lists.
;;;   pattern-set: A list of basic index-based patterns.
;;;   repetitions: Number of repetitions for each source group.
;;;   &optional fixed-pattern: Optional 1-based index fixed pattern.
;;;
;;; Returns: list of pitches
;;;---------------------------------------------------------

(defun run-pattern-arpeggiator (midi-lists pattern-set repetitions &optional fixed-pattern)
  "
  Convenience function wrapping pattern-arpeggiator and ending with midi-to-pitch.
  "
  (midi-to-pitch
    (pattern-arpeggiator midi-lists pattern-set repetitions fixed-pattern)))

;;;---------------------------------------------------------
;;; Function: split-into-sublists
;;; Description: Recursively chunks a list into evenly sized sublists.
;;;
;;; Arguments:
;;;   lst: The list to chunk.
;;;   &optional (size 12): Length of each sublist.
;;;
;;; Returns: list of lists
;;;---------------------------------------------------------

(defun split-into-sublists (lst &optional (size 12))
  "
  Splits a single list into multiple sublists of max size 'size'.
  "
  (if (null lst)
      nil
      (cons (subseq lst 0 (min size (length lst)))
            (split-into-sublists (subseq lst size) size))))

;;;---------------------------------------------------------
;;; Function: remove-elements-from-even-sublists
;;; Description: Truncates even-indexed sublists by removing their last 2 elements.
;;;
;;; Arguments:
;;;   lst: A list of sublists.
;;;
;;; Returns: list of lists
;;;---------------------------------------------------------

(defun remove-elements-from-even-sublists (lst)
  "
  Iterates over a list of sublists (1-based index).
  For even indices (2, 4, 6...), removes the last 2 elements using 'butlast'.
  "
  (let ((index 0))
    (mapcar (lambda (sublist)
              (incf index)
              (if (evenp index)
                  (butlast sublist 2)
                  sublist))
            lst)))

;;;---------------------------------------------------------
;;; Function: modify-list-steps
;;; Description: Iteratively mutates a list by enforcing 1s and 0s based on an index mod 3 rule.
;;;
;;; Arguments:
;;;   lst: Source flat list.
;;;
;;; Returns: list of lists
;;;---------------------------------------------------------

(defun modify-list-steps (lst)
  "
  Successively steps through a list, mutating each element in turn based on a mod-3 rule:
  - If (index mod 3) == 0, replace with 1
  - If (index mod 3) == 1, replace with 0
  - Otherwise leave the item untouched.
  It returns a list representing the history of these changes step-by-step.
  "
  (let ((result (list (copy-list lst)))
        (index 0))
    (dolist (item lst)
      (setf (nth index lst)
            (cond ((= (mod index 3) 0) 1)
                  ((= (mod index 3) 1) 0)
                  (t item)))
      (incf index)
      (push (copy-list lst) result))
    (nreverse result)))
