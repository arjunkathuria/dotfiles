;; Configuration for rainbow (colored) brackets

;;; Code:
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(provide 'setup-rainbow-brackets)
