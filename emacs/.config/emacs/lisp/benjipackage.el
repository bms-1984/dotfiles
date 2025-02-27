(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(exec-path-from-shell
                  flycheck markdown-mode paredit rainbow-delimiters slime magit bison-mode
                  company company-quickhelp dirvish fancy-compilation flycheck-color-mode-line
                  flycheck-pos-tip flycheck-pkg-config forge magit-todos
                  org org-bullets ox-gfm pinentry po-mode)))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(provide 'benjipackage)
