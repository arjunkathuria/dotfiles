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

(use-package ispell
  :init
  (setq-default
   ispell-program-name "hunspell"
   ispell-dictionary "en_US"))

(use-package flycheck-color-mode-line
  :after (flycheck)
  :hook
  ((flycheck-mode . flycheck-color-mode-line-mode)))

(provide 'setup-flycheck)
