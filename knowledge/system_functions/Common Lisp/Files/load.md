Opusmodus                                                                                               load   1

load pathname &optional verbose print if-does-not-exist external-format
[Function]

Arguments and Values:
pathname                 It can be a string, a symbol, a pathname, or NIL. If it's NIL, the function
                         operates on the current input stream. If it's a string or symbol, it represents the
                         name of the le to be loaded. If it's a pathname, the function operates on the
                         corresponding le.
verbose                  If this is non-nil, information about the loading progress is printed to the
                         stream standard-output. The default is NIL, meaning no progress information
                         is printed.
print                    If this is non-nil, the results of evaluating the forms are printed to the stream
                         standard-output. The default is NIL, meaning no result information is printed.
if-does-not-exist        If this is non-nil and the speci ed le does not exist, an error of type le-error
                         is signaled. If this is NIL, load just returns NIL in this case. The default is T.
external-format          This argument allows for control over the character decoding of the le.
                         The default is determined by the Lisp implementation and is usually suf cient
                         for most les.


Description:

The LOAD function in Common Lisp reads the contents of a le, interprets it as a series of
Lisp forms, and evaluates them one after the other.


Examples:
(load "my-file.lisp")

This command will load and execute the Lisp forms contained in the le my- le.lisp.

(load "my-fun.opmo")
                          fi
                               fi
                                    fi
                                                fi
                                                     fi
                                                            fi
                                                                       fi
                                                                                fi
                                                                                         fi
                                                                                              fi
                                                                                                   fi
