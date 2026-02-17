Opusmodus                                                                    send-osc-data       1

send-osc-data name data
[Function]

Arguments and Values:
name                      an OSC thread variable created using CREATE-OSC-THREAD
data                      a sequence of lists with dual values (<value><time>).


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The SEND-OSC-DATA function sends OSC data and performs a small amount of
"background" processing on messages in the queue when the processor would otherwise be
idle. This function can be called on a created thread any number of times during its lifetime.


Examples:
(defparameter reaktor '(127.0.0.1 10000))
(defparameter time (rnd-sample 50 '(1/4 1/2 1/4)))
(defparameter values (vector-smooth 0.05 (gen-noise 500)))
(defparameter data (gen-osc-data 60 values :time time))

(setf thd1 (create-osc-thread "thread1" reaktor))

(send-osc-data thd1 data)

To end OSC thread and the sending of the OSC messages, we call END-OSC-THREAD
function:

(end-osc-thread thd1)
