(dolist (file (directory-files "~/.config/emacs/lisp" t))
  (when (equal (file-name-extension file) "el")
    (byte-compile-file file)))

(byte-compile-file "~/.config/sbcl/quicklisp/clhs-use-local.el")
(byte-compile-file user-init-file)
