(let ((paths '("~/.config/emacs/lisp")))
  (dolist (path paths)
    (add-to-list 'load-path path)))

(require 'benjipackage)
(require 'benjifile)
(require 'benjiscreen)
(require 'benjimode)
(require 'benjiorg)
(require 'benjimisc)
(require 'benjifun)
(require 'custom)

(provide 'init)
;;; init.el ends here
