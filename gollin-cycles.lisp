(in-package :opusmodus)

(defun gen-multi-aggregate-cycle (start-pc intervals)
  "Generates a multi-aggregate pitch class cycle using native make-scale."
  (let* ((start (mod (if (integerp start-pc) start-pc (pitch-to-integer start-pc)) 12))
         (sum-intervals (apply #'+ intervals))
         (num-intervals (length intervals))
         (total-elements (* 12 num-intervals))) ;; Dynamically calculate length
    ;; Check if the sum of intervals is co-prime with 12
    (if (= (gcd sum-intervals 12) 1)
        ;; Your idiomatic make-scale loop
        (loop for i in (make-scale start total-elements :alt intervals)
              collect (mod i 12))
        (error "The modulo 12 sum of the generating intervals (~a) must be co-prime with 12." sum-intervals))))

(defun get-distribution-vector (cycle &optional (target-pc 0))
  "Analyzes a dynamically generated cycle to calculate its evenness profile.
   Inputs: a flat list of a pitch class cycle, and optionally a target pitch class (default 0).
   Returns a list of integers representing the circular distances."
  (let* ((target (mod (if (integerp target-pc) target-pc (pitch-to-integer target-pc)) 12))
         (positions (loop for i from 0 for pc in cycle
                          when (= pc target) collect i))
         (num-occurrences (length positions))
         (total-len (length cycle)))
    (if (> num-occurrences 0)
        (let ((distances ()))
          (dotimes (i (1- num-occurrences))
            (push (- (nth (1+ i) positions) (nth i positions)) distances))
          ;; Calculate the wrap-around distance back to the first occurrence
          (push (- (+ total-len (car positions)) (car (last positions))) distances)
          (reverse distances))
        (error "Target pitch class (~a) not found in the cycle." target))))


(defun extract-cycle-span (cycle start-index span-size)
  "Extracts a span from the cycle, capped at the minimum distribution distance to avoid pc repetitions."
  (let* ((dist-vector (get-distribution-vector cycle))
         (max-safe-span (apply #'min dist-vector))
         (actual-span (min span-size max-safe-span))
         (len (length cycle)))
    (loop for i from 0 below actual-span
          collect (nth (mod (+ start-index i) len) cycle))))

(defun filter-cycle-set-classes (cycle target-set cardinality)
  "Scans the cycle for adjacent groupings that match the target prime form."
  (let ((results '())
        (len (length cycle)))
    (dotimes (i len (reverse results))
      ;; Extract the span; note we temporarily bypass the safe-span cap here 
      ;; to ensure we get the exact cardinality requested for the chord.
      (let ((span (loop for j from 0 below cardinality
                        collect (nth (mod (+ i j) len) cycle))))
        ;; Use Opusmodus native pcs-prime-form and pcs-normal-order
        (let ((prime (pcs-prime-form (pcs-normal-order span))))
          ;; Check if the calculated prime form matches the target
          (when (equal prime target-set)
            (push (list :index i :pitches span) results)))))))


(defun partition-chord (chord group-size)
  "Splits a flat list of integer pitch classes into sublists of a specified size."
  (let ((results '()))
    (loop for i from 0 below (length chord) by group-size
          do (push (subseq chord i (min (+ i group-size) (length chord))) results))
    (reverse results)))

(defun cycle-voice-lead (partitioned-chord transposition-vectors)
  "Applies a tree of transposition vectors to a partitioned chord.
   The shape of the vectors should match the shape of the partitioned chord.
   Returns a flattened list of the transformed integer pitch classes."
  (loop for partition in partitioned-chord
        for trans-group in transposition-vectors
        append (loop for pc in partition
                     for trans in trans-group
                     collect (mod (+ pc trans) 12))))

(setf my-cycle (gen-multi-aggregate-cycle 0 '(3 5 3)))
(get-distribution-vector my-cycle 0)

(setf new-cycle (gen-multi-aggregate-cycle 0 '(2 3)))
(get-distribution-vector new-cycle 0)


(extract-cycle-span my-cycle 0 15)

(filter-cycle-set-classes my-cycle '(0 3 4 7) 4)

(setf my-chord '(5 6 9 10))
(setf my-partitions (partition-chord my-chord 2))
;; Returns: ((5 6) (9 10))

(cycle-voice-lead my-partitions '((-1 1) (-1 1)))

(setf my-block (partition-chord my-chord 4))
(cycle-voice-lead my-block '((-2 -2 2 2)))