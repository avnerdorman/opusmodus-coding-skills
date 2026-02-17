Opusmodus                                                                    get-velocity   1

get-velocity list &key type
[Function]

Arguments and Values:
list                     velocity symbols, oat numbers
type                     :float or :symbol. The default is :float.


Description:

This function is able to make conversions between the different formats used to indicate
velocity values.

(get-velocity '(p f p< p< p< ff))
=> (0.37 0.63 0.37 0.49 0.6 0.72)

There are three different possible notations for dynamics. One is the use of oating point
values. Second is the OMN notation. The third is MIDI values from 0-127. Whilst the latter
works quite ef ciently it does not have the ne resolution of the rst.


Examples:
(get-velocity '(mp pppp ffff mp))
=> (0.46 0.11 0.89 0.46)

(get-velocity '(0.44 0.07 0.84 0.45) :type :symbol)
=> (mp pppp ffff mp)

(setf trio-vel (gen-dim 20 'fff 'p))
=> (fff fff ff ff ff ff f f f f mf mf mf mf mp mp mp mp p p)

(get-velocity trio-vel)
=> (0.8 0.8 0.72 0.72 0.72 0.72 0.63 0.63 0.63 0.63
    0.54 0.54 0.54 0.54 0.46 0.46 0.46 0.46 0.37 0.37)
        fi
                                  fl
                                       fi
                                                          fi
                                                                     fl
