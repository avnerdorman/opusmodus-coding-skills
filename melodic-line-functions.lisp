(in-package :opusmodus)

;;;---------------------------------------------------------
;;; File: melodic-line-functions.lisp
;;; Description: Three approaches to building melodic lines
;;;              from interval kernels and pitch class sets.
;;;
;;; Compositional context:
;;;   These functions support a style of melodic construction
;;;   where a short interval kernel (e.g., '(-5 2 -5)) repeats
;;;   with connecting "link" intervals, and where all notes
;;;   belong to the same pitch-class-set family — for example,
;;;   3-7 [0,2,5], the sus2/quartal trichord.
;;;
;;;   Example melody (from user's piece):
;;;     F4 C4 D4 A3 | Eb4 Bb3 C4 G3 | (back to F4)
;;;   Kernel: (-5 2 -5), links: (6 10)
;;;   All four trichords (FCD, CDA, EbBbC, BbCG) are members of 3-7.
;;;---------------------------------------------------------


;;;---------------------------------------------------------
;;; Function: gen-interval-kernel-melody
;;; Description: Build a melodic line by repeating an interval
;;;              kernel with connecting "link" intervals.
;;;
;;; Arguments:
;;;   start:   Starting pitch symbol (e.g., 'f4)
;;;   kernel:  Repeating interval pattern in semitones (e.g., '(-5 2 -5))
;;;   links:   List of connecting intervals between kernel statements.
;;;            One kernel repeat per link — length of links determines
;;;            how many times the kernel is stated.
;;;   variant: NIL, 'p, 'r, 'i, 'ri, or '? — applies interval-variant
;;;            to the kernel before generating (default NIL)
;;;   ambitus: Pitch range constraint — instrument name or (low high)
;;;
;;; Returns: A flat list of pitch symbols
;;;---------------------------------------------------------

(defun gen-interval-kernel-melody (start kernel links &key variant ambitus)
  "Build a melodic line by repeating an interval kernel with link intervals.

  Full interval sequence = kernel link1 kernel link2 kernel link3 ...
  Each link bridges from the end of one kernel statement to the
  start of the next. Number of links = number of kernel repetitions.

  Examples:

  ;; The user's melody: F4 C4 D4 A3 Eb4 Bb3 C4 G3 F4
  ;; kernel (-5 2 -5) states twice, links (6 10) connect them:
  (gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 10))
  => (f4 c4 d4 a3 eb4 bb3 c4 g3 f4)

  ;; Retrograde of kernel, three statements:
  (gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 10 -3) :variant 'r)

  ;; Inversion of kernel, constrained to cello range:
  (gen-interval-kernel-melody 'f3 '(-5 2 -5) '(6 -2 3 -7)
                              :variant 'i :ambitus 'cello)

  ;; Random transformation each call (vary :variant '?):
  (gen-interval-kernel-melody 'c4 '(-5 2 -5) '(6 10) :variant '?)"

  (let* ((kern (if variant
                   (interval-variant kernel :variant variant)
                   kernel))
         ;; Interleave: append kernel + one link, once per link entry
         (intervals (loop for link in links
                          append (append (copy-list kern) (list link)))))
    (if ambitus
        (interval-map start intervals :ambitus ambitus)
        (interval-map start intervals))))


;;;---------------------------------------------------------
;;; Function: make-pcs-cycle-scale
;;; Description: Derive the cyclic interval pattern of a PCS
;;;              and use make-scale to build a melodic series.
;;;              All pitches stay within the same set class.
;;;
;;; Arguments:
;;;   start:     Starting pitch symbol (e.g., 'f4)
;;;   size:      Number of pitches to generate
;;;   pcs-ints:  Ascending list of pitch-class integers (e.g., '(0 2 5))
;;;   dir:       :up (default) — ascending cycle, or :down — descending
;;;   type:      Passed to make-scale: 0 (default), :pal, or :rev
;;;
;;; Returns: A list of pitch symbols (output of make-scale)
;;;---------------------------------------------------------

(defun make-pcs-cycle-scale (start size pcs-ints &key (dir :up) (type 0))
  "Derive the cyclic interval pattern of a PCS and build a melodic series.

  Computes the ascending semitone interval between each consecutive pair
  of pitch classes, including the wrap-around from the last back to the
  first (one octave up). Passes these as :alt to make-scale, so the
  melody continuously cycles through the set's interval structure.

  For [0,2,5]: intervals are 2 (C->D), 3 (D->F), 7 (F->C next octave).
  make-scale with :alt '(2 3 7) cycles: C D F C D F C D F ...

  Examples:

  ;; [0,2,5] trichord cycling upward from F4, 12 pitches:
  (make-pcs-cycle-scale 'f4 12 '(0 2 5))
  ;; => (f4 g4 bb4 f5 g5 bb5 ...)

  ;; Descending from F4:
  (make-pcs-cycle-scale 'f4 12 '(0 2 5) :dir :down)

  ;; Palindrome arc — rises then falls symmetrically:
  (make-pcs-cycle-scale 'c4 8 '(0 2 7) :type :pal)

  ;; Quartal trichord [0,5,7]:
  (make-pcs-cycle-scale 'c4 9 '(0 5 7))

  ;; Whole-tone set [0,2,4,6,8,10]:
  (make-pcs-cycle-scale 'c4 12 '(0 2 4 6 8 10))"

  (let* ((n (length pcs-ints))
         ;; Ascending interval from each pc to the next, wrapping at 12
         (up-intervals
          (loop for i from 0 below n
                for a = (nth i pcs-ints)
                for b = (nth (mod (1+ i) n) pcs-ints)
                ;; If b <= a, the next pitch is in the next octave
                collect (if (> b a) (- b a) (+ (- b a) 12))))
         ;; Flip signs for descending direction
         (alt-intervals
          (if (eq dir :down)
              (mapcar #'- up-intervals)
              up-intervals)))
    (make-scale start size :alt alt-intervals :type type)))


;;;---------------------------------------------------------
;;; Function: gen-kernel-variants
;;; Description: Generate all four classical transformations
;;;              (P, R, I, RI) of a kernel melody, returned
;;;              as a list of four pitch sequences for easy
;;;              comparison and experimentation.
;;;
;;; Arguments:
;;;   start:   Starting pitch (same start is used for all variants)
;;;   kernel:  Interval kernel (e.g., '(-5 2 -5))
;;;   links:   Link intervals (e.g., '(6 10))
;;;   ambitus: Optional pitch range constraint
;;;
;;; Returns:
;;;   List of four pitch sequences: (prime retro inversion retro-inversion)
;;;---------------------------------------------------------

(defun gen-kernel-variants (start kernel links &key ambitus)
  "Return all four classical transformations of a kernel melody.

  Returns a list: (prime retrograde inversion retrograde-inversion)
  All four variants share the same start pitch and link structure.
  Useful for quickly auditioning how a melodic kernel sounds under
  each transformation before committing to one.

  Examples:

  ;; All four variants of the user's kernel:
  (gen-kernel-variants 'f4 '(-5 2 -5) '(6 10))

  ;; Assign to variables for score use:
  (destructuring-bind (p r i ri)
      (gen-kernel-variants 'f4 '(-5 2 -5) '(6 10))
    (make-omn :length '(e) :pitch p))

  ;; With ambitus constraint:
  (gen-kernel-variants 'g4 '(-5 2 -5) '(3 8 -4) :ambitus 'violin)"

  (list
   (gen-interval-kernel-melody start kernel links :ambitus ambitus)
   (gen-interval-kernel-melody start kernel links :variant 'r :ambitus ambitus)
   (gen-interval-kernel-melody start kernel links :variant 'i :ambitus ambitus)
   (gen-interval-kernel-melody start kernel links :variant 'ri :ambitus ambitus)))


;;;---------------------------------------------------------
;;; Function: gen-kernel-loop
;;; Description: Repeat a kernel melody N times, joining cycles
;;;              cleanly without duplicating the return-to-start note.
;;;
;;; How the join works:
;;;   gen-interval-kernel-melody produces a melody whose last pitch is the
;;;   same as 'start' (the final link interval brings you "home"). When looping,
;;;   that shared pitch would appear twice at every cycle boundary. gen-kernel-loop
;;;   strips the final note from all but the last cycle, so cycles join seamlessly.
;;;
;;;   Structure:  [cycle-body] [cycle-body] ... [complete-final-cycle]
;;;   where cycle-body = melody with its last (return) note removed.
;;;---------------------------------------------------------

(defun gen-kernel-loop (start kernel links &key (repeat 1) variant ambitus)
  "Repeat a kernel melody N times, joining cycles cleanly without duplicate notes.

  gen-interval-kernel-melody ends on the same pitch as start (the last link
  brings you home). Consecutive cycles would therefore share a repeated pitch.
  gen-kernel-loop removes that return note from all but the final cycle so the
  melody flows without interruption.

  Arguments:
    start   - Starting pitch symbol (e.g., 'a4)
    kernel  - Repeating interval pattern in semitones (e.g., '(-1 -2 -1))
    links   - Connecting intervals between kernel statements (e.g., '(2 6))
    repeat  - Number of full cycles to generate (default 1, same as gen-interval-kernel-melody)
    variant - NIL, 'p, 'r, 'i, 'ri, or '? — passed to gen-interval-kernel-melody
    ambitus - Optional pitch range constraint

  Examples:

  ;; Two clean cycles from A4 with kernel (-1 -2 -1):
  (gen-kernel-loop 'a4 '(-1 -2 -1) '(2 6) :repeat 2)

  ;; Three cycles, harmonized with chord-interval-add:
  (chord-interval-add '(8 4)
    (gen-kernel-loop 'a4 '(-1 -2 -1) '(2 6) :repeat 3))

  ;; Retrograde variant, four cycles:
  (gen-kernel-loop 'f4 '(-5 2 -5) '(6 10) :repeat 4 :variant 'r)

  ;; Constrained to violin range, three cycles:
  (gen-kernel-loop 'g4 '(-5 2 -5) '(3 8) :repeat 3 :ambitus 'violin)"

  (let* ((one-cycle (gen-interval-kernel-melody start kernel links
                                                :variant variant
                                                :ambitus ambitus))
         ;; Drop the last note (= start of next cycle) from intermediate cycles
         (cycle-body (butlast one-cycle)))
    (if (<= repeat 1)
        one-cycle
        (append
         (loop repeat (1- repeat) nconc (copy-list cycle-body))
         one-cycle))))


;;;---------------------------------------------------------
;;; Function: assign-first-last-durations
;;; Description: Assigns a starting duration to the beginning
;;;              of a pitch list, and an ending duration to
;;;              the last note of the list.
;;;---------------------------------------------------------

  (defun assign-first-last-durations (pitches dur1 dur2)
    "Assigns DUR1 to the beginning of PITCHES and DUR2 to the final note.

    Example:
    (assign-first-last-durations '(eb4 d4 g4 fs4 b4 bb4 eb5) 's 'e)
    => (s eb4 d4 g4 fs4 b4 bb4 e eb5)"
    (cond ((null pitches) nil)
          ((= (length pitches) 1) (list dur1 (car pitches)))
          (t (append (list dur1)
                    (butlast pitches)
                    (list dur2)
                    (last pitches)))))


;;;---------------------------------------------------------
;;; Function: assign-first-last-durations-nested
;;; Description: Applies assign-first-last-durations to each
;;;              sublist in a nested list of pitches.
;;;---------------------------------------------------------

(defun assign-first-last-durations-nested (nested-pitches dur1 dur2)
  "Applies assign-first-last-durations to each sublist in NESTED-PITCHES.

  Example:
  (assign-first-last-durations-nested '((b3 f4 eb4) (eb4 cs4 g4)) 's 'e)
  => ((s b3 f4 e eb4) (s eb4 cs4 e g4))"
  (mapcar (lambda (sublist) 
            (assign-first-last-durations sublist dur1 dur2))
          nested-pitches))


;;;---------------------------------------------------------
;;; Function: split-pitches-by-interval
;;; Description: Splits a flat list of pitches into a nested
;;;              list based on an intervallic condition.
;;;---------------------------------------------------------

(defun split-pitches-by-interval (pitches &key (threshold -6) (test #'<))
  "Splits a flat list of PITCHES into a nested list based on the interval 
  between consecutive notes. If the interval between note N and N+1 
  satisfies (TEST interval THRESHOLD), the list is split before note N+1.

  Default behavior splits when the interval is strictly less than -6 
  (e.g., -7, -8). If you wanted to split on -6, you would pass :test #'<=

  Example:
  (split-pitches-by-interval '(c4 g4 c4 c5 b4 c4) :threshold -6)
  ;; intervals: 7, -7, 12, -1, -11
  => ((c4 g4 c4) (c5 b4) (c4))"
  (if (null pitches)
      nil
      (let* ((intervals (pitch-to-interval pitches))
             (current-sublist (list (car pitches)))
             (result nil))
        (loop for p in (cdr pitches)
              for inv in intervals
              do (if (funcall test inv threshold)
                     (progn
                       (push (nreverse current-sublist) result)
                       (setf current-sublist (list p)))
                     (push p current-sublist)))
        (push (nreverse current-sublist) result)
        (nreverse result))))


;;;---------------------------------------------------------
;;; Usage examples — evaluate these in the listener
;;;---------------------------------------------------------

;;; --- Approach 1: gen-interval-kernel-melody ---

;; The melody from the user's piece (9 pitches, returns to F4):
;; F4 C4 D4 A3 | Eb4 Bb3 C4 G3 | F4
(gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 10))

;; Three statements of the same kernel, different links:
(gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 -2 10))

;; Inversion of the kernel from the same starting note:
(gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 10) :variant 'i)

;; Use interval-scale to augment the kernel intervals (stretch by 1.5x):
(gen-interval-kernel-melody 'f4 (interval-scale 1.5 '(-5 2 -5)) '(6 10))


;;; --- Approach 2: make-pcs-cycle-scale ---

;; [0,2,5] cycling up from F4 — produces a scale staying within 3-7:
(make-pcs-cycle-scale 'f4 12 '(0 2 5))

;; Same, descending:
(make-pcs-cycle-scale 'f4 12 '(0 2 5) :dir :down)

;; Palindrome: rises 5 notes then returns — good for phrase arcs:
(make-pcs-cycle-scale 'f4 5 '(0 2 5) :type :pal)

;; [0,2,7] quartal trichord — different intervallic character:
(make-pcs-cycle-scale 'c4 9 '(0 2 7))

;; Derive :alt from any PCS — e.g., the 016 trichord:
(make-pcs-cycle-scale 'c4 9 '(0 1 6))


;;; --- Approach 3: gen-kernel-variants ---

;; All four transformations starting from F4:
(gen-kernel-variants 'f4 '(-5 2 -5) '(6 10))

;; Try a different kernel shape — ascending then large jump:
(gen-kernel-variants 'c4 '(2 3 -7) '(5 -3))

;; Mix interval-scale with gen-kernel-variants for augmentation:
(gen-kernel-variants 'f4 (interval-scale 2 '(-5 2 -5)) '(6 10))


;;; --- Approach 4: gen-kernel-loop ---

;; Two clean cycles from A4 with kernel (-1 -2 -1):
(gen-kernel-loop 'a4 '(-1 -2 -1) '(2 6) :repeat 2)

;; Three cycles harmonized with chord-interval-add:
(chord-interval-add '(8 4)
  (gen-kernel-loop 'a4 '(-1 -2 -1) '(2 6) :repeat 3))

;; Compare: single call vs. looped (note the clean join — no doubled pitch):
(gen-interval-kernel-melody 'f4 '(-5 2 -5) '(6 10))           ; ends on f4
(gen-kernel-loop 'f4 '(-5 2 -5) '(6 10) :repeat 2)            ; f4 appears once at join

;; Four cycles, retrograde variant:
(gen-kernel-loop 'f4 '(-5 2 -5) '(6 10) :repeat 4 :variant 'r)
