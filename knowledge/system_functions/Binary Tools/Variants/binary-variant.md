Opusmodus                                                                       binary-variant     1

binary-variant binary variant &key section exclude seed
[Function]

Arguments and Values:
binary                 a binary list.
variant                'p (prime), 'r (retrograde), 'i (inversion), 'ri (retrograde-inversion)
                       and '? (at random).
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
seed                   This is an integer that guarantees consistent results each time the code is
                       evaluated. By providing a speci c seed, you can ensure that the randomness in
                       your code is reproducible. The default value for seed is NIL, which means the
                       seed is not set, resulting in different outputs on each run due to natural
                       randomness.


Description:

The function BINARY-VARIANT can process a sequence of common variant forms on lists
of binary values. The variant functions include prime 'p, retrograde 'r, inversion 'i,
retrograde inversion 'ri and '? at random. This is an invaluable partner to binary
templates.


Examples:
(binary-variant '(0 1 1 0 1 0 1 1) 'r)
=> (1 1 0 1 0 1 1 0)

(binary-variant '(0 1 1 0 1 0 1 1) 'i)
=> (1 0 0 1 0 1 0 0)

(binary-variant '(0 1 1 0 1 0 1 1) 'ri)
=> (0 0 1 0 1 0 0 1)

(binary-variant '(0 1 1 0 1 0 1 1) '? :seed 245)
=> (1 1 0 1 0 1 1 0)

(binary-variant '((0 1 1 0) (1 0 1 1)) 'i :section 0)
=> ((1 0 0 1) (1 0 1 1))
                                              fi
Opusmodus                                                                    binary-variant   2

Score Example:

Here's a short example of hocketing in a duo for soprano sax and clarinet.

(setf stream
      (integer-to-pitch
       (vector-round -12 12 (gen-noise 30 :seed 12))))

(setf map (gen-binary-ambitus '(c4 cs5) stream))
(setf stream-1 (binary-map map stream))
(setf rhy-1 (binary-map map 's))
(setf map2 (binary-variant map 'i))
(setf rhy-2 (binary-map map2 's))
(setf stream-2 (binary-map map2 stream))

(def-score duo
           (:title "duo"
              :key-signature 'chromatic
              :time-signature '(3 4)
              :tempo 60)

  (alto-sax
   :length rhy-1
   :pitch stream-1
   :velocity '(ff)
   :channel 1
   :sound 'gm
   :program 'soprano-sax
   :pan 110)

  (horn
   :length rhy-2
   :pitch stream-2
   :velocity '(f)
   :channel 2
   :program 'clarinet
   :pan 10))
