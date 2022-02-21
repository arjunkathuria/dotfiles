;; Configuration for ace-window

;;; Code:
(use-package whitespace-cleanup-mode
  :init (add-hook 'prog-mode-hook #'whitespace-cleanup-mode)
)

(provide 'setup-whitespace-cleanup)
