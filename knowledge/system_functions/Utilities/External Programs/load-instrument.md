Opusmodus                                                                load-instrument   1

load-instrument file-name
[Function]

Arguments and Values:
file-name                a string.


Description:

The LOAD-INSTRUMENT function opens Virtual Instrument applications with a given
instrument le. In order to make this work rst you need to create a new Instruments folder
in the OPUSMODUS folder if it hasn’t been created already. Into this folder you can drop all
your instrument (soundbank) alias les from any of the Virtual Instrument applications that
you wish to open from within the OPUSMODUS scores, which are part of your DEF-
SCORE instrument setup.


Examples:

Vienna Ensamble Pro:
(load-instrument "String Quartet.viframe64")

Kontakt:
(load-instrument "All Percussion.nki")

EastWest Play:
(load-instrument "Classical-orchestra.ewi")

Ableton Live:
(load-instrument "Electro-1.als")

Reaktor:
(load-instrument "ElectroAcoustic1.ens")
     fi
                            fi
                                     fi
