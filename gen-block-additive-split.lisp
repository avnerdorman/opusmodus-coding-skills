(in-package :opusmodus)

;;;---------------------------------------------------------
;;; Function: gen-block-additive-split
;;; Description: Like gen-block-additive, but returns two complementary
;;;              voices: voice 1 fills in, voice 2 empties out.
;;;
;;; Arguments:
;;;   sequence:     Input OMN sequence.
;;;   type:         Index order ('linear, 'symmetric, 'random). Default: 'linear.
;;;   flat:         If T, flattens each voice's output. Default: nil.
;;;   seed:         RNG seed. Default: nil (auto-generated).
;;;   start-count:  Number of notes revealed at step 1. Default: 1.
;;;   repeat-last:  Times to repeat the final step. Default: 0.
;;;   step-repeat:  Times to repeat each intermediate step. Default: 1.
;;;   display-seed: If T, prints seed to Listener. Default: t.
;;;
;;; Returns: (voice-1 voice-2)
;;;   voice-1 — list of measures, filling in (like gen-block-additive)
;;;   voice-2 — list of measures, emptying out (complement)
;;;---------------------------------------------------------

(defun gen-block-additive-split (sequence &key (type 'linear) (flat nil) seed (start-count 1) (repeat-last 0) (step-repeat 1) (display-seed t))
  "Returns two complementary voices from a block-additive process.

  Voice 1 reveals notes progressively (fills in).
  Voice 2 is the complement — it starts full and empties out.
  Together they always sum to the original sequence.

  Args:
    sequence     - Input OMN sequence.
    type         - Index order: 'linear, 'symmetric, or 'random. Default: 'linear.
    flat         - If T, returns flat OMN lists. Default: nil.
    seed         - RNG seed (integer or nil for auto). Default: nil.
    start-count  - Notes revealed at step 1. Default: 1.
    repeat-last  - Times to repeat the final step. Default: 0.
    step-repeat  - Times to repeat each intermediate step. Default: 1.
    display-seed - If T, prints seed to Listener. Default: t.

  Returns:
    (voice-1 voice-2)

  Example:
    (gen-block-additive-split '(e c4 d4 e4 f4 g4))
    => (voice-1-measures voice-2-measures)"

  (let ((state *init-seed*))
    (setf seed (rnd-seed seed))

    (when display-seed
      (format t "~%gen-block-additive-split seed: ~a~%" seed))

    (do-verbose ("gen-block-additive-split seed: ~s" seed)

      (let* ((events (flatten (single-events sequence)))
             (n (length events))
             (all-indices (loop for i from 0 below n collect i))
             (indices (gen-additive-indices n :type type :seed (seed))))

        (let* ((voice-1 nil)
               (voice-2 nil))

          ;; Build both voices step by step
          (loop for count from start-count to n do
                (let* ((active   (subseq indices 0 count))
                       (inactive (remove-if (lambda (i) (member i active)) all-indices))
                       (m1 (apply-process-mask active   sequence))
                       (m2 (apply-process-mask inactive sequence)))
                  (loop repeat step-repeat do
                        (push m1 voice-1)
                        (push m2 voice-2))))

          (setf voice-1 (nreverse voice-1))
          (setf voice-2 (nreverse voice-2))

          ;; Append final repetitions
          (when (> repeat-last 0)
            (setf voice-1 (append voice-1 (loop repeat repeat-last collect sequence)))
            (setf voice-2 (append voice-2 (loop repeat repeat-last
                                                collect (apply-process-mask nil sequence)))))

          (init-state state)

          (list (if flat (flatten voice-1) voice-1)
                (if flat (flatten voice-2) voice-2)))))))
