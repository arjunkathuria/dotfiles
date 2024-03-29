;; Haskell config Configuration

;;; Code:
(use-package haskell-mode
  :bind
  ("C-c c" . 'haskell-compile)
  ("C-c h" . 'hoogle)
  ("C-c C-c" . 'haskell-check)

  :config
  (add-hook 'haskell-mode-hook 'subword-mode)
  (add-hook 'haskell-cabal-mode 'subword-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

  ;; Auto Mode
   ;;(add-auto-mode 'haskell-mode "\\.ghci\\'")
  (add-to-list 'auto-mode-alist '("\\.ghci\\'" . haskell-mode))

  ;; Indentation
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

  :custom
  ;; set interactive haskell mode variable settings
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules nil)
  (haskell-process-log t)
  (haskell-process-prompt-restart-on-cabal-change t)
  (haskell-process-load-or-reload-prompt t)
  (haskell-process-type 'auto)
  (haskell-indent-offset 2)

  (haskell-process-args-cabal-repl '("--ghc-option=-ferror-spans" "--ghc-option=-Wall"))
  (haskell-process-args-ghci '("-ferror-spans" "-Wall"))
  (haskell-process-suggest-add-package nil)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-tags-on-save nil)
  (haskell-completing-read-function 'completing-read)
  (haskell-process-auto-import-loaded-modules nil)
  (haskell-process-suggest-haskell-docs-imports nil)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-process-suggest-remove-import-lines nil)
  (haskell-process-use-presentation-mode t)
  )

(use-package ormolu
  ;; :hook (haskell-mode . ormolu-format-on-save-mode)
  :bind
  (:map haskell-mode-map
        ("C-c r" . ormolu-format-buffer)))

(provide 'setup-haskell)

;;; setup-haskell.el ends here
