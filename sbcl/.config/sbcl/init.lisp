;;;; #init.lisp was last modified on September 19, 2022 at 05:25 PM EDT by bms#
;;; Always use quicklisp
#-quicklisp
(let ((quicklisp-init (merge-pathnames ".config/ql/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;;; Use UTF-8
(setf sb-impl::*default-external-format* :utf-8)
;;;; #end
