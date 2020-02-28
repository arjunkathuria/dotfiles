;; Configuration for ace-window

;;; Code:
(use-package whitespace-cleanup-mode
  :ensure t
  :init (add-hook 'prog-mode-hook #'whitespace-cleanup-mode)
)

(provide 'setup-whitespace-cleanup)
