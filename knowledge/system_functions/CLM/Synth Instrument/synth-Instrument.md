Opusmodus                                                             synth-instrument   1


Synth Instrument

To make CLM instrument work with omn-form type values you need to convert omn-
form list to the four essential CLM instrument values: start, duration, frequency and
amplitude.

The examples below show you how to do that.

(setf omn '(3e gb6 bb6 db6 gb6 eb6 gb6 db6 gb6 bb5 db6 gb5 bb5))

The SYNTH-EVENTS function converts an omn-form list into the CLM values:

(setf events (synth-events omn omn omn :bpm 60))

The functions below collecting the explicit CLM instrument values.

Start:

(synth-element-start events)
=> (0 0.16666667 0.33333334 0.5 0.6666667 0.8333334 1.0
    1.1666666 1.3333333 1.4999999 1.6666665 1.8333331)

Duration:

(synth-element-dur events)
=> (0.16666667 0.16666667 0.16666667 0.16666667 0.16666667 0.16666667
    0.16666667 0.16666667 0.16666667 0.16666667 0.16666667 0.16666667)

Frequency:

(synth-element-freq events)
=> (1479.9775 1864.6549 1108.7306 1479.9775 1244.5079 1479.9775
    1108.7306 1479.9775 932.3276 1108.7306 739.9888 932.3276)

Amplitude:

(synth-element-amp events)
=> (0.54 0.54 0.54 0.54 0.54 0.54 0.54 0.54 0.54 0.54 0.54 0.54)

Count of elements:

(synth-element-count events)
=> 12
Opusmodus                                                             synth-instrument      2

Example with duration, frequency and amplitude input

First you need to de ne your own CLM instrument:

(definstrument simp-saw (beg dur freq amp)
  (let* ((os (make-sawtooth-wave freq))
           (start (floor (* beg *srate*)))
           (end (+ start (floor (* dur *srate*)))))
    (run
     (loop for i from start to end do
       (outa i (* amp (sawtooth-wave os)))))))

The next step is to create a new function which allows you to use an omn-form type input.
You can use the examples below as a template for your on conversion functions:

(defun simp-saw-synth (dur freq amp &key (bpm 60))
  (do-verbose ("simp-saw-synth")
    (let* ((events (synth-events dur freq amp :bpm bpm))
           (start (synth-element-start events))
           (duration (synth-element-dur events))
           (frequency (synth-element-freq events))
           (amplitude (synth-element-amp events)))

       (loop
         for s in start
         for d in duration
         for f in frequency
         for a in amplitude
         do
         (simp-saw s d f a))
       )))
             fi
Opusmodus                                                            synth-instrument   3

This example takes an original GONG CLM instrument with a list of keywords:

(defun gong-synth (dur freq amp &key (degree 0.0) (distance 1.0)
                   (reverb-amount 0.005) (bpm 60))

  (do-verbose ("gong-synth")
    (let* ((events (synth-events dur freq amp :bpm bpm))
           (start (synth-element-start events))
           (duration (synth-element-dur events))
           (frequency (synth-element-freq events))
           (amplitude (synth-element-amp events))
           (count (synth-element-count events))

             ; if a keyword input is a list use LISTS! instead of LIST!
             (degree (gen-trim count (list! degree)))
             (distance (gen-trim count (list! distance)))
             (reverb-amount (gen-trim count (list! reverb-amount))))
       (loop
         for s in start
         for d in duration
         for a in amplitude
         for f in frequency
         ; keywords
         for k1 in degree
         for k2 in distance
         for k3 in reverb-amount
         do
           ; original CLM instrument
         (gong s d f a
               :degree        k1
               :distance      k2
               :reverb-amount k3))
       )))

OMN-form function GONG-SYNTH:

(with-sound ()
 (gong-synth 's
             (rnd-sample 48 '((c4 =) (ds5 =) (f4 =) (g3 =) (a5 =)))
             'ff :bpm 120))
Opusmodus                                                 synth-instrument   4

Example with sound le input

Here the original CLM instrument is EXPSRC:

(defun expsrc-synth (dur file amp exp-ratio src-ratio
                     :key reverb-amount file-start (bpm 60))

  (do-verbose ("expsrc-synth")
    (let* ((events (synth-events dur nil amp :bpm bpm))
           (start (synth-element-start events))
           (duration (synth-element-dur events))
           (amplitude (synth-element-amp events))
           (count (synth-element-count events))

            ; if a keyword input is a list use LISTS! instead of LIST!
            (files (gen-trim count (list! file)))
            (exp-ratio (gen-trim count (list! exp-ratio)))
            (src-ratio (gen-trim count (list! src-ratio)))
            (reverb-amount (gen-trim count (list! reverb-amount)))
            (file-start (gen-trim count (list! file-start))))

       (loop
         for s in start
         for d in duration
         for f in files
         for a in amplitude
         ; keywords
         for k1 in exp-ratio
         for k2 in src-ratio
         for k3 in reverb-amount
         for k4 in file-start
         do
         ; original CLM instrument
         (expsrc s d a f
                 k1
                 k2
                 :reverb-amount k3
                 :file-start     k4
                 ))
       )))

OMN-form function EXPSRC-SYNTH:

(with-sound ()
 (expsrc-synth '(w w w w) "granis" '(mp f p mp)
               '(1 2 3.2 2) '(0.4434 0.7 0.3 .1)))
                 fi
