(use-package flymake
  :init
  (add-hook 'prog-mode-hook 'flymake-mode)
  (add-hook 'text-mode-hook 'flymake-mode))

(use-package flymake-haskell-multi
  :init
  (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load))

(provide 'setup-flymake)
