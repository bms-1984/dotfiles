(setq vc-follow-symlinks nil)

(require 'exec-path-from-shell)
(let ((vars '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"
              "XDG_CONFIG_HOME" "XDG_CACHE_HOME" "XDG_DATA_DIR" "XDG_RUNTIME_DIR"
              "GNUPGHOME" "PATH" "LD_LIBRARY_PATH" "PKG_CONFIG_PATH" "INFO_PATH"
              "MAN_PATH" "GUILE_LOAD_PATH" "GUILE_LOAD_COMPILED_PATH"
              "GUILE_SYSTEM_EXTENSIONS_PATH")))
  (dolist (var vars)
    (add-to-list 'exec-path-from-shell-variables var)))

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'benjimisc)
