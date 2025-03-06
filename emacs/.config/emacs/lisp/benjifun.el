(defun recompile-init ()
  "Byte compile all my configs."
  (interactive)
  (dolist (file (directory-files "~/.config/emacs/lisp" t))
    (when (equal (file-name-extension file) "el")
      (byte-compile-file file)))
  (byte-compile-file user-init-file))

(require 'erc)
(defun libera ()
  "Start erc."
  (interactive)
  (erc-tls :server "irc.libera.chat" :port 6697 :nick "benjisu"))
(global-set-key (kbd "C-x C-l") 'libera)


(provide 'benjifun)
