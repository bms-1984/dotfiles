(setq vc-follow-symlinks nil)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'benjimisc)
