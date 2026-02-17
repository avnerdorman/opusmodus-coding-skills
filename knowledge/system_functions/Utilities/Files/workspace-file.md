Opusmodus                                                                              workspace-file   1

workspace-file &optional filename
[Function]

Arguments and Values:
filename                 (optional): A string, the name of the le. If not provided, the function will
                         return the current working directory.


Description:

The WORKSPACE-FILE function discerns the interface of the active workspace and fetches
the corresponding project directory. When supplied with a filename as an argument, this
function amalgamates this filename with the directory to yield a fully quali ed pathname.
If no filename is provided, it simply returns the project directory. This function comes in
handy when there's a need to LOAD a le containing functions that are speci c to the project
within the current workspace.


Examples:
(workspace-file)
=> #P"/Users/opmo/Opusmodus/Workspace/Quick Start/"

(workspace-file "score.opmo")
=> #P"/Users/opmo/Opusmodus/Workspace/Quick Start/score.opmo”

(load (workspace-file "score-fun.opmo"))
                               fi
                                                      fi
                                                                             fi
                                                                                  fi
