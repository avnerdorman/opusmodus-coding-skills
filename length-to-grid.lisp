(in-package :opusmodus)

(defun length-to-grid (sequence grid-val)
  "Converts a sequence of notes into a grid based on grid-val.
   A note of length 'e' (1/8) with grid-val 's' (1/16) becomes 's -s'.
   Rests are simply split."
  (flatten 
   (loop for event in (single-events (flatten sequence))
         collect 
         (let* ((len (if (listp (first (omn :length event)))
                         (first (first (omn :length event))) ;; handle nested length lists
                         (first (omn :length event))))
                (dur (abs len))
                (steps (round (/ dur grid-val)))) ;; Ensure integer steps
           
           (if (< len 0)
               ;; If rest, just returns N rests of grid-val
               (loop repeat steps collect (* -1 grid-val))
               ;; If note, return 1 note + (N-1) rests
               (append (list (cons grid-val (rest event)))
                       (loop repeat (- steps 1) collect (* -1 grid-val))))))))
