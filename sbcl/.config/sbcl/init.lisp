;;; Always use quicklisp
#-quicklisp
(let ((quicklisp-init (merge-pathnames ".config/sbcl/quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;;; Use UTF-8
(setf sb-impl::*default-external-format* :utf-8)
