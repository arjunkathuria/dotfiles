(use-package flycheck
  :init
  ;;(global-flycheck-mode)
  (add-hook 'after-init-hook 'global-flycheck-mode)

  :custom
  (flycheck-ghc-args '("-Wall"))
  (flycheck-haskell-ghc-executable "ghc")
  (flycheck-haskell-hlint-executable "hlint"))

(use-package flyspell
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (setq ispell-list-command "--list"))

(provide 'setup-flycheck)
