Opusmodus                                                                           gen—osc-data   1

gen—osc-data span values &key min max time loop bpm
[Function]

Arguments and Values:
span                      a number or a ratio (total length).
values                    a oating-point numbers.
time                      a ratio, length symbol or oating-point number . The default is 1/128.
min                       a oating-point number or midi value. The default is NIL.
max                       a oating-point number or midi value. The default is NIL.
loop                      NIL or T. The default is NIL.
bpm                       a number (Beat per Minute). The default is 60.


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The GEN-OSC-DATA function generates a lists of paired controller values in a given span
(total length) with a de ned time for every value(<value><time>).

(gen-osc-data 4 (gen-sine 40 4 1)
              :time '(1/2 1/4 1/12 1/12 1/12)
              :min 0.0 :max 1.0)
=> ((0.5 1/2) (0.8090169 1/4) (0.9999998 1/12) (0.9999998 1/12)
    (0.8090168 1/12) (0.49999997 1/2) (0.19098307 1/4)
    (2.1935203E-7 1/12) (2.1935203E-7 1/12) (0.1909833 1/12)
    (0.5000001 1/2) (0.8090169 1/4) (0.9999998 1/12) (0.9999997 1/12)
    (0.80901694 1/12) (0.5 1/2) (0.19098301 1/4) (1.2534402E-7 1/12)
    (3.4469605E-7 1/12) (0.19098316 1/12))

(gen-osc-data 4 (gen-sine 40 4 1) :time '(1/2 1/4 1/12 1/12 1/12)
              :min 0.0 :max 1.0 :bpm 120)
=> ((0.5 1) (0.8090169 1/2) (0.9999998 1/6)
    (0.9999998 1/6) (0.8090168 1/6)
    (0.49999997 1) (0.19098307 1/2) (2.1935203E-7 1/6)
    (2.1935203E-7 1/6) (0.1909833 1/6))
                fi
                     fl
                     fl
                     fl
                                           fl
Opusmodus                                                   gen—osc-data   2

(gen-osc-data 4 (gen-sine 40 4 1) :time '(1/2 1/4 1/12 1/12 1/12)
              :min 0.0 :max 1.0 :bpm 72)
=> ((0.5 3/5) (0.8090169 3/10) (0.9999998 1/10)
    (0.9999998 1/10) (0.8090168 1/10) (0.49999997 3/5)
    (0.19098307 3/10) (2.1935203E-7 1/10) (2.1935203E-7 1/10)
    (0.1909833 1/10) (0.5000001 3/5) (0.8090169 3/10)
    (0.9999998 1/10) (0.9999997 1/10) (0.80901694 1/10) (0.5 2/5))

(gen-osc-data 4 '(60 70 80 66) :time '(1/2 1/4 1/12 1/12 1/12) :loop t)
=> ((60 1/2) (70 1/4) (80 1/12) (66 1/12) (60 1/12) (70 1/2) (80 1/4)
    (66 1/12) (60 1/12) (70 1/12) (80 1/2) (66 1/4) (60 1/12) (70 1/12)
    (80 1/12) (66 1/2) (60 1/4) (70 1/12) (80 1/12) (66 1/12))

(gen-osc-data 4 '(261.62555 466.1638 830.6094 369.99442)
              :time '(1/2 1/4 1/12 1/12 1/12) :loop t)
=> ((261.62555 1/2) (466.1638 1/4) (830.6094 1/12) (369.99442 1/12)
    (261.62555 1/12) (466.1638 1/2) (830.6094 1/4) (369.99442 1/12)
    (261.62555 1/12) (466.1638 1/12) (830.6094 1/2) (369.99442 1/4)
    (261.62555 1/12) (466.1638 1/12) (830.6094 1/12) (369.99442 1/2)
    (261.62555 1/4) (466.1638 1/12) (830.6094 1/12) (369.99442 1/12))

(setf data (gen-osc-data 4 (gen-sine 40 4 1)
            :time '(1/2 1/4 1/12 1/12 1/12)))

(setf thd1 (create-osc-thread "thread1" reaktor))

(send-osc-data thd1 data)
Opusmodus                                                   gen—osc-data   3

Examples:

4 length span:

(setf data1
 (gen-osc-data 4 (gen-sine 40 4 1) :time '(1/2 1/4 1/12 1/12 1/12))
               :min 0.1 :max 1.0)
=> ((0.5 1/2) (0.8090169 1/4) (0.9999998 1/12) (0.9999998 1/12)
    (0.8090168 1/12) (0.49999997 1/2) (0.19098307 1/4)
    (2.1935203E-7 1/12) (2.1935203E-7 1/12) (0.1909833 1/12)
    (0.5000001 1/2) (0.8090169 1/4) (0.9999998 1/12) (0.9999997 1/12)
    (0.80901694 1/12) (0.5 1/2) (0.19098301 1/4) (1.2534402E-7 1/12)
    (3.4469605E-7 1/12) (0.19098316 1/12))

(xy-plot data1
         :join-points t
         :point-radius 2
         :style :axis
         :point-style :hollow)
Opusmodus                                                   gen—osc-data   4

(setf data2
 (gen-osc-data 4 (gen-sine 40 4 1) :time '(2.0 1.0 0.031 0.031))
                :min 0.1 :max 1.0)
=> ((0.5 1/2) (0.8090169 1/4) (0.9999998 1/129) (0.9999998 1/129)
    (0.8090168 1/2) (0.49999997 1/4) (0.19098307 1/129)
    (2.1935203E-7 1/129) (2.1935203E-7 1/2) (0.1909833 1/4)
    (0.5000001 1/129) (0.8090169 1/129) (0.9999998 1/2) (0.9999997 1/4)
    (0.80901694 1/129) (0.5 1/129) (0.19098301 1/2) (1.2534402E-7 1/4)
    (3.4469605E-7 1/129) (0.19098316 1/129) (0.5000002 89/516))

(xy-plot data2
         :join-points t
         :point-radius 2
         :style :axis
         :point-style :hollow)
Opusmodus                                                   gen—osc-data   5

4.0 seconds span:

(setf data3
 (gen-osc-data 4.0 (gen-sine 40 4 1) :time '(1/2 1/4 1/12 1/12 1/12))
               :min 0.1 :max 1.0)
=> ((0.5 2.0) (0.8090169 1.0) (0.9999998 0.333) (0.9999998 0.333)
    (0.8090168 0.333) (0.49999997 0.0010004044))

(xy-plot data3
         :join-points t
         :point-radius 2
         :style :axis
         :point-style :hollow)
Opusmodus                                                   gen—osc-data   6

(setf data4
 (gen-osc-data 4.0 (gen-sine 40 4 1) :time '(2.0 1.0 0.031 0.031))
               :min 0.1 :max 1.0)
=> ((0.5 2.0) (0.8090169 1.0) (0.9999998 0.031)
    (0.9999998 0.031) (0.8090168 0.9380002))

(xy-plot data4
         :join-points t
         :point-radius 2
         :style :axis
         :point-style :hollow)
