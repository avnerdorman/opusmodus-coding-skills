Opusmodus                                                                 end—osc-thread      1

end—osc-thread name
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

The END-OSC-THREAD function will end and destroy a given OSC thread. After the thread
is destroyed, you cannot send any messages to it.


Examples:
(setf thd1 (create-osc-thread "thread1" '(127.0.0.1 10000)))

(end-osc-thread thd1)
=> nil

Test:

(osc-thread-alivep thd1)
=> nil
