(use-package lsp-mode
  :ensure t
  :config

  (use-package lsp-haskell
    :ensure t
    ;;:hook (haskell-mode)
    :config
    ;;(add-hook 'haskell-mode-hook 'lsp-haskell)
    (setq lsp-haskell-process-path-hie "hie-wrapper")
    )
  (use-package lsp-ui
    :ensure t
    ;; :hook
    ;; (lsp-mode)
    :config
    ;;(add-hook 'lsp-mode-hook #'lsp-ui-mode)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    )
  )

(provide 'setup-lsp)
