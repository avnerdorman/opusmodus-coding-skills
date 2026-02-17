Opusmodus                                                        get-osc-thread-from-name     1

get-osc-thread-from-name name
[Function]

Arguments and Values:
name                     a string (an OSC thread object name).


Description:

Open Sound Control (OSC) is a protocol for networking sound synthesisers, computers, and
other multimedia devices for purposes such as musical performance or show control. OSC
was originally intended for sharing music performance data (gestures, parameters and note
sequences) between musical instruments (especially electronic musical instruments such as
synthesisers), computers, and other multimedia devices. OSC is sometimes used as an
alternative to the 1983 MIDI standard, where higher resolution and a richer parameter space
is desired. OSC messages are transported across the internet and within local subnets using
UDP/IP and Ethernet.

The GET-OSC-THREAD-FROM-NAME function returns the OSC thread from a given name.
This function is useful if you don’t assign a variable to the thread object.


Examples:

Note we are not capturing the thread object returned from this function:

(create-osc-thread "thread1" reaktor)

We can get the thread object using its name when we want:

(send-osc-data (get-osc-thread-from-name "thread1")
               '((0.0 1/2) (0.3254655 1/2) (0.08238555 2)
                 (0.10876829 1) (0.12127061 11/2)))

(end-osc-thread (get-osc-thread-from-name "thread1"))

Test:

(osc-thread-alivep (get-osc-thread-from-name "thread1"))
