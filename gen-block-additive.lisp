(in-package :opusmodus)

(defun gen-block-additive (sequence &key (type 'linear) (flat nil) seed lengths pitches (start-count 1) (repeat-last 0) (step-repeat 1) (display-seed nil))
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
    display-seed (boolean): If T, attaches the seed number as text to the first event of the output. Default: nil.

  Returns:
    list: A list of OMN measures (or flat OMN) showing the additive process."

  ;; 1. Setup the Seed State
  (let ((state *init-seed*))
    (setf seed (rnd-seed seed)) ;; If seed is nil, generate one; otherwise use provided
    
    ;; Force print to Listener (Listener output)
    (format t "~%gen-block-additive seed: ~a~%" seed)
    
    ;; Also verify verbose output
    (do-verbose ("gen-block-additive seed: ~s" seed)
      
      ;; 2. Main Logic
      (let* ((source (if sequence sequence (make-omn :length lengths :pitch pitches)))
             ;; Using single-events instead of the invalid omn-component-series
             ;; Flattening ensures we have a simple list of events to count
             (events (flatten (single-events source))) 
             (n (length events))
             ;; Generate the order of addition
             (indices (gen-additive-indices n :type type :seed (seed))))
        
        (let ((result
               (loop for count from start-count to n
                     append
                     (let* ((current-indices (subseq indices 0 count))
                            (processed-measure (apply-process-mask current-indices source)))
                       ;; Repeat this step step-repeat times
                       (loop repeat step-repeat collect processed-measure)))))
          
          ;; Add final repetitions
          (when (> repeat-last 0)
            (setf result (append result (loop repeat repeat-last collect source))))
          
          ;; Restore the global seed state
          (init-state state) 
          
          ;; Optional: Attach Seed Text to the first PITCHED note of the result
          (when display-seed
            (let* ((seed-label (format nil "Seed:~a" seed))
                   (first-measure (first result)))
              
              (if first-measure
                  (let* ((measure-events (single-events first-measure))
                         (found-note nil))
                    
                    ;; Reconstruct the measure, attaching text to the first non-rest event
                    (let ((new-measure
                           (flatten
                            (loop for evt in measure-events
                                  collect
                                  (let ((len (first (omn :length evt))))
                                    (if (and (not found-note) (not (< len 0))) ;; replaced length-rest-p
                                        (progn
                                          (setf found-note t)
                                          ;; Ensure velocity exists before adding text attribute
                                          ;; Standard OMN event list: (len pitch vel attrs...)
                                          (cond 
                                           ((< (length evt) 2) evt) ;; Should not happen for notes
                                           ((= (length evt) 2) (append evt (list 'mf seed-label))) ;; Add default mf
                                           (t (append evt (list seed-label))))) ;; Append to existing attrs
                                      evt))))))
                      
                      (setf (first result) new-measure)))
                nil)))

          (if flat
              (flatten result)
            result))))))
