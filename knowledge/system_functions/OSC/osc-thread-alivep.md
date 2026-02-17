Opusmodus                                                              osc-thread-alivep      1

osc-thread-alivep name
[Function]

Arguments and Values:
name                     an OSC thread variable.


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The OSC-THREAD-ALIVEP function checks if the given OSC thread object is still alive
and returns T if true.


Examples:
(setf thd1 (create-osc-thread "thread1" '(127.0.0.1 10000)))

(end-osc-thread thd1)
=> nil

Test:

(osc-thread-alivep thd1)
=> nil
