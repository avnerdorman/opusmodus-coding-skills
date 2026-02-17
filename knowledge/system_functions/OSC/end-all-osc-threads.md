Opusmodus                                                           end—all-osc-threads       1

end—all-osc-threads ()
[Function]


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The END-ALL-OSC-THREADS function will end and destroy all OSC threads. You cannot
send any messages to the threads once they are destroyed.


Examples:
(defparameter reaktor '(127.0.0.1 10000))

(create-osc-thread "thread1" reaktor)
(create-osc-thread "thread2" reaktor)
(create-osc-thread "thread3" reaktor)
(create-osc-thread "thread4" reaktor)

(end-all-osc-threads)
=> nil
