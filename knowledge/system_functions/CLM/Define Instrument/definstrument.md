     Opusmodus                                                                     definstrumnet   1

     definstrumnet ins-name &rest args
     [Macro]

     Arguments and Values:
     ins-name                  instrument name.
     args                      list of arguments.


     Description:

     Although you can use CLM simply as a bunch of canned functions, it's a lot more fun to
     make your own. In CLM, these are called instruments. Before you start de ning your own
     instrument you need to open a New le in "CLM Instrument (.ins)" format and save for
     example "my-instruments.ins" in "~/Opusmodus/CLM/instrument" folder.

     Next, open the "my-instruments.ins" le in the Composer panel and start coding. To de ne
     your own instruments, you need to write the function that expresses in CLM's terms the
     sound processing actions you want.

     DEFINSTRUMENT de nes an instrument in CLM. Its syntax is almost the same as DEFUN; it
     has a few bizarre options (for miserable historical reasons), but they should be resolutely
     ignored. There are a bazillion example instruments in CLM. The instruments live in *.ins
       les in the "~/Opusmodus/CLM/instruments" directory.

     In CLM, instruments are de ned by using the macro DEFINSTRUMENT, a template for
     which is as follows.

     The contents of brackets "< > " indicate sections to be de ned by the user.
     Comments are preceded with a semi-colon, ";".

     (definstrument <name> (<arg1 arg2 arg3...>)
       ; a name, followed by a list of args to
       ; be called by the user

       ; initialization variables and values
       (let ((<init-variable1 value1>)
             (<init-variable2 value2>)
             (<init-variable3 value3>))
         ; the RUN loop computes each sample, one at a time
         (run
          (loop for i from <first sample> to <last sample> do
            ; the "body" defines exactly how each sample is to be computed
            <body>))))
fi
                     fi
                          fi
                                   fi
                                        fi
                                                        fi
                                                                        fi
                                                                                       fi
     Opusmodus                                                                     definstrumnet    2

     In the simplest case, you can just calculate your new value, and add it into the current output.


     Example:

     Lets de ne a simple Sine-Wave Instrument:

     (definstrument simp-sine-wave (start-time duration frequency amplitude)
       (let* ((beg (floor (* start-time *srate*)))
              (end (+ beg (floor (* duration *srate*))))
              (sine-wave (make-oscil :frequency frequency)))

          (run ; Run ensures that the DSP (not RAM) will be used
               ; to compile the samples -- it's much faster!
           (loop for i from beg to end do
              (outa i (* amplitude (oscil sine-wave)))))))

     Once your instrument is de ned, save the le. CLM instrument must be compiled before it
     will run. There are several ways to do this, but perhaps the simplest way is to use LOAD-
     CLM-INS function to compile and load CLM instruments. This function takes one argument,
     the le name to be compiled and loaded, so for example, to compile the le "my-
     instruments.ins" enter the following:

     (load—clm-ins "my-instruments")

     Remember that every time you modify your instrument, you will have to rst save the le,
     and then re- compile and load, as described above.

     To call and play the instrument, use the function WITH-SOUND.

     Now you are ready to play your sine wave instrument:

     (with-sound () (simp-sine-wave 0 2 440.0 0.2))

     If you wish to load your instruments at startup of the APP enter the following:

     (load—clm-ins "my-instruments")

     into the "Load CLM Instruments.lisp" le which is in your Opusmodus/Extensions folder or
     in your CLM directory.
fi
     fi
                          fi
                                      fi
                                           fi
                                                                        fi
                                                                             fi
                                                                                       fi
