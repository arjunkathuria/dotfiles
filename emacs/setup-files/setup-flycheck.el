(use-package flycheck
  :init
  (global-flycheck-mode)

  :custom
  (flycheck-ghc-args '("-Wall"))
  (flycheck-haskell-ghc-executable "ghc")
  (flycheck-haskell-hlint-executable "hlint"))

(provide 'setup-flycheck)
