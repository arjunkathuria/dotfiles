;; Configuration for smart-mode-line

;;; Code:

(use-package highlight-indent-guides
  :init
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
)


(provide 'setup-hl-indent)
