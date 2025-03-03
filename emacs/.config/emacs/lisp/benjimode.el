(global-prettify-symbols-mode)

(semantic-mode t)

(show-paren-mode t)
(setq show-paren-delay 0)

(require 'dired)
(require 'dirvish)
(setq dired-use-ls-dired nil)
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

(require 'epg)
(setq epg-pinentry-mode 'loopback)
(pinentry-start)

(require 'paredit)
(require 'eldoc)

(require 'slime)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
              (read-kbd-macro paredit-backward-delete-key) nil))

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

;(define-key paredit-mode-map (kbd "RET") nil)

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'emacs-lisp-mode-hook 'lisp-hooks)
(add-hook 'eval-expression-minibuffer-setup-hook 'lisp-hooks)
;(add-hook 'ielm-mode-hook 'lisp-hooks)
(add-hook 'lisp-interaction-mode-hook 'lisp-hooks)
(add-hook 'lisp-mode-hook 'lisp-hooks)
(add-hook 'slime-repl-mode-hook 'lisp-hooks)
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)
(add-hook 'scheme-mode 'lisp-hooks)
;(add-hook 'geiser-repl-startup-hook 'lisp-hooks)
(add-hook 'c-mode-common-hook 'c-hooks)
(add-hook 'prog-mode 'prog-hooks)

(provide 'benjimode)
