;;; violin-voicing.lisp
;;; Native Opusmodus voicing helpers for 4-note violin-friendly chord streams.

(in-package :opusmodus)

(defun vv-illegal-second-p (chord &optional (open-strings '(g3 d4 a4 e5)))
  "True when chord contains adjacent semitone/whole-tone steps,
except when both notes are open strings."
  (let* ((midi (sort (copy-list (pitch-to-midi chord)) #'<))
         (open (pitch-to-midi open-strings)))
    (loop for (a b) on midi
          while b
          for interval = (- b a)
          when (and (<= interval 2)
                    (not (and (member a open) (member b open))))
            do (return t)
          finally (return nil))))

(defun vv-enforce-second-rule (chords &optional (open-strings '(g3 d4 a4 e5)))
  "If chord violates the 2nd rule, reuse previous accepted chord."
  (let ((out '())
        (prev nil))
    (dolist (ch chords (nreverse out))
      (if (vv-illegal-second-p ch open-strings)
          (push (or prev ch) out)
          (progn
            (push ch out)
            (setf prev ch))))))

(defun vv-passing-map (density)
  "Preset passing-interval maps.
Density can be :none, :light, :medium or :dense."
  (case density
    (:none nil)
    (:light
     '((3 (1 1 1) (-1 -1 -1))
       (-3 (-1 -1 -1) (1 1 1))
       (4 (2 1 1) (-2 -1 -1))
       (-4 (-2 -1 -1) (2 1 1))))
    (:medium
     '((2 (1 1) (-1 -1))
       (-2 (-1 -1) (1 1))
       (3 (1 1 1) (-1 -1 -1))
       (-3 (-1 -1 -1) (1 1 1))
       (4 (2 1 1) (-2 -1 -1))
       (-4 (-2 -1 -1) (2 1 1))))
    (:dense
     '((1 (1) (-1))
       (-1 (-1) (1))
       (2 (1 1) (-1 -1))
       (-2 (-1 -1) (1 1))
       (3 (1 1 1) (-1 -1 -1) (2 1) (1 2))
       (-3 (-1 -1 -1) (1 1 1) (-2 -1) (-1 -2))
       (4 (2 1 1) (-2 -1 -1) (1 1 1 1))
       (-4 (-2 -1 -1) (2 1 1) (-1 -1 -1 -1))))
    (t
     (error "Unknown passing density: ~a" density))))

(defun vv-apply-path (chords path amb max-span seed)
  (case path
    (:closest
     (closest-path chords :ambitus amb :ambitus-chord max-span))
    (:relative
     (relative-closest-path chords :ambitus amb :ambitus-chord max-span :seed seed))
    (:comparative
     (comparative-closest-path chords :ambitus amb :ambitus-chord max-span :seed seed))
    (:none chords)
    (otherwise
     (error "Unknown path option: ~a" path))))

(defun vv-apply-passing (lengths pitch-seq passing passing-prob passing-seed)
  (if (eq passing :none)
      (make-omn :length lengths :pitch pitch-seq)
      (let* ((map (vv-passing-map passing))
             (omn (make-omn :length lengths :pitch pitch-seq)))
        (passing-intervals map omn
                           :chord t
                           :prob passing-prob
                           :seed passing-seed
                           :omn t))))

(defun violin-voicing (raw-omn
                       &key
                         (amb '(g3 e6))
                         (max-span 19)
                         (path :closest)
                         (seed nil)
                         (enforce-open-string-second-rule t)
                         (open-strings '(g3 d4 a4 e5))
                         (passing :none)
                         (passing-prob 0.45)
                         (passing-seed nil))
  "Main entry point.

Options:
- :path            :closest | :relative | :comparative | :none
- :passing         :none | :light | :medium | :dense
- :amb             violin range, default (g3 e6)
- :max-span        max chord span in semitones, default 19
- :enforce-open-string-second-rule T/NIL

Returns OMN with original lengths and transformed pitches.
If passing is enabled, passing-intervals can subdivide lengths while preserving total duration."
  (let* ((lengths (omn :length raw-omn))
         (pitches (omn :pitch raw-omn))
         (clean   (chord-pitch-unique pitches))
         (ranged  (ambitus-filter amb clean))
         (spaned  (ambitus-chord max-span ranged :unique t))
         (pathed  (vv-apply-path spaned path amb max-span seed))
         (safe    (if enforce-open-string-second-rule
                      (vv-enforce-second-rule pathed open-strings)
                      pathed)))
    (vv-apply-passing lengths safe passing passing-prob passing-seed)))

(defun violin-voicing-closest (raw-omn &key (passing :none) (seed nil))
  (violin-voicing raw-omn :path :closest :passing passing :seed seed))

(defun violin-voicing-relative (raw-omn &key (passing :none) (seed 23))
  (violin-voicing raw-omn :path :relative :passing passing :seed seed :passing-seed seed))

(defun violin-voicing-comparative (raw-omn &key (passing :none) (seed 23))
  (violin-voicing raw-omn :path :comparative :passing passing :seed seed :passing-seed seed))

(defun violin-voicing-balanced (raw-omn &key (seed 41))
  "Balanced preset for harmonic textures: stable voice-leading with subtle connective motion."
  (violin-voicing raw-omn
                  :path :relative
                  :seed seed
                  :passing :light
                  :passing-prob 0.38
                  :passing-seed seed
                  :max-span 19
                  :enforce-open-string-second-rule t))

(defun violin-voicing-quick-demo ()
  "Small demo based on the progression in your discussion."
  (let* ((src '(h c5eb5eb6g5 fs5f5c6a4 gs4d5d5b5 cs5eb5c6g4
                cs5d5gs5f4 fs4g5d5b4 eb5g4c5gs5 fs4gs5f5c5
                cs5f5gs4b5 gs4g5b5d5 g5g4b5d5 b5d5g4f5
                c6eb5gs4gs5 d5bb5bb4f5 b4g5d5g5 b4eb5gs5gs5
                bb4cs5bb5f5 c5eb5c5g5 c5a4e5a5 f5a4d6d5
                eb5c6g5c5 gs5c5f6f5 d5f5bb6bb5 fs5eb5bb5g6
                a5fs6f5c5 c5f5fs6d6 g6g5b4d6 g5g6b4d6)))
    (list
     (violin-voicing-closest src)
     (violin-voicing-relative src :seed 41)
     (violin-voicing-comparative src :seed 41)
    (violin-voicing-balanced src :seed 41)
     (violin-voicing src :path :closest :passing :light :passing-seed 41)
     (violin-voicing src :path :relative :passing :medium :seed 41 :passing-seed 41)
     (violin-voicing src :path :comparative :passing :dense :seed 41 :passing-seed 41))))
