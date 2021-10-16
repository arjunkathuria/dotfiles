;; Haskell config Configuration

;;; Code:
(use-package haskell-mode
  :ensure t
  :bind
  ("C-c c" . 'haskell-compile)
  ("C-c h" . 'haskell-check)

  ;;:hook
  ;;interactive-haskell-mode

  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))

  :custom
  ;; set interactive haskell mode variable settings
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  (haskell-process-prompt-restart-on-cabal-change t)
  (haskell-process-load-or-reload-prompt t)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-process-type 'cabal-new-repl)
  (haskell-process-use-presentation-mode nil)
  (haskell-indent-offset 2)

  (haskell-process-args-cabal-repl '("--ghc-option=-ferror-spans" "--ghc-option=-Wall"))
  (haskell-process-args-ghci '("-ferror-spans" "-Wall"))
  (haskell-process-suggest-add-package nil)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-tags-on-save t)
  (haskell-completing-read-function 'completing-read)
  (haskell-process-auto-import-loaded-modules nil)
  (haskell-process-suggest-haskell-docs-imports t)
  (haskell-process-suggest-hoogle-imports nil)
  (haskell-process-suggest-remove-import-lines nil)
  (haskell-process-use-presentation-mode t)
 )

(provide 'setup-haskell)
