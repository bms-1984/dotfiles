(make-directory "~/.tmp/emacs/auto-save/" t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(provide 'benjifile)
