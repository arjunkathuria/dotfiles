(use-package lsp-mode
  ;; :hook
  ;; (nim-mode . lsp)
  ;; (haskell-mode . lsp)

  :config
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-completion-provider :capf)

  (use-package lsp-ui
    ;; :hook
    ;; (lsp-mode)
    :config
    ;;(add-hook 'lsp-mode-hook #'lsp-ui-mode)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    )
  )

(provide 'setup-lsp)
