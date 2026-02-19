(in-package :opusmodus)

;;;---------------------------------------------------------
;;; Function: apply-phasing
;;; Description: Creates a two-voice phasing structure from a barred OMN list.
;;;
;;; Arguments:
;;;   sequence:    Nested OMN list, one sublist per bar: ((bar1)(bar2)...)
;;;   delta:       Duration ratio for the phasing offset (e.g., 1/16, 1/8)
;;;   step-repeat: Integer - number of bars sharing the same offset before
;;;                it increments (default 1)
;;;
;;; Returns:
;;;   A list of two bar-grouped OMN voices: (voice-1 voice-2)
;;;---------------------------------------------------------

(defun apply-phasing (sequence delta &key (step-repeat 1))
  "Creates a two-voice phasing structure from a bar-grouped OMN sequence.

  Voice 1 is the original sequence, unchanged.
  Voice 2 has a progressively larger rest prepended to the start of each bar
  (or group of bars, controlled by STEP-REPEAT), creating a Steve Reich-style
  phase-shifting effect.

  Voice 2 is trimmed to the same total duration as Voice 1, then re-barred
  to fit the same measure structure using OMN-TO-TIME-SIGNATURE.

  Arguments:
    sequence    - Bar-grouped OMN list: ((bar1)(bar2)(bar3)...)
    delta       - Phasing duration increment, a ratio (e.g., 1/16, 1/8, 1/4)
    step-repeat - Integer: number of bars before the delta offset increments.
                  Default is 1 (offset grows each bar).
                  :step-repeat 2 => bars 1-2 get delta*0, bars 3-4 get delta*1, etc.

  Returns:
    (voice-1 voice-2)
    voice-1 = original bar-grouped sequence (unchanged)
    voice-2 = phased, trimmed, and re-barred sequence

  Examples:

  ;; Basic phasing with 1/8 delta, offset increments every bar:
  (apply-phasing
    '((q c4 d4 e4 f4)
      (q g4 a4 b4 c5)
      (q d5 e5 f5 g5)
      (q a5 g5 f5 e5))
    1/8)

  ;; Slower phasing: delta increments every 2 bars:
  (apply-phasing
    '((q c4 d4 e4 f4)
      (q g4 a4 b4 c5)
      (q d5 e5 f5 g5)
      (q a5 g5 f5 e5)
      (q c5 b4 a4 g4)
      (q f4 e4 d4 c4))
    1/16
    :step-repeat 2)"

  ;; Step 1: Derive bar structure and total duration from the original sequence.
  ;; GET-TIME-SIGNATURE returns e.g. ((4 4 1)(3 4 2)) from bar-grouped OMN.
  (let* ((time-sigs  (get-time-signature sequence))
         (total-dur  (time-signature-length time-sigs :sum t))

         ;; Step 2: Build a phased flat OMN sequence.
         ;; Bar i (0-based) receives a leading rest of (floor(i/step-repeat) * |delta|).
         ;; This means:
         ;;   step-repeat=1 -> offset grows by delta every bar
         ;;   step-repeat=2 -> offset grows by delta every 2 bars
         (flat-phased
          (loop for bar in sequence
                for i from 0
                append
                (let* ((n-steps    (floor i step-repeat))
                       (offset-dur (* n-steps (abs delta))))
                  (if (> offset-dur 0)
                      ;; Prepend a rest of offset-dur then the bar's OMN events.
                      ;; In OMN a rest is a negative length with no pitch.
                      (cons (- offset-dur) bar)
                      ;; Bar 0 (and bars where offset is still 0) are unchanged.
                      bar))))

         ;; Step 3: Trim (or span) to exactly the total duration of Voice 1.
         ;; LENGTH-SPAN handles OMN-format input and truncates cleanly,
         ;; splitting any note that crosses the boundary.
         (trimmed  (length-span total-dur flat-phased))

         ;; Step 4: Re-bar the trimmed flat sequence to match the original
         ;; bar structure (same time signatures, same bar lines).
         (voice-2  (omn-to-time-signature trimmed time-sigs)))

    ;; Return both voices as a two-element list.
    (list sequence voice-2)))
