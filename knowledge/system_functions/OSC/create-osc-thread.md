Opusmodus                                                                    create-osc-thread     1

create-osc-thread name target
[Function]

Arguments and Values:
name                    a string (an OSC thread object name).
target                  a variable name or a list of paired values (<remote-host><remote-port>).


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The CREATE-OSC-THREAD function creates the OSC thread with a given target.


Examples:

Here we assign a name Reaktor to a remote-host: 127.0.0.1 and remote-
port: 10000:

(defparameter reaktor '(127.0.0.1 10000))

Here we assign an variable to our OSC thread object, this is important for sending the data
with the thread and for ending the thread:

(setf thd1 (create-osc-thread "thread1" reaktor))

To send OSC messages with the thread we call the SEND-OSC-DATA function:

(send-osc-data thd1 '((0.0 1/2) (0.0 1/2) (0.08238555 2)
                      (0.10876829 1) (0.12127061 11/2)))

To end the OSC thread and the sending of the OSC messages, we call the END-OSC-
THREAD function:

(end-osc-thread thd1)
