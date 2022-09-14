;;; init --- Summary:
;;;; personal init file
;;; Commentary:
;;;; needs a little reorg

;;; Code:

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

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\" return.")
(defvar straight-use-package-by-default)
(setq straight-use-package-by-default t)

(use-package systemd)
(use-package nasm-mode
  :mode "\\.asm\\'")
(use-package geiser-guile
  :init (progn (setq geiser-guile-binary "/usr/bin/guile")
	       (setq geiser-active-implementations '(guile))))
(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode lisp-mode lisp-interaction-mode scheme-mode sly-mode) . rainbow-delimiters-mode))
(use-package paredit
  :commands paredit-mode
  :hook ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode lisp-mode lisp-interaction-mode scheme-mode sly-mode) . paredit-mode))
(use-package magit)
(use-package eldoc
  :hook ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode lisp-mode lisp-interaction-mode scheme-mode sly-mode) . eldoc-mode))
(use-package flycheck
  :config (global-flycheck-mode))
(use-package flycheck-pkg-config
  :after flycheck)
(use-package macrostep)
(use-package sly)
(use-package sly-macrostep
  :after sly
  :after macrostep)
(use-package company
  :config (global-company-mode))
(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode))
(use-package flycheck-color-mode-line
  :after flycheck
  :config (flycheck-color-mode-line-mode))
(use-package flycheck-guile
  :after flycheck)
(use-package all-the-icons)
(use-package sly-quicklisp
  :after sly)
(use-package solarized-theme
  :config (load-theme 'solarized-dark t))
(use-package pinentry
  :init (setq epg-pinentry-mode 'loopback)
  :config (pinentry-start))
(use-package bison-mode)
(use-package flycheck-pos-tip
  :after flycheck
  :config (flycheck-pos-tip-mode))
(use-package macrostep-geiser
  :after geiser-guile
  :after macrostep
  :hook ((geiser-mode geiser-repl-mode) . macrostep-geiser-setup))
(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
	    (exec-path-from-shell-initialize)))
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l"))
(use-package lsp-ui
  :after lsp-mode
  :hook lsp-mode)
(use-package lsp-treemacs
  :after lsp-mode
  :commands lsp-treemacs-errors-list)
(use-package dap-mode
  :after lsp-mode
  :init (setq dap-auto-configure-features '(sessions locals controls tooltip))
  :hook lsp-mode)
(use-package which-key
  :config (which-key-mode))

(set-face-attribute 'default nil :height 227)

(defalias 'list-buffers 'ibuffer)
(defalias 'exit 'kill-emacs)

(setq native-comp-async-report-warnings-errors nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq desktop-save-mode t)
(setq explicit-shell-file-name "/bin/zsh")
(setq vc-follow-symlinks nil)
(setq Info-directory-list (cons "~/.local/share/info" Info-directory-list))
(setq inferior-lisp-program "~/.local/bin/sbcl")
(setq scheme-program-name "guile")
(setq inhibit-startup-buffer-menu t)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq org-agenda-files '("~/.dotfiles/README.ORG"))

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(add-to-list 'default-frame-alist '(font . "MesloLGS NF"))
(add-to-list 'auto-mode-alist '("\\.guile\\'" . scheme-mode))

(when (fboundp 'next-buffer)
  (global-set-key (kbd "C-c ,") 'previous-buffer)
  (global-set-key (kbd "C-c .") 'next-buffer))

(global-prettify-symbols-mode)

(add-hook 'emacs-lisp-mode-hook                  'all-lisp-hooks)
(add-hook 'eval-expression-minibuffer-setup-hook 'all-lisp-hooks)
(add-hook 'ielm-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-mode-hook                        'all-lisp-hooks)
(add-hook 'lisp-interaction-mode-hook            'all-lisp-hooks)
(add-hook 'scheme-mode-hook                      'all-lisp-hooks)
(add-hook 'sly-mode-hook                         'all-lisp-hooks)
(add-hook 'c-initialization-hook                 (lambda ()
						   (define-key c-mode-base-map "\C-m" 'c-context-line-break)))
(add-hook 'c-mode-common-hook                    'c-toggle-hungry-state)
(add-hook 'prog-mode-hook                        (lambda ()
						   (hs-minor-mode)
						   (semantic-mode)))
(add-hook 'minibuffer-exit-hook                  (lambda ()
						   (let ((buffer "*Completions*"))
						     (and (get-buffer buffer)
							  (kill-buffer buffer)))
						   (let ((buffer "*Async-native-compile-log*"))
						     (and (get-buffer buffer)
							  (kill-buffer buffer)))))

(defun electrify-return-if-match (arg)
  "Electric return ARG."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun all-lisp-hooks ()
  "Called for all Lisp hooks."
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command 'electrify-return-if-match)
  (show-paren-mode t))

(defun shell ()
  "Run \"ansi-term\" with zsh."
  (interactive)
  (ansi-term "/bin/zsh"))

(provide 'init)
;;; init.el ends here
