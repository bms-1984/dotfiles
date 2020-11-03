(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(use-package helm)
(use-package paredit)
(use-package sly)
(use-package magit)
(use-package geiser)
(use-package flycheck)
(use-package pinentry)
(use-package company)
(pinentry-start)
(setq scheme-program-name "guile")
(setq inferior-lisp-program "sbcl")
(setq desktop-save-mode t)
(setq geiser-active-implementations '(guile))
(setq explicit-shell-file-name "/home/bms/.guix-profile/bin/zsh")
(setq vc-follow-symlinks nil)

(add-hook 'emacs-lisp-mode-hook                  'all-lisp-hooks)
(add-hook 'eval-expression-minibuffer-setup-hook 'all-lisp-hooks)
(add-hook 'ielm-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-interaction-mode-hook            'all-lisp-hooks)
(add-hook 'scheme-mode-hook                      'all-lisp-hooks)
(add-hook 'sly-mode-hook                         'all-lisp-hooks)
(add-hook 'c-mode-hook                           (lambda () 
						   (flycheck-mode t)))
(add-hook 'c-initialization-hook                 (lambda ()
						   (define-key c-mode-base-map "\C-m" 'c-context-line-break)))
(add-hook 'sh-mode-hook                          (lambda ()
						   (if (or (string-match "\\.zsh$" buffer-file-name)
							   (string-match "\\.zsh-theme$" buffer-file-name))
						       (sh-set-shell "zsh"))))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . sh-mode))

(defun all-lisp-hooks ()
  "Called for all lisp or scheme hooks"
  (require 'eldoc)
  (eldoc-mode t)
  (paredit-mode t)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round
   'electrify-return-if-match)
  (show-paren-mode t)
  (flycheck-mode t))


(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))
