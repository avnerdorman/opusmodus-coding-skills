(in-package :opusmodus)

;;;---------------------------------------------------------
;;; Function: apply-negative-phasing
;;; Description: Creates a two-voice negative phasing structure from a barred
;;;              OMN list using grid quantization and cyclic rotation.
;;;              Each successive bar (or group of bars) advances its content
;;;              by one additional delta, with removed content wrapping to end.
;;;
;;; Arguments:
;;;   sequence:    Nested OMN list, one sublist per bar: ((bar1)(bar2)...)
;;;   delta:       Duration ratio defining both the grid and the phase step
;;;                (e.g., 1/16, 1/8, 1/4)
;;;   step-repeat: Integer - bars sharing the same rotation before incrementing
;;;                (default 1)
;;;
;;; Returns:
;;;   A list of two bar-grouped OMN voices: (voice-1 voice-2)
;;;
;;; How it works:
;;;   Each bar in Voice 2 is first quantized to the delta grid using
;;;   LENGTH-TO-GRID (notes longer than delta become a note + rests,
;;;   all events are exactly delta in duration). The bar is then left-rotated
;;;   by n steps via GEN-ROTATE, where n = floor(bar-index / step-repeat).
;;;   One left-rotation step = advancing bar content by exactly delta.
;;;   Content that wraps off the start reappears at the bar end.
;;;   Total bar duration is always preserved.
;;;
;;; Best results when note durations in the sequence are exact multiples of
;;; delta. If not, the grid expansion introduces rests after each note attack,
;;; and the rotation shifts attacks through those rest slots as well.
;;;---------------------------------------------------------

(defun apply-negative-phasing (sequence delta &key (step-repeat 1))
  "Creates a two-voice negative phasing structure from a bar-grouped OMN sequence.

  Voice 1 is the original sequence, unchanged.
  Voice 2 advances each bar's content progressively earlier by rotating it
  left on a delta-quantized grid. Content that would 'fall off' the start
  of the bar wraps to the bar end, so total duration is always preserved.

  The approach mirrors the :rotation-time method in gen-phasing, but applies
  a different rotation to each individual bar rather than a single loop.

  Arguments:
    sequence    - Bar-grouped OMN list: ((bar1)(bar2)(bar3)...)
    delta       - Phasing grid size and offset increment (e.g., 1/16, 1/8, 1/4)
    step-repeat - Integer: how many bars share the same rotation before it
                  increments. Default: 1.
                  :step-repeat 2 -> bars 1-2 use rotation 0,
                                    bars 3-4 use rotation 1, etc.

  Returns:
    (voice-1 voice-2)
    voice-1 = original bar-grouped sequence (unchanged)
    voice-2 = quantized, rotated, and re-barred sequence

  Note on quantization:
    All bars in Voice 2 are quantized to the delta grid via LENGTH-TO-GRID.
    A note longer than delta (e.g. a quarter note with delta=1/16) becomes
    a 1/16 attack followed by 1/16 rests. This means Voice 2 will sound
    more staccato/percussive than Voice 1 when delta < note duration.
    The rotation is then clean and exact regardless of the original rhythms.
    For notation purposes, results are cleanest when note durations are
    exact multiples of delta (e.g. all quarter notes, delta = 1/4 or 1/8).

  Examples:
    ;; All notes already on the 1/16 grid - cleanest case
    (apply-negative-phasing
      '((s c4 d4 e4 f4 g4 a4 b4 c5)
        (s d5 e5 f5 g5 a5 g5 f5 e5)
        (s d5 c5 b4 a4 g4 f4 e4 d4)
        (s c4 d4 e4 f4 g4 a4 b4 c5))
      1/16)

    ;; Quarter-note bars phased by quarter-note delta
    (apply-negative-phasing
      '((q c4 d4 e4 f4)
        (q g4 a4 b4 c5)
        (q d5 e5 f5 g5)
        (q a5 g5 f5 e5))
      1/4)

    ;; Slower: offset increments every 2 bars
    (apply-negative-phasing
      '((q c4 d4 e4 f4)
        (q g4 a4 b4 c5)
        (q d5 e5 f5 g5)
        (q a5 g5 f5 e5))
      1/4
      :step-repeat 2)"

  ;; Step 1: Capture the bar structure from Voice 1.
  (let* ((time-sigs (get-time-signature sequence))

         ;; Step 2: Build Voice 2 bar by bar.
         ;; For bar i (0-based):
         ;;   - quantize to delta grid with LENGTH-TO-GRID
         ;;     (every event in the result is exactly delta in duration)
         ;;   - left-rotate by n-steps via GEN-ROTATE
         ;;     (one left step = advance content by one delta)
         ;; The loop uses APPEND to collect all bars as one flat OMN stream.
         (flat-phased
          (loop for bar in sequence
                for i from 0
                append
                (let* ((n-steps   (floor i step-repeat))
                       ;; Quantize: each note/rest -> N events of exactly delta
                       (quantized (length-to-grid bar delta)))
                  ;; GEN-ROTATE negative = left rotation:
                  ;;   head events move to tail, content advances earlier.
                  (if (> n-steps 0)
                      (gen-rotate (- n-steps) quantized)
                      quantized))))

         ;; Step 3: Re-bar the flat stream to match the original bar lines.
         (voice-2 (omn-to-time-signature flat-phased time-sigs)))

    (list sequence voice-2)))
