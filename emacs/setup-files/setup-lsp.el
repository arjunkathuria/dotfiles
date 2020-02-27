(use-package lsp-mode
  :ensure t
  :hook
  (company-mode)

  :config

  (use-package lsp-haskell
    :defer t
    :hook (haskell-mode)
    ;; :config
    ;; (add-hook 'haskell-mode-hook #lsp);
    )
  (use-package lsp-ui
    :ensure t
    :config
    ;;(add-hook 'lsp-mode-hook #'lsp-ui-mode)
    )
  )

(provide 'setup-lsp)
