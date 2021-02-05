;; Haskell config Configuration

;;; Code:
(use-package haskell-mode
  :ensure t
  :after company-mode
  :bind
  ("C-c c" . 'haskell-compile)
  ("C-c h" . 'haskell-check)

  :config
  ;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))
  )

(provide 'setup-haskell)
