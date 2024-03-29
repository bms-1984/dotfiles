;;;; init.el -- personal init file
;;; Commentary:
;;;#init.el was last modified on October 02, 2022 at 08:43 PM EDT by bms#
;;; Code:
(defvar                      electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\" return.")
(defvar                      bootstrap-version)

(let                         ((bootstrap-file
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


(setq                        straight-use-package-by-default t)
(straight-use-package       'use-package)

(use-package                 all-the-icons)
(use-package                 bison-mode)
(use-package                 company
  :config                   (global-company-mode))
(use-package                 company-quickhelp
  :after                     company
  :hook                     (company-mode . company-quickhelp-mode))
(use-package                 dap-mode
  :after                     lsp-mode
  :init                     (setq
			     dap-auto-configure-features '(sessions locals controls tooltip))
  :hook                      lsp-mode)
(use-package                 dirvish
  :init                     (progn
			      (setq
			       dirvish-attributes '(vc-state file-size git-msg collapse all-the-icons subtree-state)))
  :config                   (dirvish-override-dired-mode))
(use-package                 eldoc
  :hook                    ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode
					     lisp-mode lisp-interaction-mode
					     scheme-mode sly-mode)
			    . eldoc-mode))
(use-package                 exec-path-from-shell
  :config                   (progn
			      (setq exec-path-from-shell-arguments nil)
			      (dolist (var '("TZ" "HISTORY" "MAIL" "MAILCHECK"
					     "DOTFILES" "SCRIPTS" "PROJECTS"
					     "SRC" "BUILD"
					     "AUR" "REPO"
					     "ORG" "LOCAL"
					     "CONFIG" "CACHE"
					     "DATA" "XDG"
					     "XDG_CONFIG_HOME"
					     "XDG_CACHE_HOME"
					     "XDG_DATA_HOME"
					     "XDG_RUNTIME_DIR"
					     "GIT_SSH_COMMAND"
					     "WGETRC"
					     "GUILE_HISTORY"
					     "HISTFILE"
					     "LESSHISTFILE"
					     "LESS" "RUSTUP_HOME"
					     "NPM_CONFIG_USER_CONFIG"
					     "CARGO_HOME" "GNUPGHOME"
					     "XINITRC" "MAKEFLAGS"
					     "CFLAGS" "LDFLAGS"
					     "DIFFPROG" "PASSWORD_STORE_DIR"
					     "NOTMUCH_CONFIG"
					     "PKG_CONFIG_PATH"
					     "SSH_AUTH_SOCK"
       					     "SSH_AGENT_PID"
					     "GPG_AGENT_INFO"
					     "LANG"
					     "LC_CTYPE"
					     "INFOPATH"
					     "GUILE_LOAD_PATH"
					     "GUILE_LOAD_COMPILED_PATH"
					     "FPATH")
					   (add-to-list 'exec-path-from-shell-variables var))
				(when (daemonp)
				  (exec-path-from-shell-initialize)))))
(use-package                 fancy-compilation
  :config                   (fancy-compilation-mode))
(use-package                 flycheck
  :config                   (global-flycheck-mode))
(use-package                 flycheck-color-mode-line
  :after                     flycheck
  :hook                     (flycheck-mode . flycheck-color-mode-line-mode))
(use-package                 flycheck-guile
  :after                     flycheck)
(use-package                 flycheck-pkg-config
  :after                     flycheck)
(use-package                 flycheck-pos-tip
  :after                     flycheck
  :hook                     (flycheck-mode . flycheck-pos-tip-mode))
(use-package                 forge
  :after                     magit)
(use-package                 geiser-guile
  :init                     (progn
			      (setq
			       geiser-guile-binary "/usr/bin/guile")
			      (setq
			       geiser-active-implementations '(guile))))
(use-package                 helm
  :init                     (progn
			      (global-set-key (kbd "M-x") 'helm-M-x)
			      (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
			      (global-set-key (kbd "C-x C-f") 'helm-find-files))
  :config                   (helm-mode))
(use-package                 helm-company
  :after                     helm
  :after                     company)
(use-package                 helm-make
  :after                     helm
  :init                     (global-set-key (kbd "C-c c c") 'helm-make))
(use-package                 helm-sly
  :after                     sly
  :after                     helm-company
  :config                   (global-helm-sly-mode)
  :config                   (define-key sly-mode-map (kbd "<tab>") 'helm-company))
(use-package                 lsp-mode
  :init                     (setq
			     lsp-keymap-prefix "C-c l"))
(use-package                 lsp-treemacs
  :after                     lsp-mode
  :commands                  lsp-treemacs-errors-list)
(use-package                 lsp-ui
  :after                     lsp-mode
  :hook                      lsp-mode)
(use-package                 macrostep)
(use-package                 macrostep-geiser
  :after                     geiser-guile
  :after                     macrostep
  :hook                     ((geiser-mode geiser-repl-mode) . macrostep-geiser-setup))
(use-package                 magit)
(use-package                 magit-todos
  :after                     magit
  :config                   (magit-todos-mode))
(use-package                 nasm-mode
  :mode                   "\\.asm\\'")
(use-package                 notmuch
  :straight                  nil)
(use-package                 org
  :init                     (progn
			      (setq
			       org-agenda-files `(,(file-name-concat (getenv "DOTFILES") "README.org")))
			      (setq
			       org-log-done t)
			      (setq
			       org-startup-indented t)
			      (setq
			       org-startup-numerated t)
			      (setq
			       org-directory (getenv "ORG")))
  :config                   (progn
			      (global-set-key
			       (kbd "C-c l") 'org-store-link)
			      (global-set-key
			       (kbd "C-c a") 'org-agenda)))
(use-package                 org-bullets
  :after                     org
  :hook                      (org-mode . org-bullets-mode))
(use-package                 ox-gfm
  :after                     org)
(use-package                 paredit
  :hook                    ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode
					     lisp-mode lisp-interaction-mode
					     scheme-mode sly-mode)
			    . paredit-mode))
(use-package                 pinentry
  :init                     (setq
			     epg-pinentry-mode 'loopback)
  :config                   (pinentry-start))
(use-package                 pkgbuild-mode
  :mode                      "/PKGBUILD$")
(use-package                 rainbow-delimiters
  :hook                    ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode
					     lisp-mode lisp-interaction-mode
					     scheme-mode sly-mode)
			    . rainbow-delimiters-mode))
(use-package                 sly)
(use-package                 sly-macrostep
  :after                     sly
  :after                     macrostep)
(use-package                 sly-quicklisp
  :after                     sly)
(use-package                 solarized-theme
  :config                   (load-theme
			     'solarized-dark t))
(use-package                 systemd)
(use-package                 which-key
  :config                   (which-key-mode))

(set-face-attribute          'default                                 nil :height 227)

(defalias                    'exit                                   'kill-emacs)

(setq                        time-stamp-pattern
			    "8/#%f was last modified on %:B %02d, %Y at %02I:%02M %P %Z by %l#")
(setq                        time-stamp-time-zone                    "EST+5EDT,M3.2.0/2,M11.1.0/2")
(setq                        auto-save-file-name-transforms       `((".*" ,temporary-file-directory t)))
(setq                        backup-directory-alist               `((".*" . ,temporary-file-directory)))
(setq                        desktop-save-mode                        t)
(setq                        auth-sources                          `(,(file-name-concat user-emacs-directory "authinfo.gpg")))
;;(setq                        auth-source-pass-filename               (getenv "PASSWORD_STORE_DIR"))

(setq                        native-comp-async-report-warnings-errors nil)
(setq                        initial-scratch-message                  nil)
(setq                        inhibit-startup-buffer-menu              t)
(setq                        inhibit-startup-screen                   t)

(setq                        vc-follow-symlinks                       nil)

(setq                        inferior-lisp-program                   "sbcl")
(setq                        scheme-program-name                     "guile")

(setq                        spot4e-refresh-token                    "AQAWR6aMpP1LVcBVsT-tXQet0g343qaw2Kgk2mxeRUo25XAWZYVGRmnjSBCL5nFuZMVHndPLFlDhyyzdkoAex8xyHswvSJ88tdF5MQHs62DC8i9HqJIR_FwIyq2ZINBEfqw")

(fset                        'yes-or-no-p                            'y-or-n-p)

(add-to-list                 'auto-mode-alist                     `(,(file-name-concat
								      (getenv "CONFIG")
						       		      "zsh/functions/[^./][^/]+\\'")
								    . sh-mode))
(add-to-list                 'auto-mode-alist                     `(,(file-name-concat
								      (getenv "DOTFILES")
							              "zsh/.config/zsh/functions/[^./][^/]+\\'")
								    . sh-mode))
(add-to-list                 'auto-mode-alist                    '("\\.guile\\'" . scheme-mode))
(add-to-list                 'default-frame-alist                   '(fullscreen . fullboth))
(add-to-list                 'default-frame-alist                   '(font . "MesloLGS NF"))
(add-to-list                 'load-path                              (file-name-concat user-emacs-directory "spot4e"))
(load                        "spot4e")

(global-set-key (kbd "C-x C-g") 'eww)

(run-with-timer 0 (* 60 59) 'spot4e-refresh)

(global-prettify-symbols-mode)
(delete-selection-mode)

(add-hook                    'sh-mode-hook                           (lambda ()
								       (when (string-search
									      "functions"
									      (file-name-directory (buffer-file-name)))
									 (sh-set-shell "/bin/zsh"))))
(add-hook                    'emacs-lisp-mode-hook                   'all-lisp-hooks)
(add-hook                    'eval-expression-minibuffer-setup-hook  'all-lisp-hooks)
(add-hook                    'ielm-mode-hook                         'all-lisp-hooks)
(add-hook                    'lisp-mode-hook                         'all-lisp-hooks)
(add-hook                    'lisp-interaction-mode-hook             'all-lisp-hooks)
(add-hook                    'scheme-mode-hook                       'all-lisp-hooks)
(add-hook                    'sly-mode-hook                          'all-lisp-hooks)

(add-hook                    'c-initialization-hook                  (lambda ()
								       (define-key c-mode-base-map "\C-m" 'c-context-line-break)))
(add-hook                    'c-mode-common-hook                     'c-toggle-hungry-state)
(add-hook                    'prog-mode-hook                         (lambda ()
								       (hs-minor-mode)
								       (semantic-mode)))
(add-hook                    'minibuffer-exit-hook                   (lambda ()
								       (let ((buffer "*Completions*"))
									 (and (get-buffer buffer)
									      (kill-buffer buffer)))
								       (let ((buffer "*Async-native-compile-log*"))
									 (and (get-buffer buffer)
									      (kill-buffer buffer)))))
(add-hook                    'before-save-hook                       (lambda ()
								       (time-stamp)
								       (when (string=
									      (file-name-nondirectory (buffer-file-name))
									      "README.org")
									 (org-gfm-export-to-markdown))))

(defun                       electrify-return-if-match (arg)
  "Electric return ARG."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun                       all-lisp-hooks ()
  "Called for all Lisp hooks."
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command 'electrify-return-if-match)
  (show-paren-mode t))

(defun                       shell ()
  "Run \"ansi-term\" with zsh."
  (interactive)
  (ansi-term "/bin/zsh"))
(provide                    'init)
;;; init.el ends here
