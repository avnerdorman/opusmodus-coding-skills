(in-package :opusmodus)

;;;---------------------------------------------------------
;;; Function: apply-phasing
;;; Description: Creates a multi-voice phasing structure from a barred OMN list.
;;;
;;; Arguments:
;;;   sequence:    Nested OMN list, one sublist per bar: ((bar1)(bar2)...)
;;;   delta:       Duration ratio for the phasing offset (e.g., 1/16, 1/8)
;;;   step-repeat: Integer - bars sharing the same offset before it increments
;;;                (default 1). Each additional voice multiplies this by its
;;;                voice index, so voices drift in at staggered rates.
;;;   voices:      Integer - total number of voices to generate (default 2).
;;;                Voice 1 is always the original, unchanged.
;;;
;;; Returns:
;;;   A list of bar-grouped OMN voices: (voice-1 voice-2 ... voice-N)
;;;---------------------------------------------------------

(defun apply-phasing (sequence delta &key (step-repeat 1) (voices 2))
  "Creates a multi-voice phasing structure from a bar-grouped OMN sequence.

  Voice 1 is the original sequence, unchanged.
  Each subsequent voice introduces a progressively larger rest at the start
  of each bar, creating a Steve Reich-style phase-shifting effect.

  The key to multi-voice behaviour is that each voice v (1-based) uses an
  effective step-repeat of (step-repeat * v). This staggers when each voice
  begins to drift, so Voice 3 only starts accumulating offset once Voice 2
  already has its first delay, Voice 4 starts later still, etc.

  Offset formula for voice v (1 = first phased voice), bar index i (0-based):
    offset = floor(i / (step-repeat * v)) * |delta|

  Example with step-repeat=2, voices=3, 6 bars:
    Voice 1:  0    0    0    0    0    0        (original)
    Voice 2:  0    0   -d   -d  -2d  -2d        (step-repeat * 1 = 2)
    Voice 3:  0    0    0    0   -d   -d         (step-repeat * 2 = 4)

  All phased voices are trimmed to the same total duration as Voice 1 and
  re-barred to fit the same measure structure using OMN-TO-TIME-SIGNATURE.

  Arguments:
    sequence    - Bar-grouped OMN list: ((bar1)(bar2)(bar3)...)
    delta       - Phasing duration increment, a ratio (e.g., 1/16, 1/8, 1/4)
    step-repeat - Integer: bars before offset increments for Voice 2 (default 1).
                  Voice 3 uses step-repeat*2, Voice 4 uses step-repeat*3, etc.
    voices      - Integer: total number of voices, including the original (default 2).

  Returns:
    (voice-1 voice-2 ... voice-N)
    voice-1     = original bar-grouped sequence (unchanged)
    voice-2..N  = phased, trimmed, and re-barred sequences

  Examples:

  ;; Two voices, basic phasing (original behaviour unchanged):
  (apply-phasing
    '((q c4 d4 e4 f4)
      (q g4 a4 b4 c5)
      (q d5 e5 f5 g5)
      (q a5 g5 f5 e5))
    1/8)

  ;; Three voices, offset staggers at 2-bar intervals:
  (apply-phasing
    '((q c4 d4 e4 f4)
      (q g4 a4 b4 c5)
      (q d5 e5 f5 g5)
      (q a5 g5 f5 e5)
      (q c5 b4 a4 g4)
      (q f4 e4 d4 c4))
    1/8
    :step-repeat 2
    :voices 3)

  ;; Four voices, each entering later with the same stagger:
  (apply-phasing seq 1/16 :step-repeat 1 :voices 4)"

  ;; Step 1: Derive bar structure and total duration from the original sequence.
  (let* ((time-sigs (get-time-signature sequence))
         (total-dur (time-signature-length time-sigs :sum t))

         ;; Step 2: Build each voice.
         ;; Voice index v=0 -> original; v=1..N-1 -> phased voices.
         ;; For phased voice v, the effective step-repeat is (step-repeat * v),
         ;; so each voice drifts at a proportionally slower rate.
         (all-voices
          (loop for v from 0 below voices
                collect
                (if (= v 0)
                    ;; Voice 1: original, unchanged.
                    sequence
                    ;; Voice v+1: effective step-repeat = step-repeat * v.
                    (let* ((eff-step (* step-repeat v))
                           (flat-phased
                            (loop for bar in sequence
                                  for i from 0
                                  append
                                  (let* ((n-steps    (floor i eff-step))
                                         (offset-dur (* n-steps (abs delta))))
                                    (if (> offset-dur 0)
                                        (cons (- offset-dur) bar)
                                        bar))))
                           (trimmed (length-span total-dur flat-phased)))
                      (omn-to-time-signature trimmed time-sigs))))))

    all-voices))
