(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(column-number-mode)

(load-theme 'wombat)
(set-face-background 'default "#111")
(set-face-background 'cursor "#c96")
(set-face-background 'isearch "#ff0")
(set-face-foreground 'isearch "#000")
(set-face-background 'lazy-highlight "#990")
(set-face-foreground 'lazy-highlight "#000")
(set-face-foreground 'font-lock-comment-face "#fc0")

(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)

(global-prettify-symbols-mode)
(semantic-mode t)
(show-paren-mode t)

(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

(setq dired-use-ls-dired nil)
(setq-default require-final-newline t)
(setq sentence-end-double-space nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq show-paren-delay 0)

(make-directory "~/.tmp/emacs/auto-save/" t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(exec-path-from-shell flycheck markdown-mode paredit rainbow-delimiters slime magit bison-mode
                                        company company-quickhelp dirvish fancy-compilation
                                        flycheck-color-mode-line flycheck-pos-tip flycheck-pkg-config
                                        forge magit-todos org  org-bullets ox-gfm pinentry po-mode))
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")

(setq dirvish-attributes '(vc-state file-size git-msg collapse subtree-state))
(dirvish-override-dired-mode)

(fancy-compilation-mode)
(global-company-mode)
(global-flycheck-mode)
(add-hook 'flycheck-mode (lambda ()
                           (flycheck-color-mode-line-mode)
                           (flycheck-pos-tip-mode)))
(company-quickhelp-mode)
(magit-todos-mode)
(delete-selection-mode)

(setq epg-pinentry-mode 'loopback)
(pinentry-start)

(setq native-comp-async-report-warnings-errors nil)
(setq vc-follow-symlinks nil)

(setq org-log-done t)
(setq org-startup-indented t)
(setq org-startup-numerated t)

(require 'exec-path-from-shell)
(dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"
               "XDG_CONFIG_HOME" "XDG_CACHE_HOME" "XDG_DATA_DIR" "XDG_RUNTIME_DIR"))
  (add-to-list 'exec-path-from-shell-variables var))

(require 'paredit)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
              (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

(require 'server)
(unless (server-running-p)
  (server-start))

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

(require 'eldoc)

(defun prog-hooks ()
  "Initialize code modes."
  (display-line-numbers-mode t)
  (hs-minor-mode))

(defun c-hooks ()
  "Initialize C modes."
  (turn-on-eldoc-mode)
  (prog-hooks))

(defun lisp-hooks ()
  "Initialize Lisp modes."
  (enable-paredit-mode)
  (rainbow-delimiters-mode)
  (turn-on-eldoc-mode)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command
   'electrify-return-if-match
   'paredit-backward-delete
   'paredit-close-round))

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'emacs-lisp-mode-hook 'lisp-hooks)
(add-hook 'eval-expression-minibuffer-setup-hook 'lisp-hooks)
(add-hook 'ielm-mode-hook 'lisp-hooks)
(add-hook 'lisp-interaction-mode-hook 'lisp-hooks)
(add-hook 'lisp-mode-hook 'lisp-hooks)
(add-hook 'slime-repl-mode-hook 'lisp-hooks)
(add-hook 'c-mode-common-hook 'c-hooks)
(add-hook 'prog-mode 'prog-hooks)
(add-hook 'minibuffer-exit-hook (lambda ()
								  (let ((buffer "*Completions*"))
									(and (get-buffer buffer)
									     (kill-buffer buffer)))
								  (let ((buffer "*Async-native-compile-log*"))
									(and (get-buffer buffer)
									     (kill-buffer buffer)))))
(provide 'init)
;;; init.el ends here
