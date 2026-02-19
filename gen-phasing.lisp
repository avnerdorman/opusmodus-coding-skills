(in-package :opusmodus)

(defun gen-phasing (sequence &key (method 'canon) (delay 1/8) (shift 1) (cycles 1) (repetition 1) (voices 2) (merge t))
  "Applies a phasing or canon process to a musical sequence.
   Supports 'canon' (delayed entry) and 'rotation' (Steve Reich style phase shifting).

  Args:
    sequence (list): Input OMN sequence (e.g., result of gen-block-additive).
    method (symbol): The technique to apply.
                     'canon    : Voices enter after a fixed delay.
                     'rotation : Voices play a loop, shifting indices (Clapping Music style).
    delay (length/int): For 'canon. The time delay (e.g., 1/8) or number of events. Default: 1/8.
    shift (integer): For 'rotation. The number of steps to rotate the pattern each cycle. Default: 1.
    cycles (integer): For 'rotation. How many times to repeat the pattern before shifting. Default: 1.
    repetition (integer): Total number of times to repeat the base sequence. Default: 1.
    voices (integer): Total number of voices to generate. Default: 2.
    merge (boolean): If T, returns a list of voices (polyphonic structure).
                     If NIL, returns a flat list (for single-line processing). Default: T.

  Returns:
    list: A list of lists (voices) or a flat OMN list."

   (let* ((base-seq (if (> repetition 1)
                       (gen-loop repetition sequence)
                       sequence))
         (voice-list
          (case method
            ((:canon 'canon)
             (loop for v from 0 below voices
                   collect
                   (if (= v 0)
                       base-seq
                       (let ((rest-val (if (numberp delay)
                                           (* v (if (floatp delay) (* -1 (rationalize delay)) (* -1 (abs delay))))
                                           ;; If it's not a number, we assume it is a length symbol (e.g., 'q).
                                           ;; We cannot easily "multiply" a symbol without resolving it.
                                           ;; SAFEST: Just collect the delay V times.
                                           (loop repeat v collect delay)))) 
                         
                         ;; Prepend rest to the sequence for delayed voices
                         (append (if (listp rest-val) rest-val (list rest-val)) base-seq)))))

            ((:rotation 'rotation)
             (loop for v from 0 below voices
                   collect
                   (if (= v 0)
                       base-seq
                       ;; For subsequent voices, apply rotation logic over time
                       ;; Logic: We need to build the full sequence by repeating the base block
                       ;; BUT shifting it every 'cycles' repetitions.
                       
                       (let* ((block (if (listp (first sequence)) (flatten sequence) sequence))
                              ;; If user repeated the input, we treat the input as the base block.
                              ;; If repetition > 1, we are generating the full stream here anyway.
                              ;; So let's ignore pre-calculated base-seq for rotation and rebuild it.
                              
                              (total-reps repetition)) 
                         
                         (flatten
                          (loop for r from 0 below total-reps
                                collect
                                (let* ((cycle-group (floor r cycles))  ;; 0,0,0, 1,1,1... if cycles=3
                                       (rot-amount (* cycle-group shift v))) ;; Include voice index v
                                  
                                  ;; Apply rotation. 'gen-rotate' handles OMN structure.
                                   ;; Negative shift rotates to the left (standard phasing).
                                  (gen-rotate (* -1 rot-amount) block)))))))))))

     ;; Formatting the Output
     (if merge
         voice-list
         (flatten voice-list))))