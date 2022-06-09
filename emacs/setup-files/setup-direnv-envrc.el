;; Configuration for direnv
;; (using direnv and nix-direnv binaries, that should be installed on your system)

;;; Code:
(use-package envrc
  :init
  (envrc-global-mode)
)

(provide 'setup-direnv-envrc)
