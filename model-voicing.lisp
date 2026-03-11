;;; model-voicing.lisp
;;; Model-driven chord voicing: substitutes input pitch classes toward
;;; model interval structures, then searches octave arrangements.
;;;
;;; Opusmodus functions used:
;;;   midi-to-pitch  — convert MIDI integers to Opusmodus pitch symbols
;;;   closest-path   — optional final voice-leading polish pass

(in-package :opusmodus)

;; ── Data ─────────────────────────────────────────────────────────────────────

(setf model-midi
  '((61 67 72 76)
    (64 70 75 79)
    (67 73 78 82)
    (70 76 81 85)
    (69 74 79 84)))

(setf input-chords-midi
  '((72 79 84 87) (72 79 86 89) (72 77 80 86) (72 79 84 87) (72 80 87)
    (72 78 81 86) (71 79 86 91) (70 76 79 84) (69 77 84 89) (68 74 82)
    (67 75 82)    (69 75 84)    (66 72 81)    (67 74 82)    (63 72 79)
    (60 75 80)    (62 69 78)    (58 74 79)    (63 74 79)    (63 72 79)
    (62 72 77)    (62 70 77)    (67 77 82)    (67 76 82)    (65 70 79)
    (65 68 77)    (68 77 84)    (70 77 86)    (67 82 87)    (68 77 87)
    (70 79 87)    (70 77 86)    (70 76 85)    (69 77 84)    (68 74 83)
    (67 75 82)    (66 75 81)    (65 74 80)    (63 74 79)    (63 72 79)
    (62 72 77)    (55 71 77)    (60 70 76)    (53 68 77)    (54 72 75)
    (55 71 74)    (55 63 72)    (55 62 72)    (55 62 71)    (55 61 70)
    (55 60 69)    (55 60 68)    (55 59 67)    (55 65 67)    (60 63 67)))

(defconstant +range-low+  48)   ; C3
(defconstant +range-high+ 96)   ; C7

;; ── Model analysis ────────────────────────────────────────────────────────────

(defun mv-get-intervals (chord)
  "Adjacent semitone intervals of a sorted MIDI chord."
  (let ((s (sort (copy-list chord) #'<)))
    (loop for (a b) on s while b collect (- b a))))

(defun mv-span-stats (model)
  "Return (values mean std) of chord spans in semitones."
  (let* ((spans (mapcar (lambda (c) (- (apply #'max c) (apply #'min c))) model))
         (mean  (/ (apply #'+ spans) (length spans)))
         (var   (/ (apply #'+ (mapcar (lambda (s) (expt (- s mean) 2)) spans))
                   (length spans))))
    (values mean (sqrt var))))

(defun mv-chord-pcs (chord)
  "Extract unique pitch classes from a MIDI chord, sorted."
  (sort (remove-duplicates (mapcar (lambda (n) (mod n 12)) chord)) #'<))

(defun mv-model-pc-sets (model)
  "Return all 12 transpositions of each model chord's PC-set.
Result is a flat list of PC-sets (each a sorted list of PCs)."
  (let ((result nil))
    (dolist (chord model)
      (let* ((pcs (mv-chord-pcs chord))
             (bass (car pcs))
             ;; intervals from bass
             (ivs (mapcar (lambda (pc) (mod (- pc bass) 12)) pcs)))
        ;; transpose to all 12 roots
        (dotimes (root 12)
          (push (sort (mapcar (lambda (iv) (mod (+ root iv) 12)) ivs) #'<)
                result))))
    (remove-duplicates result :test #'equal)))

;; ── PC substitution ───────────────────────────────────────────────────────────

(defun mv-pc-set-distance (pcs-a pcs-b)
  "Minimum total semitone movement to map PC-set A onto PC-set B.
Uses nearest-neighbour matching in pitch class space (mod 12)."
  (let ((n (max (length pcs-a) (length pcs-b)))
        (a (copy-list pcs-a))
        (b (copy-list pcs-b)))
    ;; Pad shorter list by repeating its first element
    (loop while (< (length a) n) do (setf a (append a (list (car a)))))
    (loop while (< (length b) n) do (setf b (append b (list (car b)))))
    ;; Sum of nearest distances in mod-12 space
    (apply #'+ (mapcar (lambda (pc-a)
                         (apply #'min (mapcar (lambda (pc-b)
                                                (min (mod (- pc-b pc-a) 12)
                                                     (mod (- pc-a pc-b) 12)))
                                              b)))
                       a))))

(defun mv-weighted-choice (weighted-items)
  "Pick one item stochastically from ((item . weight) ...) using rnd-row."
  (let* ((total  (apply #'+ (mapcar #'cdr weighted-items)))
         (r      (* (random 1.0) total))
         (cumsum 0.0))
    (dolist (pair weighted-items (caar (last weighted-items)))
      (incf cumsum (cdr pair))
      (when (<= r cumsum)
        (return (car pair))))))

(defun mv-select-pc-set (input-chord model-pc-sets blend n-voices)
  "Stochastically select a model PC-set for INPUT-CHORD.

BLEND controls the probability that this chord gets substituted at all:
  0.0 = never substitute (all chords keep their input PCs)
  0.5 = substitute ~half the chords at random
  1.0 = always substitute every chord

When substitution does happen, the choice is weighted by closeness:
closer model PC-sets are more likely, so chord quality (minor/major/dominant)
naturally produces varied results on different seeds."
  (let* ((input-pcs  (mv-chord-pcs input-chord))
         (candidates (let ((same-n (remove-if (lambda (s) (/= (length s) n-voices)) model-pc-sets)))
                       (if same-n same-n model-pc-sets))))
    ;; First: decide whether to substitute this chord at all
    (if (> (random 1.0) blend)
        input-pcs   ; keep original PCs
        ;; Substitute: pick from model PC-sets weighted by closeness
        (let* ((scored (mapcar (lambda (pc-set)
                                 (let ((d (mv-pc-set-distance input-pcs pc-set)))
                                   (cons pc-set (/ 1.0 (+ d 0.5)))))
                               candidates)))
          (mv-weighted-choice scored)))))

;; ── Octave search ─────────────────────────────────────────────────────────────

(defun mv-candidate-octaves (pc &optional (lo +range-low+) (hi +range-high+))
  "All MIDI values in [lo,hi] with pitch class PC."
  (loop for m from lo to hi when (= (mod m 12) pc) collect m))

(defun mv-voice-leading-cost (from-chord to-notes)
  "Sum of nearest-note distances from each note in FROM-CHORD to TO-NOTES."
  (apply #'+ (mapcar (lambda (p)
                       (apply #'min (mapcar (lambda (q) (abs (- p q))) to-notes)))
                     from-chord)))

(defun mv-score-voicing (chord iv-dist span-mean)
  "Score CHORD (sorted MIDI list) by interval match to model and span."
  (let* ((s   (sort (copy-list chord) #'<))
         (n   (length s))
         (ivs (mv-get-intervals s))
         (sc  0.0))
    ;; 1. Interval frequency reward
    (dolist (iv ivs)
      (let ((freq (or (cdr (assoc iv iv-dist)) 0)))
        (incf sc (* freq 100)))
      (when (<= iv 2) (decf sc 40))
      (when (> iv 12) (decf sc (* (- iv 12) 3.0))))
    ;; 2. Span similarity to model mean
    (let* ((span     (- (car (last s)) (car s)))
           (span-dev (abs (- span span-mean))))
      (decf sc (* span-dev 2.0)))
    ;; 3. Open voicing: wider interval at bottom
    (when (>= n 2)
      (let ((bottom-iv (- (nth 1 s) (nth 0 s)))
            (top-iv    (- (nth (1- n) s) (nth (- n 2) s))))
        (when (>= bottom-iv top-iv) (incf sc 8))))
    sc))

(defun mv-interval-distribution (model)
  "Return alist of (interval . relative-frequency) across all model chords."
  (let* ((all-ivs (loop for chord in model append (mv-get-intervals chord)))
         (total   (length all-ivs))
         (counts  nil))
    (dolist (iv all-ivs)
      (let ((entry (assoc iv counts)))
        (if entry (incf (cdr entry)) (push (cons iv 1) counts))))
    (mapcar (lambda (e) (cons (car e) (/ (cdr e) total))) counts)))

(defun mv-best-voicing (pcs iv-dist span-mean
                        &key prev (n-voices 4) (vl-weight 0.15))
  "Search all octave combinations of PCS, return highest scoring voicing."
  (let* (;; Fill to n-voices
         (pcs (cond ((>= (length pcs) n-voices) (subseq pcs 0 n-voices))
                    ((= n-voices 4)
                     (cond ((= (length pcs) 1) (list (car pcs) (car pcs) (car pcs) (car pcs)))
                           ((= (length pcs) 2) (list (car pcs) (cadr pcs) (car pcs) (cadr pcs)))
                           (t (append pcs (list (car pcs))))))
                    (t
                     (if (= (length pcs) 1)
                         (list (car pcs) (car pcs) (car pcs))
                         (append pcs (list (car pcs)))))))
         (pools   (mapcar #'mv-candidate-octaves pcs))
         (best    nil)
         (best-sc (- most-positive-fixnum)))
    (labels ((search-combos (remaining current)
               (if (null remaining)
                   (let ((notes (sort (copy-list current) #'<)))
                     (when (and (= (length (remove-duplicates notes)) (length notes))
                                (<= (- (car (last notes)) (car notes)) 24))
                       (let* ((sc      (mv-score-voicing notes iv-dist span-mean))
                              (vl-cost (if prev (mv-voice-leading-cost prev notes) 0))
                              (total   (- sc (* vl-cost vl-weight))))
                         (when (> total best-sc)
                           (setf best-sc total best (copy-list notes))))))
                   (dolist (note (car remaining))
                     (search-combos (cdr remaining) (cons note current))))))
      (search-combos pools nil))
    (values best best-sc)))

;; ── Main entry point ──────────────────────────────────────────────────────────

(defun run-model-voicing (&key (polish t) (verbose t)
                               (n-voices 4) (blend 1.0) (vl-weight 0.15)
                               (seed nil))
  "Re-voice INPUT-CHORDS-MIDI using MODEL-MIDI as a style reference.
Sets global VOICED-CHORDS to the resulting Opusmodus pitch list.

Key parameters:
  :blend      — probability of substituting each chord's PCs toward the model (default 1.0)
                0.0 = no chords changed, 0.5 = ~half changed, 1.0 = all changed
                when substituted, closer model PC-sets are chosen more often
  :n-voices   — 3 or 4 voices (default 4)
  :vl-weight  — voice-leading smoothness (default 0.15, higher = smoother)
  :seed       — integer for reproducible results, NIL = different each time
  :polish     — apply final closest-path pass (default T)
  :verbose    — print per-chord output (default T)

Examples:
  (run-model-voicing :seed 42)               ; reproducible
  (run-model-voicing :blend 0.5 :seed 7)     ; partial substitution
  (run-model-voicing :blend 0.0)             ; octave-only, no PC change
  (run-model-voicing :n-voices 3 :seed 23)   ; 3-voice output"
  (let* ((seed          (or seed (random 100000)))
         (iv-dist       (progn (rnd-seed seed) (mv-interval-distribution model-midi)))
         (model-pc-sets (mv-model-pc-sets model-midi)))
    (multiple-value-bind (span-mean span-std)
        (mv-span-stats model-midi)
      (when verbose
        (format t "; seed: ~a~%" seed)
        (format t "; Model span: mean=~,1f  std=~,1f~%" span-mean span-std)
        (format t "; Interval dist: ~a~%~%"
                (sort (copy-list iv-dist) #'< :key #'car)))
      (let ((raw-results nil)
            (prev        nil))
        (dolist (chord input-chords-midi)
          (let* ((target-pcs (mv-select-pc-set chord model-pc-sets blend n-voices)))
            (multiple-value-bind (voicing sc)
                (mv-best-voicing target-pcs iv-dist span-mean
                                 :prev prev
                                 :n-voices n-voices
                                 :vl-weight vl-weight)
              (let* ((v   (or voicing (sort (copy-list chord) #'<)))
                     (ivs (mv-get-intervals v))
                     (vl  (if prev (mv-voice-leading-cost prev v) 0)))
                (when verbose
                  (format t "; ~25a pcs=~a → ~22a  iv=~a  Δ=~a~%"
                          chord target-pcs v ivs vl))
                (push v raw-results)
                (setf prev v)))))
        ;; Convert MIDI integers → Opusmodus pitch symbols
        (let* ((midi-list  (nreverse raw-results))
               (pitch-list (mapcar #'midi-to-pitch midi-list))
               (result     (if polish
                               (closest-path pitch-list :ambitus '(c3 c7))
                               pitch-list)))
          (setf voiced-chords result)
          (when verbose
            (format t "~%; ── voiced-chords ──~%")
            (loop for ch in voiced-chords do (format t "; ~a~%" ch)))
          result)))))

;; ── Run ───────────────────────────────────────────────────────────────────────
;; Load the file, then call manually:
;;   (run-model-voicing :seed 42)                       ; reproducible, full substitution
;;   (run-model-voicing :blend 0.5 :seed 7)             ; partial — closer matches more likely
;;   (run-model-voicing :blend 0.0)                     ; octave-only, no PC change
;;   (run-model-voicing :n-voices 3 :seed 23)           ; 3-voice output
;;   (run-model-voicing :vl-weight 0.5 :seed 42)        ; smoother voice leading
