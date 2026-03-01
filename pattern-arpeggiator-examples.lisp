;;; =========================================================
;;; Pattern Arpeggiator Examples
;;; 
;;; This file provides standalone examples demonstrating 
;;; how to use the functions defined in pattern-arpeggiator.lisp
;;; =========================================================

;;; ---------------------------------------------------------
;;; 1. Generating Pitches and Simple Random Arpeggiation
;;; ---------------------------------------------------------

;; Define some midi-content directly via pitch strings
(setf midi-content-1 
      (pitch-to-midi '(bb3eb4fs4gs4bb4 cs4fs4gs4bb4cs5 b3eb4gs4bb4b4 bb3eb4fs4gs4bb4 bb3b3eb4fs4gs4 gs3bb3eb4fs4b4 fs3b3eb4fs4bb4 f3b3eb4fs4gs4)))
      
(setf midi-content-2 
      (pitch-to-midi '(eb4f4fs4gs4bb4 cs4f4fs4gs4bb4 cs4f4fs4gs4b4 b3eb4fs4gs4bb4 b3cs4fs4gs4bb4 b3cs4f4fs4gs4 bb3cs4f4fs4gs4 d4f4fs4gs4bb4)))

(setf midi-content-3 
      (pitch-to-midi '(d5e5f5g5a5 bb4d5e5f5g5 a4bb4d5e5f5 bb4d5e5f5g5 cs5e5f5g5a5 d5e5f5g5bb5 a4bb4cs5e5a5 a4bb4cs5e5g5)))

;; Using random generation (pattern-arpeggiator generates a pattern since fixed-pattern isn't provided)
(midi-to-pitch 
  (let ((midi-lists '((63 65 66 68 70) (61 65 66 68 70) (61 65 66 68 71) (59 63 66 68 70) 
                      (59 61 66 68 70) (59 61 65 66 68) (58 61 65 66 68) (62 65 66 68 70)))
        (pattern-set '((1 2 3 4 5) (1 2 3 4 5 4 5)))
        (repetitions 2))
    (pattern-arpeggiator midi-lists pattern-set repetitions)))

(midi-to-pitch 
  (let ((midi-lists '((74 76 77 79 81) (70 74 76 77 79) (69 70 74 76 77) (70 74 76 77 79)
                      (73 76 77 79 81) (74 76 77 79 82) (69 70 73 76 81) (69 70 73 76 79)))
        (pattern-set '((1 2 3 4 5) (1 2 3 4 5 4 5)))
        (repetitions 2))
    (pattern-arpeggiator midi-lists pattern-set repetitions)))


;;; ---------------------------------------------------------
;;; 2. Using Fixed Patterns
;;; ---------------------------------------------------------

;; Arpeggiating using run-pattern-arpeggiator
(run-pattern-arpeggiator 
 '((57 59 60 64 66 67) (57 62 64 66 67) (59 62 64 66 67))  ;; midi-lists
 '((1 2 3 4 5) (1 2 3 4 5 4 5))                            ;; pattern-set
 4                                                         ;; repetitions
 '(4 2 1 3 5))                                             ;; fixed-pattern


;; Large scale variable pattern example
(setf pitch-content 
      (pitch-to-midi '(e4g4a4b4d5 fs4g4a4b4d5 fs4g4a4b4e5 fs4g4a4c5e5 
                       g4a4b4c5fs5 g4a4b4d5g5 g4a4b4c5d5 fs4g4a4b4d5 
                       e4fs4g4b4c5 d4e4fs4g4b4 c4e4fs4g4a4 b3d4fs4g4b4)))
(setf rep-num 2)

;; Random
(setf notes
      (midi-to-pitch 
        (let ((midi-lists pitch-content)
              (pattern-set '((1 2 3 4 5) (1 2 3 4 5 4 5)))
              (repetitions rep-num))
          (pattern-arpeggiator midi-lists pattern-set repetitions))))

;; Fixed
(setf notes 
      (midi-to-pitch 
        (let ((midi-lists pitch-content)
              (pattern-set '((1 2 3 4 5) (1 2 3 4 5 4 5)))
              (repetitions 2)
              (fixed-pattern '(5 2 1 3 4)))
          (pattern-arpeggiator midi-lists pattern-set repetitions fixed-pattern))))


;;; ---------------------------------------------------------
;;; 3. Modifying Lists and Sublists
;;; ---------------------------------------------------------

;; Step Modification
(modify-list-steps '(1 1 1 1 1 0 0 0 0 0 0 0))

;; Rhythm Mapping with modify-list-steps in OMN
(make-omn 
 :length (flatten (binary-map 
                   (modify-list-steps '(1 1 1 1 0 1 0 1 0 0 0 0 0))
                   '1/12))
 :pitch '(a4)
 :articulation '(marc))

;; Sublist splitting and removing elements from even sublists
(let ((lst (split-into-sublists notes)))
  (remove-elements-from-even-sublists lst))


;;; ---------------------------------------------------------
;;; 4. Generating OMN and Combining Voices
;;; ---------------------------------------------------------

(setf omn-example
  (merge-voices 
   (make-omn 
    :length (gen-repeat (* 12 16) '1/12)
    :pitch '(e5 a5 f5 d5 g5 e5 a5 f5 d5 g5 d5 g5 e5 a5 f5 d5 g5 e5 a5 f5 d5 g5
             d5 g5 d5 g5 e5 bb4 f5 d5 g5 e5 bb4 f5 bb4 f5 d5 g5 e5 bb4 f5 d5 g5 e5
             bb4 f5 bb4 f5 bb4 f5 d5 a4 e5 bb4 f5 d5 a4 e5 a4 e5 bb4 f5 d5 a4 e5
             bb4 f5 d5 a4 e5 a4 e5 d5 g5 e5 bb4 f5 d5 g5 e5 bb4 f5 bb4 f5 d5 g5 e5
             bb4 f5 d5 g5 e5 bb4 f5 bb4 f5 e5 a5 f5 cs5 g5 e5 a5 f5 cs5 g5 cs5 g5
             e5 a5 f5 cs5 g5 e5 a5 f5 cs5 g5 cs5 g5 e5 bb5 f5 d5 g5 e5 bb5 f5 d5
             g5 d5 g5 e5 bb5 f5 d5 g5 e5 bb5 f5 d5 g5 d5 g5 bb4 a5 cs5 a4 e5 bb4
             a5 cs5 a4 e5 a4 e5 bb4 a5 cs5 a4 e5 bb4 a5 cs5 a4 e5 a4 e5 bb4 g5 cs5
             a4 e5 bb4 g5 cs5 a4 e5 a4 e5 bb4 g5 cs5 a4 e5 bb4 g5 cs5 a4 e5 a4 e5)
    :span :pitch)))

(omn-to-time-signature omn-example)

;; Additional Complex Rhythm Mapping OMN combinations...
(omn-to-time-signature
 (merge-voices
  (make-omn 
   :length '(s s e)
   :pitch (flatten '((d5 g4 e4 a4 b4 d5 g4 e4 a4 b4 a4 b4) (d5 g4 e4 a4 b4 d5 g4 e4 a4 b4)))
   :swallow 't
   :span :pitch)
  (make-omn 
   :length '(e s s)
   :pitch (pitch-transpose -12 (flatten '((d5 g4 e4 a4 b4 d5 g4 e4 a4 b4 a4 b4) (d5 g4 e4 a4 b4 d5 g4 e4 a4 b4))))
   :swallow 'f
   :span :pitch))
 '((4 4)))
