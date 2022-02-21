;; Configuration for smart-mode-line

;;; Code:
(use-package smart-mode-line
  :init (add-hook 'after-init-hook 'sml/setup)
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'atom-one-dark)
  (column-number-mode t)
  (line-number-mode t)
;  (display-battery-mode t)
  )

;; (use-package smart-mode-line

;;   (setq sml/theme 'dark)
;;)

(provide 'setup-sml)
