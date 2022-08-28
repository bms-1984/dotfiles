'(defvar bootstrap-version)
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
(use-package nasm-mode)
(use-package geiser-guile)
(use-package helm)
(use-package rainbow-delimiters)
(use-package paxedit)
(use-package magit)
(use-package flycheck)
(use-package flycheck-pkg-config)
(use-package macrostep)
(use-package sly-macrostep)
(use-package company)
(use-package company-quickhelp)
(use-package realgud)
(use-package flycheck-color-mode-line)
(use-package flycheck-guile)
(use-package all-the-icons)
(use-package sly-quicklisp)
(use-package solarized-theme)
(use-package pinentry)
(use-package bison-mode)
(use-package flycheck-pos-tip)
(use-package macrostep-geiser)
(use-package macrostep-geiser)

(setq native-comp-async-report-warnings-errors nil)

(eval-after-load "flycheck"
  #'(add-hook 'flycheck-mode-hook (lambda ()
				   (flycheck-color-mode-line-mode)
				   (flycheck-pos-tip-mode))))
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(defalias 'list-buffers 'ibuffer)
(defalias 'exit 'kill-emacs)

(setq epg-pinentry-mode 'loopback)
(pinentry-start)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-company-mode)
(company-quickhelp-mode)
(global-prettify-symbols-mode)

(setq desktop-save-mode t)
(setq explicit-shell-file-name "/bin/zsh")
(setq vc-follow-symlinks nil)
(setq Info-directory-list (cons "~/.local/share/info" Info-directory-list))
(setq inferior-lisp-program "~/.local/bin/sbcl")
(setq geiser-guile-binary "~/.local/bin/guile")
(setq scheme-program-name "guile")
(setq geiser-active-implementations '(guile))

(add-hook 'geiser-repl-mode-hook (lambda ()
				   (macrostep-geiser-setup)))
(add-hook 'geiser-mode-hook (lambda ()
			      (macrostep-geiser-setup)))
(add-hook 'emacs-lisp-mode-hook                  'all-lisp-hooks)
(add-hook 'eval-expression-minibuffer-setup-hook 'all-lisp-hooks)
(add-hook 'ielm-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-interaction-mode-hook            'all-lisp-hooks)
(add-hook 'scheme-mode-hook                      'all-lisp-hooks)
(add-hook 'sly-mode-hook                         'all-lisp-hooks)
(add-hook 'c-initialization-hook                 (lambda ()
						   (define-key c-mode-base-map "\C-m" 'c-context-line-break)))
(add-hook 'c-mode-common-hook                           (lambda ()
						   (hs-minor-mode)
						   (semantic-mode)
						   (c-toggle-hungry-state)
						   (flycheck-mode)))
(add-hook 'sh-mode-hook                          (lambda ()
						   (hs-minor-mode)
						   (semantic-mode)
						   (flycheck-mode)))
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.guile\\'" . scheme-mode))

(defun all-lisp-hooks ()
  "Called for all geiser hooks."
  (rainbow-delimiters-mode)
  (require 'eldoc)
  (eldoc-mode t)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command 'electrify-return-if-match)
  (show-paren-mode t)
  (paredit-mode t)
  (paxedit-mode t)
  (flycheck-mode)
  (semantic-mode)
  (hs-minor-mode))

(eval-after-load "paxedit"
  '(progn (define-key paxedit-mode-map (kbd "M-<right>") 'paxedit-transpose-forward)
          (define-key paxedit-mode-map (kbd "M-<left>") 'paxedit-transpose-backward)
          (define-key paxedit-mode-map (kbd "M-<up>") 'paxedit-backward-up)
          (define-key paxedit-mode-map (kbd "M-<down>") 'paxedit-backward-end)
          (define-key paxedit-mode-map (kbd "M-b") 'paxedit-previous-symbol)
          (define-key paxedit-mode-map (kbd "M-f") 'paxedit-next-symbol)
          (define-key paxedit-mode-map (kbd "C-%") 'paxedit-copy)
          (define-key paxedit-mode-map (kbd "C-&") 'paxedit-kill)
          (define-key paxedit-mode-map (kbd "C-*") 'paxedit-delete)
          (define-key paxedit-mode-map (kbd "C-^") 'paxedit-sexp-raise)
          ;; Symbol backward/forward kill
          (define-key paxedit-mode-map (kbd "C-w") 'paxedit-backward-kill)
          (define-key paxedit-mode-map (kbd "M-w") 'paxedit-forward-kill)
          ;; Symbol manipulation
          (define-key paxedit-mode-map (kbd "M-u") 'paxedit-symbol-change-case)
          (define-key paxedit-mode-map (kbd "C-@") 'paxedit-symbol-copy)
          (define-key paxedit-mode-map (kbd "C-#") 'paxedit-symbol-kill)))

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

(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(kill-buffer "*straight-process*")

(add-hook 'minibuffer-exit-hook
      #'(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
		(kill-buffer buffer)))
	 (let ((buffer "*Async-native-compile-log*"))
	   (and (get-buffer buffer)
		(kill-buffer buffer)))))

(setq inhibit-startup-buffer-menu t)
(add-hook 'window-setup-hook 'delete-other-windows)
(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(when (fboundp 'next-buffer)
  (global-set-key (kbd "C-c ,") 'previous-buffer)
  (global-set-key (kbd "C-c .") 'next-buffer))
(load-theme 'solarized-dark t)
(setq org-agenda-files '("~/.dotfiles/TODO.org"))
(provide 'init)
;;; init.el ends here


