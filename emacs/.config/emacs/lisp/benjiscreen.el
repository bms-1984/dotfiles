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

(setq-default show-trailing-whitespace nil)
(setq-default indicate-empty-lines nil)
(setq-default indicate-buffer-boundaries 'left)
(setq-default require-final-newline t)
(setq sentence-end-double-space nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

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


(provide 'benjiscreen)
