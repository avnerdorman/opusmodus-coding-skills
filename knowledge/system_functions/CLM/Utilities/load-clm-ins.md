Opusmodus                                                                     load—clm-ins   1

load—clm-ins &rest file-name
[Function]

Arguments and Values:
file-name                       le name (.ins and .clm).


Description:

CLM instrument must be compiled before it will run. There are several ways to do this, but
perhaps the simplest way is to use LOAD—CLM-INS function to compile and load CLM
instruments. This function takes one or more arguments, the file-name to be compiled
and loaded, so for example, to compile the le “my-instruments.ins” enter the following:

(load—clm-ins "my-instruments")


Example:

To load a list of instrument le names at once:

(load—clm-ins "my-instruments"
              "other-instruments")

If you wish to load your instruments at startup of the APP, enter the above into the "Load
CLM Instruments.lisp" le which is in your "~/Opusmodus/Extensions" folder.
                 fi
                      fi
                           fi
                                           fi
