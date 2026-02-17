Opusmodus                                                                   gen-time-controller   1

gen-time-controller sequence
[Function]

Arguments and Values:
sequence                 A list or nested lists representing lengths or an omn-form sequence.


Description:

This function operates in conjunction with the GEN-CONTROLLER function, GEN-TIME-
CONTROLLER extracts timing control values from a speci ed sequence, pivotal for MIDI
controller automation. This function calculates the timing for each event within the sequence,
enabling precise automation of MIDI control changes.


Examples:
(setf omn '((h. eb4 pp tasto q g3 0<p>0 ponte)
            (-e q gs4 fp tasto -s q a5 ffp -e e. bb4 fffp tie)
            (s bb4 0<p>0 - q cs5 pf -s q. e5 fp -e.)
            (q cs5 p h. d5 pfp) (-q h. c5 pp)
            (h. gs3 0<pp>0 ponte -e a4 p< tasto)
            (h. fs5 mp q bb3 0<p>0 ponte)
            (q c5 p tasto h. e4 pfp)
            (-e q cs4 fp h d5 p>ppp e f4 p>ppp tie)
            (he f4 p>ppp -q.)))

In this example, GEN-TIME-CONTROLLER is used to obtain timing control values from an
omn sequence:

(setf cc-time (gen-time-controller omn))
=> (3/4 1/4 3/8 5/16 5/16 1/16 5/16 7/16 7/16 3/4
    1 3/4 1/4 3/4 1/4 1/4 3/4 3/8 1/2 1/8 5/8 3/8)

Generating MIDI control parameters:

(setf cc-par (rnd-sample (length cc-time) '(20 32 45 58 77 84)))
=> (58 32 77 84 77 32 45 84 58 58 84 58 84 32 77 32 45 45 32 20 84 45)

Assembling a MIDI controller changes for an instrument:

(gen-controller (get-span omn :sum t) cc-par :time cc-time)
=> ((58 3/4) (32 1/4) (77 3/8) (84 5/16) (77 5/16) (32 1/16)
    (45 5/16) (84 7/16) (58 7/16) (58 3/4) (84 1) (58 3/4)
    (84 1/4) (32 3/4) (77 1/4) (32 1/4) (45 3/4) (45 3/8)
    (32 1/2) (20 1/8) (84 5/8) (45 3/8))
                                                       fi
