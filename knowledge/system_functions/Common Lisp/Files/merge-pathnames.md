Opusmodus                                                                         merge-pathnames         1

merge-pathnames pathname &optional default-pathname default-version
[Function]

Arguments and Values:
pathname                The speci c pathname to be merged.
default-pathname        The pathname to be used for default values. If it is not provided, the value of
                        (default-pathname) is used.
default-version         This argument controls the version component of the resulting pathname,
                        it can be any of the symbols :newest, :wild, or NIL.


Description:

In Common Lisp, MERGE-PATHNAMS is a function that combines two pathname objects
into a single pathname object, supplying components from the second (default) pathname
for any components that are missing from the rst (speci c) pathname. It is useful when
you want to provide a default directory, extension, or other components for a series of
pathnames. The result is a new pathname that represents the merged path.


Examples:
(setf p1 "/Users/opmo/Opusmodus/Workspace/Quick Start/")
(setf p2 "fun.lisp")

(merge-pathnames p1 p2)
=> #P"/Users/opmo/Opusmodus/Workspace/Quick Start/fun.lisp"

(setf path1 (parse-namestring "/home/user/test"))
(setf path2 (parse-namestring "/home/user/test2.lisp"))

(merge-pathnames path1 path2)
=> #P"/home/user/test.lisp"

In this example, the lename from path2 (i.e., "test2.lisp") lls in the missing lename
component of path1. The result is a new pathname that combines the directory path from
path1 with the lename from path2.
         fi
              fi
                          fi
                                        fi
                                                     fi
                                                                fi
                                                                                       fi
