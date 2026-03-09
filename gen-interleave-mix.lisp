(defun gen-interleave-mix (list-a list-b)
  "Interleaves two lists A and B. 
   If one list is shorter, it cycles to match the length of the longer list.
   
   Example:
   (gen-interleave-mix '(c4 d4 e4 f4) '(p mf))
   => (c4 p d4 mf e4 p f4 mf)"
  (let* ((len-a (length list-a))
         (len-b (length list-b))
         (n (max len-a len-b)))
    (loop 
       for i from 0 below n
       ;; We use 'head' pointers that reset to the start of the list when exhausted
       for head-a = list-a then (if (rest head-a) (rest head-a) list-a)
       for head-b = list-b then (if (rest head-b) (rest head-b) list-b)
       collect (first head-a)
       collect (first head-b))))
