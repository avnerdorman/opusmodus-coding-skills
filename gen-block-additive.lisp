(in-package :opusmodus)

(defun expand-midi-chord-from-bass (chord &key (up 1) (down 1) (dedupe t) (sort-output t))
  "Expands a MIDI chord by adding octave doublings of its bass note above and below.

  Args:
    chord (list): MIDI chord list in low-to-high order.
    up (integer): Number of octave doublings above the bass note.
    down (integer): Number of octave doublings below the bass note.
    dedupe (boolean): If T, remove duplicate pitches.
    sort-output (boolean): If T, return low-to-high sorted chord.

  Returns:
    list: Expanded MIDI chord."
  (if (null chord)
      chord
    (let* ((bass (first chord))
           (down-notes (loop for i from 1 to down collect (- bass (* 12 i))))
           (up-notes (loop for i from 1 to up collect (+ bass (* 12 i))))
           (expanded (append down-notes chord up-notes))
           (maybe-deduped (if dedupe (remove-duplicates expanded :test #'=) expanded)))
      (if sort-output
          (sort maybe-deduped #'<)
        maybe-deduped))))

(defun expand-midi-chord-list-from-bass (chord-list &key (up 1) (down 1) (dedupe t) (sort-output t))
  "Applies expand-midi-chord-from-bass to each chord in a list."
  (mapcar #'(lambda (chord)
              (expand-midi-chord-from-bass chord
                                           :up up
                                           :down down
                                           :dedupe dedupe
                                           :sort-output sort-output))
          chord-list))

(defun gen-block-additive (sequence &key (type 'linear) (flat nil) seed lengths pitches (start-count 1) (repeat-last 0) (step-repeat 1) (display-seed t))
  "Generates a Block Additive process (Reich style) by gradually revealing notes from a fixed rhythmic grid.
   Skips steps that only reveal rests, ensuring every output measure adds audible material.

  Args:
    sequence (list): Input OMN sequence. If nil, provide lengths and pitches.
    type (symbol): The build pattern ('linear, 'symmetric, 'random). Default: 'linear.
    flat (boolean): If T, returns a single flattened OMN list. Default: nil (returns a list of lists/measures).
    seed (integer): Seed for the random index generation. If nil, one is generated.
    lengths (list): If sequence is nil, provide lengths here.
    pitches (list): If sequence is nil, provide pitches here.
    start-count (integer): The number of output steps to start with.
    repeat-last (integer): Number of times to repeat the final (fully revealed) measure. Default: 0.
    step-repeat (integer): Number of times to repeat each intermediate step. Default: 1.
    display-seed (boolean): If T, prints seed to Listener and attaches it as score text on the first note. Default: t.

  Returns:
    list: A list of OMN measures (or flat OMN) showing the additive process."

  ;; 1. Setup the Seed State
  (let ((state *init-seed*))
    (setf seed (rnd-seed seed)) ;; If seed is nil, generate one; otherwise use provided

    ;; Always print seed to Listener so it is visible during audio preview
    (format t "~%gen-block-additive seed: ~a~%" seed)

    (do-verbose ("gen-block-additive seed: ~s" seed)

      ;; 2. Main Logic
      (let* ((source (if sequence sequence (make-omn :length lengths :pitch pitches)))
             (events (flatten (single-events source)))
             (n (length events))
             (indices (gen-additive-indices n :type type :seed (seed))))

        (let ((result
               (loop for count from start-count to n
                     append
                     (let* ((current-indices (subseq indices 0 count))
                            (processed-measure (apply-process-mask current-indices source)))
                       (loop repeat step-repeat collect processed-measure)))))

          ;; Add final repetitions
          (when (> repeat-last 0)
            (setf result (append result (loop repeat repeat-last collect source))))

          ;; Restore the global seed state
          (init-state state)

          ;; Attach Seed Text to the first PITCHED note of the result
          (when display-seed
            (let* (;; Register a unique symbol for this seed value as a non-sticky text attribute.
                   ;; add-text-attributes is the correct Opusmodus way to display text in the score.
                   (seed-sym (intern (string-upcase (format nil "gen-block-seed-~a" seed))))
                   (seed-text (format nil "seed:~a" seed))
                   (first-measure (first result)))

              (add-text-attributes (list seed-sym seed-text :non-sticky))

              (when first-measure
                (let* ((measure-events (single-events first-measure))
                       (found-note nil))

                  ;; Reconstruct the measure, attaching the seed symbol to the first non-rest event
                  (let ((new-measure
                         (flatten
                          (loop for evt in measure-events
                                collect
                                (let ((len (first (omn :length evt))))
                                  (if (and (not found-note) (not (< len 0)))
                                      (progn
                                        (setf found-note t)
                                        ;; Standard OMN event: (len pitch vel attrs...)
                                        (cond
                                         ((< (length evt) 2) evt)
                                         ((= (length evt) 2) (append evt (list 'mf seed-sym)))
                                         (t (append evt (list seed-sym)))))
                                    evt))))))

                    (setf (first result) new-measure))))))

          (if flat
              (flatten result)
            result)))))))

;; Example:
;; (setf expanded-chords
;;       (expand-midi-chord-list-from-bass
;;        '((69 74 77 81) (70 74 76 81) (67 74 77 81) (69 73 74 79)
;;          (69 74 77 81) (72 73 76 79) (70 73 76 81) (70 75 76 79)
;;          (69 74 77 81) (69 72 77 79) (70 74 79 81) (70 73 76 81)
;;          (67 74 77 82) (69 72 77 84) (70 74 79 81) (73 74 81 82))
;;        :up 2    ;; add bass +12 and +24
;;        :down 2  ;; add bass -12 and -24
;;        :dedupe t
;;        :sort-output t))
