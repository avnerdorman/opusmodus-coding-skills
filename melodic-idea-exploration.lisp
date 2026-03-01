(in-package :opusmodus)

;;; ==============================================================================
;;; MELODIC IDEA SCRATCHPAD
;;; 
;;; Evaluate these blocks one at a time (Cmd+E or Cmd+Shift+E) to hear and see 
;;; the results in the Opusmodus notation window. This is designed for modular
;;; experimentation rather than a fixed piece.
;;; ==============================================================================

;; 1. The Core Idea
;; Evaluate this to save your pattern to the variable 'my-idea'
(setf my-idea
  (make-omn 
   :length '((s s s s -s s s s s -s s s s e s)
             (s s s s -s s s s s s s s s e s))
   :pitch (flatten (list 
                    (make-scale 'g3 12 :alt '(3 4 3 -4)) 
                    'd4
                    (make-scale 'g3 14 :alt '(3 4 3 -4)) 
                    'd4))))

;; View it in notation (Cmd+E on the line below):
;; my-idea


;;; ------------------------------------------------------------------------------
;;; EXPERIMENT 1: BLOCK ADDITIVE (BUILD UP)
;;; ------------------------------------------------------------------------------

;; Try tweaking the :type (try 'linear, 'random, 'symmetric) 
;; or :step-repeat to make the buildup faster/slower.
(setf my-buildup 
      (gen-block-additive my-idea 
                          :type 'random 
                          :step-repeat 2 
                          :repeat-last 2
                          :flat t))


;;; ------------------------------------------------------------------------------
;;; EXPERIMENT 2: PHASING 
;;; ------------------------------------------------------------------------------

;; Rotate by rhythm grid (:method 'rotation-time)
;; Try changing the :delay to 1/8 to see coarser shifts, 
;; or :cycles to 4 so it stays locked together longer before shifting.
(setf my-phasing
      (gen-phasing my-idea 
                   :method 'rotation-time
                   :delay 1/16 
                   :shift 1 
                   :cycles 2 
                   :repetition 16 
                   :voices 2 
                   :merge t))

;; The output is a list of two voices. We can separate them:
(setf phase-voice-1 (first my-phasing))
(setf phase-voice-2 (second my-phasing))

;; To hear them layered interactively without a full defscore:
;; (merge-voices phase-voice-1 phase-voice-2)


;;; ------------------------------------------------------------------------------
;;; EXPERIMENT 3: BLOCK SUBTRACTIVE (DECONSTRUCTION)
;;; ------------------------------------------------------------------------------

;; We define a simple modular helper function in your workspace to reverse the additive process!
(defun gen-block-subtractive (sequence &key (type 'linear) (flat nil) seed lengths pitches (start-count 1) (repeat-last 0) (step-repeat 1))
  (let* ((additive (gen-block-additive sequence :type type :flat nil :seed seed :lengths lengths :pitches pitches :start-count start-count :repeat-last 0 :step-repeat step-repeat))
         (subtractive (reverse additive))
         (result (append subtractive (loop repeat repeat-last collect (first (last subtractive))))))
    (if flat (flatten result) result)))

;; Evaluate this block to test the subtractive process
(setf my-teardown 
      (gen-block-subtractive my-idea 
                             :type 'random 
                             :step-repeat 2 
                             :repeat-last 4 
                             :flat t))


;;; ------------------------------------------------------------------------------
;;; ASSEMBLING BLOCKS MODULARLY
;;; ------------------------------------------------------------------------------

;; Now you can easily mix and match these variables!
;; For example, create two parallel tracks by simply bringing the parts together:

(setf track-1 (append my-buildup phase-voice-1 my-teardown))
(setf track-2 (append my-buildup phase-voice-2 my-teardown))

;; Audition both tracks together:
;; (merge-voices track-1 track-2)
