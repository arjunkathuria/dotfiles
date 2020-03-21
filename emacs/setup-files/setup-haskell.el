;; Haskell config Configuration

;;; Code:
(use-package haskell-mode
  :ensure t

  :bind
  ("C-c c" . 'haskell-compile)
  ("C-c h" . 'haskell-check)

  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook #'lsp)
  )

(provide 'setup-haskell)
