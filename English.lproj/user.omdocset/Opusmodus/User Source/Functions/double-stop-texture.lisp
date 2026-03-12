;;; Helper: combine adjacent pitch symbols into dyad symbols
;;; '(d5 a5 cs6 f6) -> '(d5a5 cs6f6)
(defun combine-flat-notes (flat-list)
  "Pairs adjacent symbols in a flat list into single combined symbols."
  (loop for (a b) on flat-list by #'cddr
        collect (intern (string-upcase
                          (concatenate 'string
                            (symbol-name a)
                            (symbol-name b))))))

;;; Helper: split one chord symbol into (lower-dyad upper-dyad)
;;; 4-note abcd -> (ab cd)
;;; 3-note abc  -> (ab bc)
(defun dst-split-chord (chord)
  (let* ((pitches (pitch-melodize (list chord)))
         (n       (length pitches)))
    (cond
      ((>= n 4)
       (list (first (combine-flat-notes (subseq pitches 0 2)))
             (first (combine-flat-notes (subseq pitches 2 4)))))
      ((= n 3)
       (list (first (combine-flat-notes (subseq pitches 0 2)))
             (first (combine-flat-notes (subseq pitches 1 3)))))
      (t
       (list (first pitches) (first pitches))))))

(defun double-stop-texture (chords &optional (repetitions 2)
                             &key
                             (subdiv    's)
                             (velocity  'mf)
                             (time-sig  '4/4))
  "Generate a bowed double-stop texture from CHORDS.

   Each chord is split into lower/upper dyads. Figure per chord:
     lower(marc+leg) upper(leg) upper(leg) lower(-)
   = 4 sixteenths per rep. At 2 reps: 8 sixteenths = 0.5 bar of 4/4.
   15 chords x 2 reps = 7.5 bars.

   4-note abcd: lower=ab, upper=cd
   3-note abc:  lower=ab, upper=bc

   Examples:
   (double-stop-texture my-chords 2)
   (double-stop-texture my-chords 2 :velocity 'ff)
   (double-stop-texture my-chords 1 :subdiv 'e :time-sig '3/4)
  "
  (let* (;; build pitch sequence: for each chord, repeat the figure reps times
         (pitches
          (loop for chord in chords
                for dyads  = (dst-split-chord chord)
                for lower  = (first dyads)
                for upper  = (second dyads)
                nconc (gen-repeat repetitions (list lower upper upper lower))))
         ;; articulation cycles over the 4-event figure
         (n-events  (* (length chords) repetitions 4))
         (arts      (gen-repeat (* (length chords) repetitions)
                                '(marc+leg - marc+leg -)))
         (lengths   (gen-repeat n-events (list subdiv)))
         (vels      (if (listp velocity)
                        velocity
                        (gen-repeat n-events (list velocity))))
         ;; bar grouping
         (subdiv-val (omn-encode subdiv))
         (total-dur  (* n-events subdiv-val))
         (n-bars     (ceiling total-dur (rationalize time-sig)))
         (bar-list   (gen-repeat n-bars (list time-sig))))
    (length-span bar-list
                 (make-omn :length      lengths
                           :pitch       pitches
                           :velocity    vels
                           :articulation arts
                           :span        :pitch)
                 :omn t)))
